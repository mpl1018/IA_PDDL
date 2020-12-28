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
    (mediaAsignedToDay ?a - media)
)


(:functions ;todo: define numeric functions here
    (dayNum ?d - day)
    (lastDayAntecedentAssignment ?m - media)
    (numAntecedents ?m - media)
    (numAntecedentsAssignedOrWatched ?m - media)
)

;define actions here
(:action addAntecedentToWishList   
    :parameters (?a - media ?b - media)
    :precondition (and (antecedent ?a ?b)(wantToWatch ?b)(not(watched ?a)))
    :effect (wantToWatch ?a)    
)

(:action asignMediaToDay
    :parameters (?a - media ?d - day)
    :precondition (and (wantToWatch ?a) (not (mediaAsignedToDay ?a)) (> (dayNum ?d) (lastDayAntecedentAssignment ?a)) (= (numAntecedents ?a) (numAntecedentsAssignedOrWatched ?a)))
    :effect (and (mediaAsignedToDay ?a)  
    (forall (?x - media) (when (antecedent ?a ?x) 
    (and (assign (lastDayAntecedentAssignment ?x) (dayNum ?d))
    (increase (numAntecedentsAssignedOrWatched ?x) 1)))))
)

)