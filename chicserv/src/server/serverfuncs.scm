(load "src/frame/frames.scm")

(define (handle-editor uri)
 (begin
  (send-response status: 'ok body: (editor))
  (print uri)))	

(define (handle-callback uri)
 (begin
  (send-response status: 'ok body: (callback))
  (print uri)))

(define (handle-servmon uri)
  (begin
    (send-response status: 'ok body: (servmon))
    (print uri)))

(define (useful-info)
 (begin
  (printf "Request from: ")
  (print (remote-address))))

