(define (problem V1Problem) (:domain Redflix)

(:objects m1 m2 m3 - media
d0 d1 - day )

(:init
    (antecedent m2 m1)
    (antecedent m3 m1)
    (wantToWatch m1)
    (watched m2)
    (= (numAntecedents m1) 2)
    (= (numAntecedents m2) 0)
    (= (numAntecedents m3) 0)
    (= (numAntecedentsAssignedOrWatched m1) 1)
    (= (numAntecedentsAssignedOrWatched m2) 0)
    (= (numAntecedentsAssignedOrWatched m3) 0)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (lastDayAntecedentAssignment m1) -1)
    (= (lastDayAntecedentAssignment m2) -1)
    (= (lastDayAntecedentAssignment m3) -1)
)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsignedToDay ?x)))
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (antecedent ?y ?x) (not (watched ?y))) (mediaAsignedToDay ?y))))
))

)
