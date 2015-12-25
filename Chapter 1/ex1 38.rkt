#lang racket
(define (print x) (display x) (newline))
(define (cont-frac num dr k)
  (print k)
  (define (iter n)
    (if (> n k) 0
        (/ (num n) (+ (dr n) (iter (+ n 1))))))
  (iter 1)  
  )
(define dr
(lambda(x) 
  (let ((rem (remainder x 3)))
    ;(begin (display rem) (newline))
    (if (or (= rem 1) (= rem 0)) 1
        (let ((mul (/ (abs (- x 2)) 3)))
          (begin (display mul) (newline)
          (* (+ 1 mul) 2) ))))))
(define  (nr x) 1.0)
(define (e)
  (+ 2 
 (cont-frac nr dr 10)))
(e)


        