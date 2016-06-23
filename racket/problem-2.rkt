#lang racket

(require "utils.rkt")

(define (fib i [h (make-hash)])
  (hash-ref! h i
    (if (> i 1)
      (lambda ()
        (define x-1 (- i 1))
        (define x-2 (- i 2))
        (+
          (hash-ref! h x-1 (fib x-1 h))
          (hash-ref! h x-2 (fib x-2 h))
        )
      )
      1
    )
  )
)

(define (solve)
  (define sum 0
  (for ([i (range 1 1000)])
    (define result (fib i))
    #:break (> result 4000000)
    (set! sum (+ sum (if (even? result) result 0)))
  )
  sum
)

(test-suite "Problem 2"
  (assert= "fib when given 1 should return 1" (fib 1) 1)
  (assert= "fib when given 2 should return 2" (fib 2) 2)
  (assert= "fib when given 3 should return 3" (fib 3) 3)
  (assert= "fib when given 4 should return 5" (fib 4) 5)
  (assert= "fib when given 5 should return 8" (fib 5) 8)
)

(solve)
