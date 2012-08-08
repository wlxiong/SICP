; Pascal's triangle
(define (find-row n r)
  (if (> n r)
    (find-row (- n r) (+ r 1))
    r
  )
)

(find-row 1 1)
(find-row 2 1)
(find-row 3 1)
(find-row 9 1)
(find-row 10 1)
(find-row 11 1)

(define (calc-term r c)
  (if (or (= c 1) (= c r))
    1
    (+ (calc-term (- r 1) (- c 1)) (calc-term (- r 1) c))
  )
)

(define (triangle n)
  (let ((row (find-row n 1)))
    (let ((col (- n (/ (* row (- row 1)) 2))))
      (calc-term row col)
    )
  )
)


(triangle 1)
(triangle 2)
(triangle 3)
(triangle 9)
(triangle 10)
(triangle 11)
