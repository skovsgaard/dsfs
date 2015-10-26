(defn shape [A]
  (let [[num-rows (len A)
         num-cols (if A
                    (len (car A))
                    0)]]
    (, num-rows num-cols)))

(defn get-row [A i]
  (nth A i))

(defn get-column [A j]
  (list-comp (nth Ai j) [Ai A]))

(defn make-matrix [num-rows num-cols entry-fn]
  "returns a num-rows by num-cols matrix
  whose '(i j)th entry is (entry-fn i j))"
  (list-comp
    (list-comp
      (entry-fn i j)
      [j (range num-cols)])
    [i (range num-rows)]))

(defn is-diagonal [i j]
  "1s on the diagonal; 0s everywhere else"
  (if (= i j) 1 0))
