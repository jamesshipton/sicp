;;; Scheme code for Twenty-One Simulator [PS2 Fall '90]

(define (twenty-one player-strategy house-strategy)
  (let ((house-initial-hand (make-new-hand (deal))))
    (let ((player-hand
           (play-hand player-strategy
                      (make-new-hand (deal))
                      (hand-up-card house-initial-hand))))
      (if (> (hand-total player-hand) 21)
          0                                ; ``bust'': player loses
          (let ((house-hand
                 (play-hand house-strategy
                            house-initial-hand
                            (hand-up-card player-hand))))
            (cond ((> (hand-total house-hand) 21)
                   1)                      ; ``bust'': house loses
                  ((> (hand-total player-hand)
                      (hand-total house-hand))
                   1)                      ; house loses
                  (else 0)))))))           ; player loses

(define (play-hand strategy my-hand opponent-up-card)
  (cond ((> (hand-total my-hand) 21) my-hand) ; I lose... give up
        ((strategy my-hand opponent-up-card) ; hit?
         (play-hand strategy
                    (hand-add-card my-hand (deal))
                    opponent-up-card))
        (else my-hand)))                ; stay


(define (deal) (+ 1 (random 10)))

(define (make-new-hand first-card)
  (make-hand first-card first-card))

(define (make-hand up-card total)
  (cons up-card total))

(define (hand-up-card hand)
  (car hand))

(define (hand-total hand)
  (cdr hand))

(define (hand-add-card hand new-card)
  (make-hand (hand-up-card hand)
             (+ new-card (hand-total hand))))

(define (hit? your-hand opponent-up-card)
  (newline)
  (write "Opponent up card ")
  (write opponent-up-card)
  (newline)
  (write "Your Total: ")
  (write (hand-total your-hand))
  (newline)
  (write "Hit? ")
  (user-says-y?))


(define (user-says-y?) (eq? (read) 'y))

(define (stop_at total)
  (lambda(my_hand opponent_up_card)
    (< (hand-total my_hand) total)))

(define (test-strategy player-strategy house-strategy number)
  (if (eq? number 0) 0
      (+
       (twenty-one player-strategy house-strategy)
       (test-strategy player-strategy house-strategy (dec number)))))

(define (test-strategy player-strategy house-strategy number)
  (define (test-strategy-iter player-strategy house-strategy number total)
  (if (eq? number 0) total
      (test-strategy-iter player-strategy house-strategy (dec number)
                     (+ total (twenty-one player-strategy house-strategy)))))
  (test-strategy-iter player-strategy house-strategy number 0)
  )
