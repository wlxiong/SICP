(define (f g)
  (g 2))

(define (square x) x)

(f square)

(f f)

(f 2)

;; 2 is not applicable
(2 2)
