(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))        ; compute p'
                   (+ (* q q) (* 2 (* p q)))  ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)
              )
        )
  )
)

(define (fib n)
  (fib-iter 1 0 0 1 n))

(fib 1)
(fib 2)
(fib 3)
(fib 5)
(fib 10)

; transformation T is linear and thus can be represented by a matrix
; then twice transformations are anology to matrix multiplication, T x T
(define (fib-mat-iter a b p q r s count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-mat-iter a
                       b
                       (+ (* p p) (* q r))
                       (+ (* p q) (* q s))
                       (+ (* r p) (* s r))
                       (+ (* r q) (* s s))
                       (/ count 2)))
        (else (fib-mat-iter (+ (* r b) (* s a))
                            (+ (* p b) (* q a))
                            p
                            q
                            r
                            s
                            (- count 1)
              )
        )
  )
)

(define (fib-mat n)
  (fib-mat-iter 1 0 0 1 1 1 n))

(fib-mat 1)
(fib-mat 2)
(fib-mat 3)
(fib-mat 5)
(fib-mat 10)
