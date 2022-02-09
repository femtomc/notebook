#lang pollen

◊(define-meta template "index-template.html")

◊(require pollen/pagetree)
◊(require json)

◊note{This is a small knowledge base / personal wiki of notes and writings. The directed graph represents the wiki: the nodes are individual notes (or ◊i{zettel}, in ◊i{zettelkasten} style) and the directed edges are forward links from note to note.

◊h4{No claims are made as to the completeness of any of these zettels!}
}

◊(dot (apply string-append 
    "rankdir=TD;"
    "node [margin=0 fontsize=12 width=2.2 fixedsize=true 
           shape=rect style=filled];"
    (map generate-link-graph 
    (pagetree->list (get-pagetree "index.ptree")))))

◊hline

◊(apply ol (map (lambda (node) `(li (a ((href ,(symbol->string node)))
        ,(select-from-metas 'title node))))
        (pagetree->list (get-pagetree "index.ptree")))
)

◊(define index (make-hash))
◊(for-each
    (lambda (k)
        (let ([entry (make-hash)]
              [title (get-title k)]
              [desc (get-description k)])
            (hash-set! entry 'id (symbol->string k))
            (hash-set! entry 'title title)
            (hash-set! entry 'body desc)
            (hash-set! index k entry)
        )
    )
    (pagetree->list (get-pagetree "index.ptree"))
)

◊(write-json index (open-output-file "index.json" #:exists 'replace))
