(import [matplotlib [pyplot :as plt]]
        [collections [Counter]]
        [random [randint]]
        [vec]
        [math [sqrt]])

(def num-friends
  (list-comp (randint 0 22) [i (range 204)]))

;; Needs a fix
(defn friends-histogram []
  (let [[friend-counts (Counter num-friends)]
        [xs (range 101)]
        [ys (list-comp (nth friend-counts x) [x xs])]]
    (plt.bar xs ys)
    (plt.axis [0 101 0 25])
    (plt.title "Histogram of Friend Counts")
    (plt.xlabel "# of friends")
    (plt.ylabel "# of people")
    (plt.show)))

(defn mean [x] (/ (sum x) (len x)))

(defn central-tendencies []
  (mean num-friends))

(defn median [v]
  "finds the 'middle-most' value of v"
  (let [[n (len v)]
        [sorted-v (sorted v)]
        [midpoint (// n 2)]]
    (if (= (% n 2) 1)
      (nth sorted-v midpoint)
      (let [[lo (- midpoint 1)]
            [hi midpoint]]
        (/ (+ (nth sorted-v lo) (nth sorted-v hi)) 2)))))

(defn quantile [x p]
  "returns the pth percentile value in x"
  (let [[p-index (int (* p (len x)))]]
    (nth (sorted x) p-index)))

(defn mode [x]
  "returns a list, possibly with multiple modes"
  (let [[counts (Counter x)]
        [max-count (max (.values counts))]]
    (list-comp xi [(, xi count) (.iteritems counts)] (= count max-count))))

(defn data-range [x]
  (- (max x) (min x)))

(defn de-mean [x]
  (let [[x-bar (mean x)]]
    (list-comp (- xi x-bar) [xi x])))

(defn variance [x]
  "assumes x has at least two elements"
  (let [[n (len x)]
        [deviations (de-mean x)]]
    (/ (vec.sum-of-squares deviations) (- n 1))))

(defn standard-deviation [x]
  (sqrt (variance x)))

(defn interquartile-range [x]
  (- (quantile x 0.75) (quantile x 0.25)))

(defn covariance [x y]
  (let [[n (len x)]]
    (/ (dot (de-mean x) (de-mean y)) (- n 1))))

(defn correlation [x y]
  (let [[stdev-x (standard-deviation x)]
        [stdev-y (standard-deviation y)]]
    (if (and (> stdev-x 0) (> stdev-y 0))
      (/ (/ (covariance x y) stdev-x) stdev-y)
      0)))
