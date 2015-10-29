; General shenanigans from chapter 2: A Crash Course in Python

; Printing some numbers
(for [i [1 2 3 4 5]]
  (print i)
  (for [j [1 2 3 4 5]]
    (print j)
    (print (+ i j))
    (print i)
    (print "done looping")))

; Hy on terseness (meant to demonstrate parenthesized stuff, but moot)
(def long-winded-computation
  (+ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))

; Hy is already lists of lists of lists...
(def list-of-lists [[1 2 3] [4 5 6] [7 8 9]])
(def easier-to-read-list-of-lists
  [[1 2 3]
   [4 5 6]
   [7 8 9]])

(def two-plus-three (+ 2 3))

; Meant to demonstrate IndentationError in Python
; ...but N/A in Hy :D
(for [i [1 2 3 4 5]]
  (print i))

; Here is an import
(import re)
(def my-regex (.compile re "[0-9]+" (.I re)))

; Here is an import with an alias
(import [re :as regex])
(def my-regex (.compile regex "[0-9]+" (.I regex)))

(import [collections [defaultdict Counter]])
(def lookup (defaultdict int))
(def my-counter (Counter))

; Demonstrates name conflicts by bringing silly things into scope
; Also applicable in Hy :c
(def match 10)
(import [re [*]])
(print match)

;;; ARITHMETIC :D

(defn double [x] (* x 2))

(defn apply-to-one [f] (f 1))

(def my-double double)
(def x (apply-to-one my-double))
(def y (apply-to-one (fn [x] (+ x 4))))
; This is marked as a DONT in the book, but here, all it does is be inconvenient
(def another-double (fn [x] (* 2 x)))
; But still do this instead
(defn another-double [x] (* 2 x))

(defn my-print [[msg "my default message"]]
  (print msg))
(my-print "hello")
(my-print)


