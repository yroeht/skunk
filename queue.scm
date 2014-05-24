(define (make-queue)
  (let ((front '()) (back '()))
    (lambda (cmd . element)
      (case cmd
      ('push (set! back (cons (car element) back)))
      ('peek (car back))
      ('empty (and (null? front) (null? back)))
      ('pop (begin (cond ((null? front)
                          (set! front (reverse back)) (set! back '())))
                   (let ((e (car front))) (set! front (cdr front)) e)))
      ('dump (begin (display front) (display (reverse back))))))))

(define q (make-queue))

;(q 'push 1)
;(q 'push 2)
;(q 'pop)
;(q 'push 3)
;(q 'push 4)
;(q 'dump)
