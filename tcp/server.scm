(use tcp)

(define l (tcp-listen 8080))
(define-values (i o) (tcp-accept l))

(write-line "
