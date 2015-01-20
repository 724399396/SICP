#lang racket
(define (lookup given-key set-of-records)
  (if (null? set-of-records) 
      false
      (let ((entry-key (entry set-of-records)))
        (cond ((equals? given-key (key entry-key)) entry)
              ((> given-key (key entry-key)) lookup given-key (right-branch set-of-records))
              ((< given-key (key entry-key)) lookup given-key (left-branch set-of-records))))))