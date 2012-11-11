(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next x)
  (if (= x 2)
    3
    (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (even? x) (= (remainder x 2) 0))

(define (search-for-primes n)
  (define (try-prime x)
    (if (prime? x)
      (timed-prime-test x)
      (try-prime (+ x 2))))
  (if (even? n)
    (try-prime (+ n 1))
    (try-prime n)))

(search-for-primes 100)
(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)
(search-for-primes 10000000)
(search-for-primes 100000000)
(search-for-primes 1000000000)
(search-for-primes 10000000000)

; mit-scheme --quiet --load ex-1.23.scm
; 
; 101 *** 0.
; 1009 *** 0.
; 10007 *** 0.
; 100003 *** 0.
; 1000003 *** 0.
; 10000019 *** 1.0000000000000009e-2
; 100000007 *** 1.9999999999999962e-2
; 1000000007 *** .07
; 10000000019 *** .24
; ------------------------------------------------------------
