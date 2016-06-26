#lang racket

(require "utils.rkt")

(define (prime? x [h (make-hash)])
  (foldl
    (lambda (n result) (hash-ref! h n (and result (not (= (modulo x n) 0)))))
    #t
    (range 2 (+ 1 (/ x 2)))
  )
)

(test-suite "Problem 3"
  (assert-equal? "prime? when given 2 should return true" (prime? 2) #t)
  (assert-equal? "prime? when given 3 should return true" (prime? 3) #t)
  (assert-equal? "prime? when given 4 should return false" (prime? 4) #f)
  (assert-equal? "prime? when given 6 should return false" (prime? 6) #f)
  (assert-equal? "prime? when given 17 should return true" (prime? 17) #t)
)
