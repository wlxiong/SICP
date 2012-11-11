; fast-prime?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
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

(search-for-primes 10)
(search-for-primes 20)
(search-for-primes 30)
(search-for-primes 40)
(search-for-primes 50)
(search-for-primes 60)
(search-for-primes 70)
(search-for-primes 80)
(search-for-primes 90)
(search-for-primes 100)
(search-for-primes 200)
(search-for-primes 300)
(search-for-primes 400)
(search-for-primes 500)
(search-for-primes 600)
(search-for-primes 700)
(search-for-primes 800)
(search-for-primes 900)
(search-for-primes 1000)
(search-for-primes 1100)
(search-for-primes 1200)
(search-for-primes 1300)
(search-for-primes 1400)
(search-for-primes 1500)
(search-for-primes 2000)

; 11 *** 1.0000000000000009e-2
; 23 *** .02999999999999997
; 31 *** .02999999999999997
; 41 *** .04999999999999999
; 53 *** .05999999999999994
; 61 *** .05999999999999994
; 71 *** .09999999999999998
; 83 *** .10000000000000009
; 97 *** .1100000000000001
; 101 *** .1100000000000001
; 211 *** .21999999999999997
; 307 *** .3799999999999999
; 401 *** .41999999999999993
; 503 *** .4899999999999993
; 601 *** .75
; 701 *** .8100000000000005
; 809 *** .8699999999999992
; 907 *** .9199999999999999
; 1009 *** .9600000000000009
; 1103 *** 1.4400000000000013
; 1201 *** 1.4800000000000004
; 1301 *** 1.5600000000000023
; 1409 *** 1.620000000000001
; 1511 *** 1.6400000000000006
; 2003 *** 1.8900000000000006
