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
  pollen/unstable/typography
  pollen/decode
  pollen/file
  pollen/tag
  sugar
  txexpr
  hyphenate)

(require "src/mathjax.rkt")
(require "src/latex.rkt")
(require "src/dot.rkt")
(require "src/sqlite.rkt")

(provide (all-defined-out) 
         link
         initialize-links-db
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

(define (link url . text)
  `(a ((href ,url)) ,@text))

#|
`root` is the main decoder for our Pollen markup.
|#

(define exclusion-mark-attr '(decode "exclude"))
(define (root . items)
  (decode `(decoded-root ,@items)
          #:txexpr-elements-proc detect-paragraphs 
          #:string-proc (compose1 smart-quotes smart-dashes)
          #:exclude-tags '(style script pre)
          #:exclude-attrs (list exclusion-mark-attr)))

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
