(define (problem basicProblem) (:domain Redflix)

(:objects m1 m2 - media
d0 d1 - day )

(:init
    (antecedent m1 m2)
    (wantToWatch m2)
    (= (numAntecedents m1) 0)
    (= (numAntecedents m2) 1)
    (= (numAntecedentsAssigned m1) 0)
    (= (numAntecedentsAssigned m2) 0)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (lastDayAntecedentAssignment m1) -1)
    (= (lastDayAntecedentAssignment m2) -1)
)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsignedToDay ?x)))
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
