;;; this is a game written in chicken
(use srfi-1)

(define (rl) 
 ; make it easy to reload changes
 (load "game.scm"))

(define proto '())

(define (getvalue k p)
 ; only return the value for given key from prototype
 (let ((r (find 
           (lambda (lst) (eq? (car lst) k)) 
           p)))
  (and r (cdr r))))

(define (intro)
 ; print an intro line
 (write-line "Welcome to the game!"))

(define (getname p)
 ; get the name value
 (getvalue 'name p))

(define (changename! n p)
 ; change the value of name in prototype
 (set!
  (cdr
   (find 
    (lambda (lst) (eq? (car lst) 'name)) 
    p))
  n))

(define (entername)
 ; ask user for name to use
 (begin
  (write-line "what's your name?")
  (read-line)))

(define (gettype p)
 ; return the value of type in prototype
 (getvalue 'type p))

(define (changetype! t p)
 ; change the value of type in prototype
 (set!
  (cdr
   (find
    (lambda (lst) (eq? (car lst) 'type))
   p))
  t))

(define (entertype)
 ; ask user for type to use
 (begin
  (write-line "what type are you?")
  (read-line)))

(define (getenergy p)
 ; return value of energy in prototype
 (getvalue 'energy p))

(define (changeenergy! e p)
 ; change the value of energy in prototype
 (set!
  (cdr
   (find
    (lambda (lst) (eq? (car lst) 'energy))
    p))
  (+ (getenergy p) e)))

(define (getdirection p)
 ; return the value of direction in prototype
 (getvalue 'direction p))

(define (changedirection! d p)
 ; change the value of direction in prototype
 (set!
  (cdr
   (find
    (lambda (lst) (eq? (car lst) 'direction))
    p))
  d))

(ndefine (getalive p)
 (getvalue 'alive p))

(define (showproto p)
 (printf "Living: ~A~%Name: ~A~%Type: ~A~%Energy: ~A~%Direction: ~A~%"
  (or (and (getalive p) "Alive") "Dead")
  (getname p)
  (gettype p)
  (getenergy p)
  (getdirection p)))

(define (move p)
 ; move according to the direction
 (begin
  (or 
   (and 
    (< (getdirection p) 5) 
    (write-line "moved up"))
   (write-line "moved down"))
  (changeenergy! -1 p)))

(define (start) 
 ; initial game setup
 (begin
  (intro)
  (set! proto (alist-cons 'alive #t proto))
  (set! proto (alist-cons 'name (entername) proto))
  (set! proto (alist-cons 'type (entertype) proto))
  (set! proto (alist-cons 'energy 1000 proto))
  (set! proto (alist-cons 'direction 0 proto))))
