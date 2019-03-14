; Elements that appear in powerful programming languages:
; 1. Numbers and arithmetic operations are primitive data structures
(* 2 3)
; 2. Ability to combine operations (expressions)
(+ 1 (* 2 3))
; 3. Associate names with expressions/values as simple means of abstration
(define pi 3.14159)
(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))

; procedure definition
(define (square x) (* x x))
(square 21)
(square (* 2 3))
(square (square 4))

; Using already defined procedures as building blocks for new ones
; Compound procedures
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

; Conditional Expressions
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs 3)
(abs -10)

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))
(abs2 3)
(abs2 -10)

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))
(abs3 3)
(abs3 -10)

(define (check x) (and (> x 5) (< x 10)))
(check 8)
(check 12)
