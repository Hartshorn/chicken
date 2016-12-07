(use tcp)

(define-values (i o) (tcp-connect "localhost" 8000))

(write-line "goodbye from client!" o)
(print (read-line i))
