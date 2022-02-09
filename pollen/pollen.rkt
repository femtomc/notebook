#lang racket

(require
  pict
  racket/file
  setup/xref
  scribble/xref
  rackunit
  racket/string
  txexpr/base
  sugar/coerce
  pollen/core
  pollen/unstable/typography
  pollen/pagetree
  pollen/decode
  pollen/file
  pollen/tag
  sugar
  txexpr
  hyphenate)

(require "src/mathjax.rkt")
(require "src/latex.rkt")
(require "src/dot.rkt")

(provide (all-defined-out) 
         link
         highlight
         note
         hline
         $
         $$
         document-class
         use-package
         env
         latex->ref
         latex
         inline-math->ref 
         semantic
         dot->ref
         dot)

#|
`root` is the main decoder for our Pollen markup.
|#

(define exclusion-mark-attr '(decode "exclude"))
(define (root . items)
  (define title (match (select-from-metas 'title (current-metas))
                  [#f ""]
                  [a a]
                  )
    )
  (decode `(decoded-root 
             (h1 ,title)
             ,@items)
          #:txexpr-elements-proc detect-paragraphs 
          #:string-proc (compose1 smart-quotes smart-dashes)
          #:exclude-tags '(style script pre)
          #:exclude-attrs (list exclusion-mark-attr)))

(define (link url . text)
  `(a ((href ,url)) ,@text))

(define (xlink node)
  (define link (symbol->string node))
  (define title (select-from-metas 'title (string->symbol link)))
  `(span ((class "xlink"))
        (xlink ,link)
        (a ((class "xlink") (href ,link)) ,title)
        )
  )

(define (get-title node)
  (define m (get-metas node))
  (let ([c (select-from-metas 'title m)])
    (case c
      [(#f) #f]
      [else c]
      )
    )
  )

(define (get-node-title node)
  (define m (get-metas node))
  (let ([c (select-from-metas 'node-title m)])
    (case c
      [(#f) #f]
      [else c]
      )
    )
  )

(define (get-node-id node)
  (define m (get-metas node))
  (let ([c (select-from-metas 'node-id m)])
    (case c
      [(#f) #f]
      [else c]
      )
    )
  )

(define (find-xlinks node)
  (let ([c (select* 'xlink node)])
    (case c
      [(#f) #f]
      [else c]
      )
    )
  )

(define (generate-link-list node)
  (let ([ls (find-xlinks node)])
    (case ls
      [(#f) '()]
      [else (map 
              (lambda (n) (let ([title (get-node-title n)])
                            (case title
                              [(#f) '()]
                              [else title]
                              )
                            )
                )
              ls)
            ]
      )
    )
  )

(define (generate-link-graph node)
  (define title (match (get-node-title node)
                  [#f (get-title node)]
                  [a a]
                  )
    )
  (define id (number->string (equal-hash-code title)))
  (define graph-node 
    (string-append
      id
      "[target=\"_blank\" "
      "href=\"../"
      (symbol->string node)
      "\" "
      "label=\""
      title
      "\"];"
      )
    )
  (let ([ls (generate-link-list node)])
    (case ls
      [(#f) ""]
      [else (apply string-append graph-node (map
                                   (lambda (l)
                                     (string-append
                                       id
                                       "->"
                                       (number->string (equal-hash-code l))
                                       ";"
                                       )
                                     )
                                   ls))
            ]
      )
    )
  )

(define (cols . items)
  `(cols ((style "display:flex;")) ,@items))

(define (flex width . items)
  `(flexed ((style ,(string-append "flex:" (format "~a%" width))))
           ,@items))

(define hline `(hr))

(define (itemize . items)
  `(div ((class "itemize")) 
        (ol ,@(decode-paragraphs items 'li))
        )
  )

(define code-tag 'span)
(define code-class "code")
(define (code . elements)
  `(,code-tag ((class ,code-class) ,exclusion-mark-attr) ,@elements))

(define (highlight #:lang [lang "haskell"] . elements)
  `(div ((class "highlight")) (pre ((class ,code-class) ,exclusion-mark-attr) 
                                   (code ((class ,lang)) ,@elements)
                                   )
        )
  )

(define (note . elements)
  `(div ((class "note")) ,@elements))

(define (fig src . cap) `(figure (img ((src ,src)))
                                 (figcaption ,@cap)))
