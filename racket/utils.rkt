#lang racket

(provide test-suite)
(provide assert)
(provide assert=)
(provide assert-equal)

(define (test-suite name . tests)
  (display (string-append name "\n"))
  (define passed 0)
  (for ([test tests])
    (display "\t")
    (if (test) (set! passed (+ passed 1)) 0)
    (display "\n")
  )
  (display 
    (string-append
      "Passed "
      (number->string passed)
      "/"
      (number->string (length tests))
      "\n"
    )
  )
)

(define (assert name test)
  (lambda ()
    (define passed? (test))
    (display (string-append (if passed? "[PASS]" "[FAIL]") " " name))
    passed?
  )
)

(define (assert= name x y)
  (assert name (lambda () (= x y)))
)

(define (assert-equal name x y)
  (assert name (lambda () (equal? x y)))
)

