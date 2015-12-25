#lang racket
(define (accumulator f null-value combiner)
  (lambda (a b)
      (if (> a b) null-value
        (combiner (f a) ((accumulator f null-value combiner) (+ a 1) b)))))

(define (sum-ints a b)
  ((accumulator (lambda(x) x) 0 +) a b))

(define (product-ints a b)
  ((accumulator (lambda(x) x) 1 *) a b))

(sum-ints 1 10)
(product-ints 1 10)