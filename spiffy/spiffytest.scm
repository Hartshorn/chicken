(use spiffy intarweb uri-common)
	(load "spiffyfunctions.scm")


(define (handle continue)
 (useful-info)
 (let* ((req (current-request))
	(uri (request-uri req)))
  (if (equal? (uri-path uri) '(/ "greeting"))
   (handle-greeting uri)
  (if (equal? (uri-path uri) '(/ "secret"))
   (handle-secret uri)
  (continue)))))

;; change this for the environment
(vhost-map `(("localhost" . ,handle)))



