; Note: The fun names in here refer to a figure in the
; chapter, so they can be called individually (since pyplot blocks).
; Also 31 refers to Figure 3.1, 32 to 3.2, etc.

(import [matplotlib [pyplot :as plt]])
(import [collections [Counter]])

;; Display a plain line chart of nominal GDP
(defn fig-31 []
  (let [[years [1950 1960 1970 1980 1990 2000 2010]]
        [gdp [300.2 543.3 1075.9 2862.5 5979.6 10289.7 14958.3]]]
    (plt.plot years gdp :color "green" :marker "o" :linestyle "solid")
    (plt.title "Nominal GDP")
    (plt.ylabel "Billions of $")
    (plt.show)))
  
;; Bar chart showing # of academy awards per movie
(defn fig-32 []
  (let [[movies ["Annie Hall" "Ben-Hur" "Casablanca" "Gandhi" "West Side Story"]]
        [num-oscars [5 11 3 8 10]]
        [xs (list-comp (+ i 0.1) [(, i _) (enumerate movies)])]]
    (plt.bar xs num-oscars)
    (plt.ylabel "# of Academy Awards")
    (plt.title "My Favorite Movies")
    (plt.xticks (list-comp (+ i 0.5) [(, i _) (enumerate movies)]) movies)
    (plt.show)))

;; Bar chart showing a histogram of exam grades
(defn fig-33 []
  (let [[grades [83 95 91 87 70 0 85 82 100 67 73 77 0]]
        [decile (fn [grade] (* (// grade 10) 10))]
        [histogram (Counter (list-comp (decile grade) [grade grades]))]]
    (plt.bar (list-comp (- x 4) [x (.keys histogram)]) (.values histogram) 8)
    (plt.axis [-5 105 0 5])
    (plt.xticks (list-comp (* 10 i) [i (range 11)]))
    (plt.xlabel "Decile")
    (plt.ylabel "# of Students")
    (plt.title "Distribution of Exam 1 Grades")
    (plt.show)))

;; Bar chart showing # of times 'data science' was heard, but with a dishonest y-axis
(defn fig-34 []
  (let [[mentions [500 505]]
        [years [2013 2014]]]
    (plt.bar [2012.6 2013.6] mentions 0.8)
    (plt.xticks years)
    (plt.ylabel "# of times I heard someone say 'data science'")
    (plt.ticklabel-format :useOffset false)
    (plt.axis [2012.5 2014.5 499 506])
    (plt.title "Look at the 'HUGE' increase!")
    (plt.show)))

;; As fig-34 but with an honest y-axis
(defn fig-35 []
  (let [[mentions [500 505]]
        [years [2013 2014]]]
    (plt.bar [2012.6 2013.6] mentions 0.8)
    (plt.xticks years)
    (plt.ylabel "# of times I heard someone say 'data science'")
    (plt.ticklabel-format :useOffset false)
    (plt.axis [2012.5 2014.5 0 550])
    (plt.title "Not So Huge Anymore")
    (plt.show)))

;; Multi-line chart showing bias-variance
(defn fig-36 []
  (let [[variance [1 2 4 8 16 32 64 128 256]]
        [bias-squared [256 128 64 32 16 8 4 2 1]]
        [total-error (list-comp (+ x y) [(, x y) (zip variance bias-squared)])]
        [xs (list-comp i [(, i _) (enumerate variance)])]]
    (plt.plot xs variance "g-" :label "variance")
    (plt.plot xs bias-squared "r-." :label "bias^2")
    (plt.plot xs total-error "b:" :label "total error")
    (plt.legend :loc 9)
    (plt.xlabel "model complexity")
    (plt.title "The Bias-Variance Tradeoff")
    (plt.show)))

;; Scatterplot showing friend-count vs time spent on a site
(defn fig-37 []
  (let [[friends [70 65 72 63 71 64 60 64 67]]
        [minutes [175 170 205 120 220 130 105 145 190]]
        [labels ["a" "b" "c" "d" "e" "f" "g" "h" "i"]]]
    (plt.scatter friends minutes)
    (for [(, label friend-count minute-count) (zip labels friends minutes)]
      (plt.annotate label :xy (, friend-count minute-count) :xytext (, 5 -5) :textcoords "offset points"))
    (plt.title "Daily Minutes vs. Number of Friends")
    (plt.xlabel "# of friends")
    (plt.ylabel "daily minutes spent on the site")
    (plt.show)))

;; Scatterplot with incomparable axes
(defn fig-38 []
  (let [[test1-grades [99 90 85 97 80]]
        [test2-grades [100 85 60 90 70]]]
    (plt.scatter test1-grades test2-grades)
    (plt.title "Axes Aren't Comparable")
    (plt.xlabel "test 1 grade")
    (plt.ylabel "test 2 grade")
    (plt.show)))

;; As fig-38 but with comparable axes
(defn fig-39 []
  (let [[test1-grades [99 90 85 97 80]]
        [test2-grades [100 85 60 90 70]]]
    (plt.scatter test1-grades test2-grades)
    (plt.axis "equal")
    (plt.title "Axes Aren't Comparable")
    (plt.xlabel "test 1 grade")
    (plt.ylabel "test 2 grade")
    (plt.show)))

