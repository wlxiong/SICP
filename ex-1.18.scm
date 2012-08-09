(define (double x)
  (* x 2)
)

(define (halve x)
  (/ x 2)
)

(define (even? n)
  (= (remainder n 2) 0)
)

(define (iter-multiply a b prod)
  (cond
    ((= b 0) prod)
    ((even? b) (iter-multiply (double a) (halve b) prod))
    (else (iter-multiply a (- b 1) (+ a prod)))
  )
)

(iter-multiply 2 3 0)
(iter-multiply 20 30 0)
(iter-multiply 200 300 0)
