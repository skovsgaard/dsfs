(import math)

(defn vector-add [v w]
  "adds corresponding elements"
  (list-comp (+ vi wi) [(, vi wi) (zip v w)]))

(defn vector-subtract [v w]
  "subtracts corresponding elements"
  (list-comp (- vi wi) [(, vi wi) (zip v w)]))

(defn vector-sum [vecs]
  "sums all corresponding elements"
  (reduce vector-add vecs))

(defn scalar-multiply [c v]
  "c is a number (scalar) and v is a vector to be multiplied"
  (list-comp (* c vi) [vi v]))

(defn vector-mean [vecs]
  "computes the vector whose nth element
  is the mean of the nth element of the input vectors"
  (let [[n (len vecs)]]
    (scalar-multiply (/ 1 n) (vector-sum vecs))))

(defn dot [v w]
  "v1 * w1 + ... vn * wn"
  (sum (list-comp (* vi wi) [(, vi wi) (zip v w)])))

(defn sum-of-squares [v]
  "v1 * v1 + ... vn * vn"
  (dot v v))

(defn magnitude [v]
  (.sqrt math (sum-of-squares v)))

(defn squared-distance [v w]
  "v1 -w1 ** 2 + ... (vn - wn) ** 2"
  (sum-of-squares (vector-subtract v w)))

(defn distance [v w]
  (magnitude (vector-subtract v w)))
