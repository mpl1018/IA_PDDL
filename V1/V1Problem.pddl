(define (problem V1Problem) (:domain Redflix)

(:objects m1 m2 m3 m4 - media
d0 d1 d2 - day )

(:init
    (wantToWatch m4)
    (antecedent m3 m4)
    (antecedent m2 m3)
    (watched m1)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (dayNum d2) 2)
)



(:goal 
(and
    (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))
    (forall (?x - media)
        (forall (?y - media) 
            (and 
                (imply (and (wantToWatch ?x) (antecedent ?y ?x) (not (watched ?y))) (mediaAsigned ?y))
            )
        )
    )
)
)
)
