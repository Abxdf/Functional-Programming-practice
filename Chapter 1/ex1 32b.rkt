#lang racket


(define (accumulate combiner null-value term a next b)
  (define (loop a res)
    (if (> a b) res
        (loop (next a) (combiner res a))))
  (loop a null-value))
(accumulate + 0 (lambda (x) x) 0 (lambda(x) (+ x 1 ) ) 10)