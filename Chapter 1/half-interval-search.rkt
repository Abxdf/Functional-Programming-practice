#lang racket

(define (search f neg-point pos-point)
  (define (abs a) (if (< a 0) (* -1 a) a))    
  (define (average a b) ( / (+ a b) 2))
  (define (good-enough? a b)
    (if ( < (abs (- a b)) 0.001) #t #f))
  (define (negative? a) (< a 0))
  (define (positive? a) (> a 0))
  (let ((mid-point (average neg-point pos-point)))
    (if good-enough? neg-point pos-point) mid-point
    (let ((test-value (f mid-point)))
        (cond ((negative? test-value)
               (search f mid-point pos-point))
              ((positive? test-value)
               (search f mid-point pos-point))
              (else midpoint)
              ))))
(define (half-interval f a b)
  (cond ((and (negative? (f a)) (positive? (f b))) 
         (search f a b))
        ((and (positive? (f a)) (negative? (f b))) 
         (search f b a))

                          
                          
        