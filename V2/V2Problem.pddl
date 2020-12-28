(define (problem V1Problem) (:domain Redflix)

(:objects m1 m2 m3 - media
d0 d1 - day )

(:init
    (wantToWatch m2)
    (antecedent m1 m2)
    (parallel m2 m3)
    (= (numAntecedents m1) 0)
    (= (numAntecedents m2) 1)
    (= (numAntecedents m3) 0)
    (= (numAntecedentsAssignedOrWatched m1) 0)
    (= (numAntecedentsAssignedOrWatched m2) 0)
    (= (numAntecedentsAssignedOrWatched m3) 0)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (lastDayAntecedentAssignment m1) -1)
    (= (lastDayAntecedentAssignment m2) -1)
    (= (lastDayAntecedentAssignment m3) -1)
    (= (firstDayParallelAssignment m1) 1000)
    (= (firstDayParallelAssignment m2) 1000)
    (= (firstDayParallelAssignment m3) 1000)

)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsignedToDay ?x)))
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (or (parallel ?x ?y) (parallel ?y ?x)) (not (watched ?y))  ) (mediaAsignedToDay ?y)) ) )
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (antecedent ?y ?x) (not (watched ?y))) (mediaAsignedToDay ?y))))
))

)
