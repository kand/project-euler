#lang racket

(define (multiple-of? x y) (= (modulo y x) 0))
(define (m3? x) (multiple-of? 3 x))
(define (m5? x) (multiple-of? 5 x))
(define (keep? x) (or (m3? x) (m5? x)))
(define (s x) (foldl + 0 (filter keep? (range 3 x))))