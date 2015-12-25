#lang racket
(define (2-divisors-count n)
  (if (= (remainder n 2) 0) 
      (+ 1 (2-divisors-count (/ n 2.0)))
      0
      ))

(define (3-divisors-count n)
  (if (= (remainder n 3) 0) 
      (+ 1 (3-divisors-count (/ n 3.0)))
      0
      ))
(define (cons a b)
  ( * (expt 2 a ) (expt 3 b)))
(define (car z)
  (2-divisors-count z))
(define (cdr z)
  (3-divisors-count z))


(define z (cons 2 3 ))
z
(car z)
(cdr z)

