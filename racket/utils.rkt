#lang racket

(provide test-suite)
(provide assert)
(provide assert=)
(provide assert-equal?)

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

(define (assert name test [addErrorMsg ""])
  (lambda ()
    (define passed? (test))
    (display (string-append (if passed? "[PASS]" "[FAIL]") " " name))
    (if (and (not passed?) (non-empty-string? addErrorMsg))
      (display (string-append " : " addErrorMsg))
      #f
    )
    passed?
  )
)

(define (assert= name x y)
  (assert
    name
    (lambda () (= x y))
    (string-append "expected " (~a x) " to equal " (~a y))
  )
)

(define (assert-equal? name x y)
  (assert
    name
    (lambda () (equal? x y))
    (string-append "expected " (~a x) " to equal " (~a y))
  )
)
