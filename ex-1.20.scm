(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Applicative-order evaluation

(display (gcd 400 509))

(display (gcd 206 40))

(gcd 40 (remainder 206 40))

(gcd 6 (remainder 40 6))

(gcd 4 (remainder 6 4))

(gcd 2 (remainder 4 2))

2

; http://www.billthelizard.com/2010/01/sicp-exercise-120-gcd.html

; We learned the rules for both applicative-order and normal-order evaluation back in SICP section 1.1.5 The Substitution Model for Procedure Application. We learned that under normal-order evaluation rules, the interpreter fully expands a procedure before reducing it. Operand expressions are substituted for parameters until an expression involving only primitive operators is reached. Under applicative-order rules, arguments are evaluated before operators are applied. This can often avoid multiple unnecessary evaluations of the same expression, which is one of the reasons why Lisp uses applicative-order evaluation.

; In section 1.1.6 Conditional Expressions and Predicates (see exercise 1.5) we're told to assume that the evaluation rule for the special form if is the same whether we use normal or applicative order evaluation. "The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression." We'll continue using this assumption until we're told otherwise.

; Normal-order evaluation

(gcd 206 40)

(gcd 40 (remainder 206 40))

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))

(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) 
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
