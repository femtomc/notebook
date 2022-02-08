#lang pollen

◊(define-meta template "template.html")

◊(require pollen/pagetree)

◊(apply ol (map (lambda (node) `(li (a ((href ,(symbol->string node)))
        ,(car (select-from-doc 'h1 node)))))
        (pagetree->list (get-pagetree "index.ptree")))
)
