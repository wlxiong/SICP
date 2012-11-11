; fast-prime?

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; timed-prime-test

(define times 128)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (fast-prime? n times)
      (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (even? x) (= (remainder x 2) 0))

(define (search-for-primes n)
  (define (try-prime x)
    (if (fast-prime? x times)
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

; mit-scheme --quiet --load ex-1.24.scm
; 
; 101 *** 0.
; 1009 *** 9.999999999999953e-3
; 10007 *** 1.0000000000000009e-2
; 100003 *** 9.999999999999953e-3
; 1000003 *** 2.0000000000000018e-2
; 10000019 *** 2.0000000000000018e-2
; 100000007 *** .02999999999999997
; 1000000007 *** 3.0000000000000027e-2
; 10000000019 *** 3.0000000000000027e-2
; ------------------------------------------------------------
