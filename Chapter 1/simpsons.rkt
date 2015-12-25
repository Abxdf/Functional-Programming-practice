#lang racket
(define (cube x ) (* x x x ))
(define (sum term a next b)
  ( if (> a b) 0
       (+ (term a) (sum term (next a) next b))))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (add-k a) (+ a (* 2 h)))
  (* (/ h 3.0) (+ (* 2 ( sum f (+ a (* 2 h)) add-k b))
                (* 4 (sum f (+ a h) add-k b))
                (f a)
                (f (+ a (* h n))))))
(simpsons cube 0 1 1000)
                

  
