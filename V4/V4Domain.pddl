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
    (mediaAsigned ?a)
    (mediaAsignedToDay ?a - media ?d - day)
)


(:functions ;todo: define numeric functions here
    (dayNum ?d - day)
    (firstDayParallelAssignment ?m - media)
    (dayMinutesCount ?d - day)
    (mediaDuration ?m - media)
)

;define actions here
(:action addAntecedentToWishList   
    :parameters (?a - media ?b - media)
    :precondition (and (antecedent ?a ?b)(wantToWatch ?b)(not(watched ?a)))
    :effect (wantToWatch ?a)    
)

(:action addParallelToWishList2
    :parameters (?a - media ?b - media)
    :precondition (and (or (parallel ?a ?b)(parallel ?b ?a)) (wantToWatch ?b)(not (watched ?a)))
    :effect (and (wantToWatch ?a))
)


(:action asignMediaToDay
    :parameters (?a - media ?d - day)
    :precondition 
    (and (<= (+ (dayMinutesCount ?d) (mediaDuration ?a)) 200) (wantToWatch ?a) (not (mediaAsigned ?a)) (<= (- (dayNum ?d) (firstDayParallelAssignment ?a)) 1)
        (forall (?x - media) 
            (and 
                (imply (antecedent ?x ?a) (or (mediaAsigned ?x) (watched ?x)) ) 
                (forall (?dx - day) 
                    (imply (and (mediaAsignedToDay ?x ?dx) (antecedent ?x ?a) ) (< (dayNum ?dx) (dayNum ?d)))
                )
            )
        )
    )
    :effect 
    (and 
        (increase (dayMinutesCount ?d) (mediaDuration ?a)) (mediaAsignedToDay ?a ?d) (mediaAsigned ?a)
        (forall (?x - media) 
            (when 
                (and (or (parallel ?a ?x) (parallel ?x ?a)) (> (firstDayParallelAssignment ?x) (dayNum ?d)))
                (assign (firstDayParallelAssignment ?x) (dayNum ?d))
            )
        )
    )
)
)

