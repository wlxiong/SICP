(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter (term a))
          (combiner (term a)
                    (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (identity x) x)

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (if (= n 1)
      false
      (= n (smallest-divisor n))))

(define (sum-primes a b)
  (filtered-accumulate prime? + 0 identity a (lambda (x) (+ x 1)) b))

(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

(define (prod-relative-primes n)
  (define (filter i)
    (= 1 (gcd i n)))
  (filtered-accumulate filter * 1.0 identity 1 (lambda (x) (+ x 1)) (- n 1)))

(sum-primes 1 10)
(sum-primes 2 10)

(prod-relative-primes 6)
(prod-relative-primes 9)
(prod-relative-primes 10)
