(load "spiffyframe.scm")

(define (rst) (load "spiffytest.scm"))

(define (handle-greeting uri)
 (begin
  (send-response status: 'ok body: (index))
  (print uri)))

(define (handle-secret uri) 
 (begin
  (let* ((name (cdar (uri-query uri))))
   (send-response status: 'ok body: (secret-index name))
   (print uri))))

(define (useful-info)
 (begin
  (printf "Request from: ")
  (print (remote-address))
  (printf "Secure connection: ")
  (print (secure-connection?))))
 

