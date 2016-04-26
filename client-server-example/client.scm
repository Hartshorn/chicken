(use tcp)

(define-values (i o) (tcp-connect "localhost" 8080))

(write-line "goodbye from client!" o)
(print (read-line i))
