(define (problem V1Problem) (:domain Redflix)

(:objects m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 - media
d0 d1 d2 d3 d4 - day )

(:init
    (antecedent m9 m7)
    (antecedent m3 m10)
    (antecedent m2 m8)
    (antecedent m2 m7)
    (antecedent m2 m11)
    (antecedent m2 m12)
    (antecedent m8 m7)
    (antecedent m4 m7)
    (antecedent m4 m12)
    (antecedent m11 m6)
    (antecedent m12 m6)
    (wantToWatch m6)
    (wantToWatch m9)
    (wantToWatch m11)
    (watched m2)
    (watched m10)
    (watched m13)
    (= (dayNum d0) 0)
    (= (dayNum d1) 1)
    (= (dayNum d2) 2)
    (= (dayNum d3) 3)
    (= (dayNum d4) 4)
)

(:goal (and (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))))

)