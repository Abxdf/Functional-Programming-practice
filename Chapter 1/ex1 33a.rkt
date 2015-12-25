#lang racket

(define (filtered-accumulate combiner null-value term a next b predicate?)
  ( if (> a b) null-value
       (if (predicate? a)
       (combiner (term a) 
                 (filtered-accumulate combiner null-value term (next a) 
                             next b predicate?))
       (filtered-accumulate combiner null-value term (next a) 
                             next b predicate?)
       )))

(define (prime? a) #t  ) ; define the function prime? 

(filtered-accumulate + 0 (lambda(x) (* x x)) a (lambda(x) (+ x 1) ) b prime?)



                                      
