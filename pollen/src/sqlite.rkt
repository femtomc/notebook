#lang racket

(provide initialize-links-db)

(define (initialize-links-db name)
  (define db-cmd (string-append "sqlite3 links.db "
                                (format "'create table \"~a\" (col0 text col1 text)'" name)
                                ))
  (system db-cmd)
  "")

