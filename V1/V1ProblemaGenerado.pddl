(define (problem V1Problem) (:domain Redflix)

(:objects m1 m2 m3 m4 m5 m6 m7 - media
d0 d1 d2 d3 d4 d5 - day )

(:init
    (antecedent m4 m2)
    (antecedent m1 m4)
    (watched m3)
    (wantToWatch m2)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (dayNum d2) 2)
    (= (dayNum d3) 3)
    (= (dayNum d4) 4)
    (= (dayNum d5) 5)
)

(:goal (and (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))))

)