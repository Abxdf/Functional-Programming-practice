#lang racket

(define (cont-frac num dr k)
  (define (iter n res)
    (if (> n k) res
        (iter (+ n 1) (/ 1.0 (+ 1 res)))))
  (iter 1 1)  
  )
(cont-frac (lambda(x) 1.0) (lambda(x) 1.0) 100)
(/ 1 1.6180)
(define (get-k guess)
  (define (good-enough? a b)  (< (abs (- a b)) 0.00001))
  (if 
   (good-enough?
    (cont-frac (lambda(x) 1.0) (lambda(x) 1.0) guess)
    (/ 1 1.6180))
   guess
   (get-k (+ 1 guess))))
(get-k 1)