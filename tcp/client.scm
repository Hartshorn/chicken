(use tcp)

(define-values (i o)
 (tcp-connect "localhost" 8080)
 (write-line "Client Goodbye!" o)
 (print (read-line i)))


