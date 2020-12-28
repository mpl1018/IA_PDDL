(define (problem V1Problem) (:domain Redflix)

(:objects m1 m2 m3 - media
d0 d1 - day )

(:objects m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 - media
d0 d1 - day )

(:init
    (wantToWatch m4)
    (antecedent m1 m4)
    (antecedent m2 m4)
    (antecedent m3 m4)
    (parallel m4 m5) 
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (firstDayParallelAssignment m1) 1000)
    (= (firstDayParallelAssignment m2) 1000)
    (= (firstDayParallelAssignment m3) 1000)
    (= (firstDayParallelAssignment m4) 1000)
    (= (firstDayParallelAssignment m5) 1000)
    (= (firstDayParallelAssignment m6) 1000)
    (= (firstDayParallelAssignment m7) 1000)
    (= (firstDayParallelAssignment m8) 1000)
    (= (firstDayParallelAssignment m9) 1000)
    (= (firstDayParallelAssignment m10) 1000)
    (= (firstDayParallelAssignment m11) 1000)
    (= (firstDayParallelAssignment m12) 1000)
    (= (firstDayParallelAssignment m13) 1000)


)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (or (parallel ?x ?y) (parallel ?y ?x)) (not (watched ?y))  ) (mediaAsigned ?y)) ) )
))

)
