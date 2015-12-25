#lang racket

(define (fixed-point f initial-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0000001))
  (let ((next (f initial-guess)))
    (begin (display initial-guess) (newline)
    (if (close-enough? initial-guess next)
        next
        (fixed-point f next)))))
(define (golden-ratio)
  (fixed-point (lambda(x) (+ 1 (/ 1 x))) 1.0))
(define (golden-ratio2)
  (fixed-point (lambda(x) (- (* x x) 1)) 2.0))
(golden-ratio)




