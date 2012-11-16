(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (func x)
  (/ (log 1000.0) (log x)))

(define (average x y)
  (/ (+ x y) 2))

(fixed-point (lambda (x)  (average (func x) x)) 2.0)

(fixed-point func 2.0)
