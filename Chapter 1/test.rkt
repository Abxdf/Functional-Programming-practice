#lang racket

(define (cont-frac num dr k)
  (define (iter n)
    (if (> n k) 0
        (/ (num k) (+ (dr k) (iter (+ n 1))))))
  (iter 1)  
  )
(cont-frac (lambda(x) 1.0) (lambda(x) 1.0) 100)
(/ 1 1.6180)
(define (get-k guess)
  (define (good-enough? a b)  (< (abs (- a b)) 0.0001))
  (if 
   (good-enough?
    (cont-frac (lambda(x) 1.0) (lambda(x) 1.0) guess)
    (/ 1 1.6180))
   guess
   (get-k (+ 1 guess))))
(get-k 1)