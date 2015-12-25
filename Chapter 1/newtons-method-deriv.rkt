#lang racket

(define (deriv f)
  (lambda (x) 
    (let ((dx 0.00001))
      (/ (- (f (+ x dx)) (f x)) dx))))

(define (fixed-point f initial-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0000001))
  (let ((next (f initial-guess)))
    (begin (display initial-guess) (newline)
    (if (close-enough? initial-guess next)
        next
        (fixed-point f next)))))

(define (newton-transform g)
(fixed-point (lambda(x) (- x (/ (g x) ((deriv g) x))))
             1.0))
(define (sqrt x)
(newton-transform 
 (lambda(y) (- (* y y) x) 
                  ))
(sqrt 23)
