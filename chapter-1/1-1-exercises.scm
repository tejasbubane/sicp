;; 1.1 - check result printed by these expressions
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

;; 1.2 - translate expression in prefix form
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;; 1.3 - Define a procedure that takes three numbers as arguments and returns the
;;       sum of squares of the two larger numbers
(define (sum-sq-two a b c)
  (define largest (max a b c))
  (define second-largest
    (cond ((= largest a) (max b c))
          ((= largest b) (max a c))
          (else (max a b))))
  (define (sq x) (* x x))
  (+ (sq largest) (sq second-largest)))
(sum-sq-two 4 2 3)
(sum-sq-two 8 5 10)

;; 1.4 - operators as compound expressions
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 1 (- 2))

;; 1.5 - Difference between normal & applicative ordering
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
;; (test 0 (p))
;; normal order evaluation -> expands then evals - so else part never evaluated
;; applicative order evaluation -> eval all args before expanding -
;; goes into infinite recursion with evaluation for (p)

;; 1.6 - If wrongly defined in terms of cond
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                     x)))
;; improve, average & good-enough? same as 1-1-code
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.0001))

(define (sqrt x)
  (new-sqrt-iter 1.0 x))
;; (sqrt 9)
;; this new-if tries to evaluate its args before passing to cond
;; so this `new-sqrt goes into infinite expansion

;; 1.7 - Use change delta for good-enough?
(define (sqrt-iter-delta guess x)
  (define new-guess (improve guess x))
  (if (good-enough-delta guess new-guess)
      new-guess
      (sqrt-iter-delta new-guess x)))
(define (good-enough-delta guess1 guess2)
  (< (abs (- guess1 guess2)) 0.0001))

(define (sqrt2 x)
  (sqrt-iter-delta 1.0 x))
(sqrt2 9)
(sqrt2 10000) ;; improved results for larger numbers

;; 1.8 - Newton's approximation for cube-roots
(define (cube-root-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cube-root-iter (improve-cube guess x)
                      x)))

(define (improve-cube y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

;; good-enough? of square cannot be reused since it squares the guess to check with x
(define (good-enough-cube? y x)
  (< (abs (- (* y y y) x)) 0.0001))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27)
(cube-root 1000000)
;; similar implementation can be made using delta check
;; analoguous to square-root implementation
