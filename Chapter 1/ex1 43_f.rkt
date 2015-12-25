#lang racket

(define (repeated f n)
  (define (iter i)
    (lambda(x) 
      (cond ((= i 1) ((iter (+ i 1)) (f x)))
            ((< i n) ((iter (+ i 1)) (f x)))
            ((= i n) (f x))
          )))
  (iter 1))
((repeated (lambda(x) (* x x)) 2) 5)
