; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>=3
(define (f n)
  (cond 
    ((< n 3) n)
    (else 
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
    )
  )
)

(f 1)
(f 3)
(f 5)
(f 10)

(define (f-iter n a b c)
  (if (= n 0) 
    a
    (f-iter (- n 1) (+ a (* 2 b) (* 3 c)) a b)
  )
)

(define (ff n)
  (if (< n 3)
    n
    (f-iter (- n 2) 2 1 0)
  )
)

(ff 1)
(ff 3)
(ff 5)
(ff 10)
