#lang racket

(provide 
  dot->ref
  dot)

#|
GraphViz
|#

(define (not-newline? s) (not (eq? s "\n")))

;;
;; This defines a very simple Pollen interface to GraphViz
;; Requires `dot` available on $PATH.
;;

(define (dot->ref #:dir [dir "images"] 
                  #:css-class [css-class "dot"]
                  . digraph)
  (make-directory* dir)
  (define unique-name (gensym))
  (define g (string-append "digraph G {\n"
                           "bgcolor=\"#ffffff00\"\n"
                           (apply string-append digraph)
                           "\n}"))
  (define path (build-path dir (~a "dot_" unique-name ".dot")))
  (define object-path (build-path dir (~a "dot_" unique-name ".svg")))
  (with-output-to-file path (lambda() (printf g))
                       #:exists 'replace)
  (define dot-cmd (string-append "dot -Tsvg "
                                 (path->string path)
                                 " > "
                                 (path->string object-path)))
  (system dot-cmd)
  (path->string object-path))

(define (dot #:dir [dir "images"] 
             #:css-class [css-class "dot"]
             . digraph)
  (define object-path 
    (apply dot->ref #:dir dir
           #:css-class css-class
           digraph))
  `(object ((class ,css-class) (data ,object-path))))
