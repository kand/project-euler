#lang racket

(require "utils.rkt")

(define (fib i h)
  ;(display i) (display "\t") (display (hash-ref h i #f)) (display "\n")
  (hash-ref! h i
    (if (> i 1)
      (+ (fib (- i 1 ) h) (fib (- i 2) h))
      1
    )
  )
)

(define (fib/seq/evens i)
  (define h (make-hash))
  (map (lambda (i) (fib i h)) (filter even? (range 1 i)))
)

(define (solve)
  (foldl + 0 (fib/seq/evens 10))
)

(test-suite "Problem 2"
  (assert= "fib when given 1 should return 1" (fib 1) 1)
  (assert= "fib when given 2 should return 2" (fib 2) 2)
  (assert= "fib when given 3 should return 3" (fib 3) 3)
  (assert= "fib when given 4 should return 5" (fib 4) 5)
  (assert= "fib when given 5 should return 8" (fib 5) 8)
  (assert-equal "fib/seq/evens when given 5 should return '(2 5 13)" (fib/seq/evens 8) '(2 5 13))
)

(fib/seq/evens 40)
