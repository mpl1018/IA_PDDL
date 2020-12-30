(define (problem V3Problem) (:domain Redflix)

(:objects m1 m2 m3 m4 m5 - media
d0 d1 - day )

(:init
    (wantToWatch m5)
    (antecedent m1 m5)
    (antecedent m2 m5)
    (antecedent m3 m5)
    (antecedent m4 m5)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (C d0) 0)
    (= (dayAssignmentCount d1) 0)
    (= (firstDayParallelAssignment m1) 1000)
    (= (firstDayParallelAssignment m2) 1000)
    (= (firstDayParallelAssignment m3) 1000)
    (= (firstDayParallelAssignment m4) 1000)
    (= (firstDayParallelAssignment m5) 1000)


)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (or (parallel ?x ?y) (parallel ?y ?x)) (not (watched ?y))  ) (mediaAsigned ?y)) ) )
))

)
