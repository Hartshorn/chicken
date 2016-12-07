(define (fact n)
 (if (= n 0)
        1
        (* n (fact (- n 1)))))

(define (fib n)
 (if (or (= n 0) (= n 1))
  n
  (+ (fib (- n 1)) (fib (- n 2)))))

(define (getvalue)
 (let ((n (read)))
  n))

(define (getchoice)
 (let ((n (read-line)))
  n))

(define (main)
 (print "Enter a value:")
 (let ((value (getvalue)))
  (print "Fact or Fib?")
  (let ((forf (getchoice)))
   (if (equal? forf "fact")
    (print "The factorial of " value " is " (fact value))
    (print "The fibonacci number " value " is " (fib value)))))
   (main))

