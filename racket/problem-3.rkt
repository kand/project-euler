#lang racket

(require "utils.rkt")

(define (prime? x [h (make-hash)])
  (foldl
    (lambda (n result) (hash-ref! h n (and result (not (= (modulo x n) 0)))))
    #t
    (range 2 (+ 1 (/ x 2)))
  )
)

(define (factor? n x [h (make-hash)])
  (hash-ref! h n (= (modulo x n) 0))
)

(test-suite "Problem 3"
  (assert-equal? "prime? when given 2 should return true" (prime? 2) #t)
  (assert-equal? "prime? when given 3 should return true" (prime? 3) #t)
  (assert-equal? "prime? when given 4 should return false" (prime? 4) #f)
  (assert-equal? "prime? when given 6 should return false" (prime? 6) #f)
  (assert-equal? "prime? when given 17 should return true" (prime? 17) #t)
  (assert-equal? "factor? when given 3 and 9 should true" (factor? 3 9) #t)
  (assert-equal? "factor? when given 2 and 62 should true" (factor? 2 62) #t)
  (assert-equal? "factor? when given 3 and 4 should false" (factor? 3 4) #f)
)
