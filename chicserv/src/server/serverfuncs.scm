(load "src/frame/frames.scm")

(define (handle-editor uri)
 (begin
  (send-response status: 'ok body: (editor))
  (print uri)))	

(define (handle-secret uri) 
 (begin
  (let ((name (cdar (uri-query uri))))
   (send-response status: 'ok body: (secret-index name)))
  (print uri)))

(define (useful-info)
 (begin
  (printf "Request from: ")
  (print (remote-address))))
 

