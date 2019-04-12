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

;; Newtons approximation for square root
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.0001))

(define (square-root x)
  (sqrt-iter 1.0 x))

(square-root 9)
(square-root 10000)

;; local isolated procedures
(define (sqrt x)
  ;; x is already in scope of thes inner functions,
  ;; so we don't need to pass it anymore!
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1.0))

(sqrt 9)
(sqrt 10000)
(sqrt 1000000)
