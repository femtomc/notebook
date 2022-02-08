#lang pollen

◊(define-meta template "template.html")

◊(require pollen/pagetree)

◊h3{No claims are made as to the completeness of any of these zettels!}

◊(dot (apply string-append 
    "rankdir=TD;"
    "node [margin=0 fontsize=8 width=1.5 fixedsize=true shape=rect style=filled]";
    (map generate-link-graph 
    (pagetree->list (get-pagetree "index.ptree")))))

◊(apply ol (map (lambda (node) `(li (a ((href ,(symbol->string node)))
        ,(select-from-metas 'title node))))
        (pagetree->list (get-pagetree "index.ptree")))
)
