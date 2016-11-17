(load "src/frame/frames.scm")

(define (handle-editor uri)
 (begin
  (send-response status: 'ok body: (editor))
  (print uri)))	

(define (useful-info)
 (begin
  (printf "Request from: ")
  (print (remote-address))))
 

