; Miller-Rabin test

(define (expmod a n m)
  (cond ((= n 0)
          1)
        ((even? n)
          (let ((expm (expmod a (/ n 2) m)))
               (let ((rem (remainder (square expm) m)))
                    (if (and (not (= expm 1)) (not (= expm (- m 1))) (= rem 1))
                     0
                     rem))))
        (else
          (remainder (* a (expmod a (- n 1) m)) m))))

(define (miller-rabin-test n)
  (let ((rand (+ 1 (random (- n 1)))))
       (let ((expm (expmod rand (- n 1) n)))
            (if (= expm 1)
              true
              false))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
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

(define (search-for-primes n)
  (define (try-prime x)
    (if (fast-prime? x times)
      (timed-prime-test x)
      (try-prime (+ x 2))))
  (if (even? n)
    (try-prime (+ n 1))
    (try-prime n)))

(fast-prime? 561  times)
(fast-prime? 1105 times)
(fast-prime? 1729 times)
(fast-prime? 2465 times)
(fast-prime? 2821 times)
(fast-prime? 6601 times)

(search-for-primes 100)
(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)
(search-for-primes 10000000)
(search-for-primes 100000000)
(search-for-primes 1000000000)
(search-for-primes 10000000000)
(search-for-primes 100000000000)
(search-for-primes 1000000000000)
(search-for-primes 10000000000000)

; 101 *** 9.999999999999981e-3
; 1009 *** 1.0000000000000009e-2
; 10007 *** 1.9999999999999962e-2
; 100003 *** 2.0000000000000018e-2
; 1000003 *** 3.0000000000000027e-2
; 10000019 *** 3.0000000000000027e-2
; 100000007 *** 3.0000000000000027e-2
; 1000000007 *** 3.9999999999999925e-2
; 10000000019 *** 4.0000000000000036e-2
; 100000000003 *** 4.0000000000000036e-2
; 1000000000039 *** 5.0000000000000044e-2
; 10000000000037 *** 5.0000000000000044e-2
