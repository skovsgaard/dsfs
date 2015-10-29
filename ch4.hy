;; We'll keep these two libraries separate because the book warns
;; that they'll be used throughout the book.
(import [vec :as vec]
        [matrix :as mat])

(def identity-matrix
  (.make-matrix mat 5 5 mat.diagonal?))

(defmain [&rest args]
  (print identity-matrix))
