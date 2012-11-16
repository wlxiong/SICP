(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 0.0))

(define (cont-frac n d k)
  (define (frac i)
    (if (> i k)
        0.0
        (/ (n i)
           (+ (d i) (frac (+ i 1))))))
  (frac 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           1)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
