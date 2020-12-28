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
    (parallel ?a - media ?b - media) ;a and b are parallel
    (wantToWatch ?a - media) ; user wants to watch a
    (watched ?a - media) ; a is already wathced
    (mediaAsignedToDay ?a - media)
)


(:functions ;todo: define numeric functions here
    (dayNum ?d - day)

    (lastDayAntecedentAssignment ?m - media)
    (numAntecedents ?m - media)
    (numAntecedentsAssignedOrWatched ?m - media)

    (firstDayParallelAssignment ?m - media)

)

;define actions here
(:action addAntecedentToWishList   
    :parameters (?a - media ?b - media)
    :precondition (and (antecedent ?a ?b)(wantToWatch ?b)(not(watched ?a)))
    :effect (wantToWatch ?a)    
)

(:action addParallelToWishList
    :parameters (?a - media ?b - media)
    :precondition (and (or (parallel ?a ?b)(parallel ?b ?a)) (wantToWatch ?a)(not (watched ?b)))
    :effect (and (wantToWatch ?b))
)

(:action addParallelToWishList2
    :parameters (?a - media ?b - media)
    :precondition (and (or (parallel ?a ?b)(parallel ?b ?a)) (wantToWatch ?b)(not (watched ?a)))
    :effect (and (wantToWatch ?a))
)



(:action asignMediaToDay
    :parameters (?a - media ?d - day)
    :precondition (and (wantToWatch ?a) (not (mediaAsignedToDay ?a)) (> (dayNum ?d) (lastDayAntecedentAssignment ?a)) (= (numAntecedents ?a) (numAntecedentsAssignedOrWatched ?a)) (<= (- (dayNum ?d) (firstDayParallelAssignment ?a)) 1))
    :effect (and (mediaAsignedToDay ?a)  
    (forall (?x - media) (when (antecedent ?a ?x) 
    (and (assign (lastDayAntecedentAssignment ?x) (dayNum ?d))
    (increase (numAntecedentsAssignedOrWatched ?x) 1))))
    
    (forall (?x - media) (when 
    (and (or (parallel ?a ?x) (parallel ?x ?a)) (> (firstDayParallelAssignment ?x) (dayNum ?d)))

    (assign (firstDayParallelAssignment ?x) (dayNum ?d))
    ))
    
    )

)
)