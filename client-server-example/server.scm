(use tcp)


(define l (tcp-listen 8080))

(define-values (i o) (tcp-accept l))

(write-line "hello from server!" o)
(print (read-line i))
(close-input-port i)
(close-output-port o)
