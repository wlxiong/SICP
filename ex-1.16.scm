(define (even? n)
  (= (remainder n 2) 0)
)

(define (square x)
  (* x x)
)

(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))

(define (iter-exp b n prod)
  (cond
    ((= n 0) prod)
    ((even? n) (iter-exp (* b b) (/ n 2) prod))
    (else (iter-exp b (- n 1) (* b prod)))
  )
)

(iter-exp 1 2 1)
(iter-exp 2 2 1)
(iter-exp 5 2 1)
