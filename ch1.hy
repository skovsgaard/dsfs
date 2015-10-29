(import [__future__ [division]]) ; HyLang importer bug means we get stopped dead here.
                                 ; Comment the above out to run this with the broken integer division on.

(def users [{:id 0 :name "Hero"}
            {:id 1 :name "Dunn"}
            {:id 2 :name "Sue"}
            {:id 3 :name "Chi"}
            {:id 4 :name "Thor"}
            {:id 5 :name "Clive"}
            {:id 6 :name "Hicks"}
            {:id 7 :name "Devin"}
            {:id 8 :name "Kate"}
            {:id 9 :name "Klein"}])

(def friendships [(, 0 1) (, 0 2) (, 1 2) (, 1 3) (, 2 3) (, 3 4)
                  (, 4 5) (, 5 6) (, 5 7) (, 6 8) (, 7 8) (, 8 9)])

(for [user users]
  (assoc user "friends" []))

(for [(, i j) friendships]
  (assoc (nth users i) "friends" (nth users j))
  (assoc (nth users j) "friends" (nth users i)))

(defn num-friends [user]
  (len (get user "friends")))

(def total-conns
  (sum (list-comp (num-friends user) [user users])))

(def num-users (len users))

(def avg-conns (/ total-conns num-users))

(def num-friends-by-id
  (list-comp
    (, (get user :id) (num-friends user))
    [user users]))
