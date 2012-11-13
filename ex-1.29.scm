(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (+ a 1) next b))))

(define (const i n)
  (cond ((= i 0) 1)
        ((= i n) 1)
        ((= (remainder i 2) 1) 4)
        (else 2)))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (term i)
      (* (const i n) (f (+ a (* i h)))))
    (* (/ h 3) (sum term 0 (lambda (i) (+ i 1)) n))))

(define (cube x) (* x x x))

(define (quad x) (* x (cube x)))

(define (square x) (* x x))

(simpson square 0 2 4)

(simpson square 0 2 6)

(/ (cube 2) 3)
