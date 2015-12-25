#lang racket

(define (smooth f)
  (define (average3 a b c) (/ (+ a b c) 3))
  (let ((dx 0.01))
    (lambda(x)
      (average3 (f (- x dx)) (f x) (f (+ x dx))))))

(define (repeated f n)
  (define (iter i)
    (lambda(x) 
      (cond ((= i 1) ((iter (+ i 1)) (f x)))
            ((< i n) ((iter (+ i 1)) (f x)))
            ((= i n) (f x))
          )))
  (iter 1))

(define (repeated-smooth f n)
    ((repeated smooth n) f))
((repeated-smooth (lambda(x)(* x x)) 10)4)

