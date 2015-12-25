#lang racket

(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define (fixed-point f initial-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0000001))
  (let ((next (f initial-guess)))
    (begin #|(display initial-guess) (newline)|#
    (if (close-enough? initial-guess next)
        next
        (fixed-point f next)))))

(define (nth-root n x)
  (fixed-point 
   (average-damp (lambda(y) (/ x (expt y (- n 1)))))
   1.0))

(nth-root 2 23)
(nth-root 3 23)
(nth-root 4 23)