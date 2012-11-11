; fast-expt

(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; fast-prime?

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

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

; mit-scheme --quiet --load ex-1.25.scm
; 
; 101 *** 0.
; 1009 *** 2.0000000000000018e-2
; 10007 *** 1.8499999999999996
; ^C^C^C
; 
; ;Quit!
; 
; ------------------------------------------------------------

; The answer is buried in a footnote to the expmod code (#46).
; The reduction steps in the cases where the exponent e is greater than 1 are based on the fact that, for any integers x, y, and m, we can find the remainder of x times y modulo m by computing separately the remainders of x modulo m and y modulo m, multiplying these, and then taking the remainder of the result modulo m. For instance, in the case where e is even, we compute the remainder of be/2 modulo m, square this, and take the remainder modulo m. This technique is useful because it means we can perform our computation without ever having to deal with numbers much larger than m.
