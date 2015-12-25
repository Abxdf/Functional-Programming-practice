#lang racket

(define (filtered-accumulate combiner null-value term a next b predicate?)
    
  ( if (> a b) null-value
       (if (predicate? a b)
       (combiner (term a) 
                 (filtered-accumulate combiner null-value term (next a) 
                             next b predicate?))
       (filtered-accumulate combiner null-value term (next a) 
                             next b predicate?)
       )))
(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))
(define (co-prime? a b)
  (if (= (gcd a b) 1) #t #f))



(filtered-accumulate cons '() (lambda(x) x) 1 (lambda(x) (+ x 1) ) 100 co-prime?)



                                      
