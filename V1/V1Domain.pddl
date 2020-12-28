(define (domain Redflix)

;remove requirements that are not needed
(:requirements :typing :negative-preconditions :adl)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    media 
    day
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (antecedent ?a - media ?b - media) ;a is an antecedent of b
    (wantToWatch ?a - media) ; user wants to watch a
    (watched ?a - media) ; a is already wathced
    (mediaAsigned ?a)
    (mediaAsignedToDay ?a - media ?d - day) 
)


(:functions ;todo: define numeric functions here
    (dayNum ?d - day)
)

;define actions here
(:action addAntecedentToWishList   
    :parameters (?a - media ?b - media)
    :precondition (and (antecedent ?a ?b)(wantToWatch ?b)(not(watched ?a)))
    :effect (wantToWatch ?a)    
)

(:action asignMediaToDay
    :parameters (?a - media ?d - day)
    :precondition 
    (and (wantToWatch ?a) (not (mediaAsigned ?a)) 
        (forall (?x - media) 
            (and 
                (imply (antecedent ?x ?a) (or (mediaAsigned ?x) (watched ?x)) ) 
                (forall (?dx - day) 
                    (imply (and (mediaAsignedToDay ?x ?dx) (antecedent ?x ?a) ) (< (dayNum ?dx) (dayNum ?d)))
                )
            )
        )
    )
    :effect (and (mediaAsignedToDay ?a ?d) (mediaAsigned ?a)))
)