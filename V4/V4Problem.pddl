(define (problem V4Problem) (:domain Redflix)

(:objects m1 m2 m3 - media
d0 d1 - day )

(:init
    (wantToWatch m3)
    (antecedent m1 m3)
    (antecedent m2 m3)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (dayMinutesCount d0) 0)
    (= (dayMinutesCount d1) 0)
    (= (mediaDuration m1) 100)
    (= (mediaDuration m2) 101)
    (= (mediaDuration m3) 100)
    (= (firstDayParallelAssignment m1) 1000)
    (= (firstDayParallelAssignment m2) 1000)
    (= (firstDayParallelAssignment m3) 1000)


)

(:goal (and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))
    (forall (?x - media) (forall (?y - media) (imply (and (wantToWatch ?x) (or (parallel ?x ?y) (parallel ?y ?x)) (not (watched ?y))  ) (mediaAsigned ?y)) ) )
))

)
