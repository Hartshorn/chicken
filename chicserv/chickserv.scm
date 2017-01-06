(use spiffy intarweb uri-common)

(load "src/server/serverfuncs.scm")

(define (rl) (load "chickserv.scm"))

(define (handle continue)
 (useful-info)
 (let* ((req (current-request))
	(uri (request-uri req)))
  (if (equal? (uri-path uri) '(/ "editor"))
   (handle-editor uri)
   (if (equal? (uri-path uri) '(/ "callback"))
    (handle-callback uri)
    (if (equal? (uri-path uri) '(/ "servmon"))
     (handle-servmon uri)
     (begin
      (print "callback request from browser:")
      (print uri)
      (continue)))))))

;; change this for the environment
(vhost-map `(("3.20.161.45" . ,handle)))

;; use this to compile and run
;;(start-server)
