#lang racket

(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define (fixed-point f initial-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0000001))
  (let ((next (f initial-guess)))
    (begin (display initial-guess) (newline)
    (if (close-enough? initial-guess next)
        next
        (fixed-point f next)))))

(define (cube-root x)
  (fixed-point 
   (average-damp (lambda(y) (/ x (* y y))))
   1.0))
(cube-root 64)