#lang racket
(define (cont-frac num dr k)
  (define (iter n)
    (if (> n k) 0
        (/ (num n) (+ (dr n) (iter (+ n 1))))))
  (iter 1))

(define (nr x)
  (lambda(y)
  (if (= y 1) x ( * -1 (* x x)))))

(define (dr i)
  (- (* 2 i ) 1.0))

(define (tan-cf x k)
  (cont-frac (nr x) dr k))
(tan-cf (/ 22 28) 10000)
(tan-cf (/ 22 28) 1000)
(tan-cf (/ 22 28) 100)
(tan-cf (/ 22 28) 10)
(tan-cf (/ 22 28) 1)
