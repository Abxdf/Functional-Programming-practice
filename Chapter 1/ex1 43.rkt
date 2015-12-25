#lang racket

(define (compose f g)
  (lambda(x)
  (f (g x))))

(define (repeated f n)
  (define (iter i)
    (if (= i n) f
        (compose f (iter (+ i 1)))))
  (iter 1)
  )
((repeated (lambda(x) (* x x)) 2) 5)
                  