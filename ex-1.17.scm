(define (double x)
  (* x 2)
)

(define (halve x)
  (/ x 2)
)

(define (even? n)
  (= (remainder n 2) 0)
)

(define (multiply a b)
  (cond
    ((= b 0) 0)
    ((even? b) (double (multiply a (halve b))))
    (else (+ a (multiply a (- b 1))))
  )
)

(multiply 2 3)
(multiply 20 30)
(multiply 200 300)
