(define (product term a next b)
  (if (> a b)
      1.0
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (* (term a) result)))))

(define (factorial n)
  (define (identity x) x)
  (product identity 1 (lambda (x) (+ x 1)) n))

(define (pi n)
  (define (frac x y)
    (/ x y))
  (define (term i)
    (if (even? i)
        (frac i (+ i 1))
        (frac (+ i 1) i)))
  (* 4 (product term 2 (lambda (x) (+ x 1)) n)))

(factorial 1)
(factorial 3)
(factorial 5)

(pi 1)
(pi 5)
(pi 100)
(pi 1000)
