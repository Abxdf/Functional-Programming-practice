#lang racket
(define (iterative-improve good-enough? improve-guess)
  (define (iterate guess)
    (if (good-enough? guess) guess
        (iterate (improve-guess guess))))
  iterate 
  )

(define (fixed-point f)
  (lambda(guess)
  (define (good-enough? guess)
    (let ((next (f guess)))
      (< (abs (- next guess)) 0.001)))
  (define (improve-guess guess)
    (f guess))
  ((iterative-improve good-enough? improve-guess) guess)))

((fixed-point (lambda(x) (+ (sin x) (cos x) ))) 2.0)

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- x (* guess guess))) 0.001))
  (define (average a b) (/ (+ a b) 2))
  (define (improve-guess guess) 
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve-guess) 1.0))
(sqrt 10)
