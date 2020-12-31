(define (problem V3Problem) (:domain Redflix)

(:objects m1 m2 m3 m4 m5 m6 m7 m8 - media
d0 d1 d2 d3 d4 - day )

(:init
    (antecedent m1 m3)
    (antecedent m3 m2)
    (antecedent m8 m7)
    (wantToWatch m1)
    (wantToWatch m8)
    (watched m3)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (dayNum d2) 2)
    (= (dayNum d3) 3)
    (= (dayNum d4) 4)
    (= (dayAssignmentCount d0) 0)
    (= (dayAssignmentCount d1) 1)
    (= (dayAssignmentCount d2) 2)
    (= (dayAssignmentCount d3) 3)
    (= (dayAssignmentCount d4) 4)
    (= (firstDayParallelAssignment m1) 1000)
    (= (firstDayParallelAssignment m2) 1000)
    (= (firstDayParallelAssignment m3) 1000)
    (= (firstDayParallelAssignment m4) 1000)
    (= (firstDayParallelAssignment m5) 1000)
    (= (firstDayParallelAssignment m6) 1000)
    (= (firstDayParallelAssignment m7) 1000)
    (= (firstDayParallelAssignment m8) 1000)
)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (or (parallel ?x ?y) (parallel ?y ?x)) (not (watched ?y))  ) (mediaAsigned ?y)) ) )
))

)