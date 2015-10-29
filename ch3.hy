(import [matplotlib [pyplot :as plt]])
(import [collections [Counter]])

; Note: The fun names in here refer to a figure in the
; chapter, so they can be called individually (since pyplot blocks).
; Also 31 refers to Figure 3.1, 32 to 3.2, etc.

(defn fig-31 []
  (let [[years [1950 1960 1970 1980 1990 2000 2010]]
        [gdp [300.2 543.3 1075.9 2862.5 5979.6 10289.7 14958.3]]]
    (plt.plot years gdp :color "green" :marker "o" :linestyle "solid")
    (plt.title "Nominal GDP")
    (plt.ylabel "Billions of $")
    (plt.show)))
  

(defn fig-32 []
  (let [[movies ["Annie Hall" "Ben-Hur" "Casablanca" "Gandhi" "West Side Story"]]
        [num-oscars [5 11 3 8 10]]
        [xs (list-comp (+ i 0.1) [(, i _) (enumerate movies)])]]
    (plt.bar xs num-oscars)
    (plt.ylabel "# of Academy Awards")
    (plt.title "My Favorite Movies")
    (plt.xticks (list-comp (+ i 0.5) [(, i _) (enumerate movies)]) movies)
    (plt.show)))

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

