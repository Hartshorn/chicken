(use spiffy intarweb uri-common)

(define (rst) (load "spiffytest.scm"))

(define (index) (string-append 
			"<!doctype html>"
			"<html lang=\"en\">"
			"<head>"
			"<meta charset=\"utf-8\">"
			"<title>Chicken Scheme</title>" 
			"<meta name=\"author\" content=\"Chicken\">"  
			"<link rel=\"stylesheet\" href=\"css/styles.css?v=1.0\">"  
			"</head>"  
			"<body>"
			"<header>"
			"chicken is the best!"
			"</header>"
			"<div>"
			"I mean, for real its super awesome."
			"</div>"
			"</body>"  
			"</html>"))

(define (secret-index name) (string-append 
			"<!doctype html>"
			"<html lang=\"en\">"
			"<head>"
			"<meta charset=\"utf-8\">"
			"<title>Chicken Secret</title>" 
			"<meta name=\"author\" content=\"Chicken\">"  
			"<link rel=\"stylesheet\" href=\"css/styles.css?v=1.0\">"  
			"</head>"  
			"<body>"
			"<header>"
			(->string name) " is the secret!"
			"</header>"
			"<div>"
			"I mean, for real its super secret."
			"</div>"
			"</body>"  
			"</html>"))

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

(define (handle continue)
 (useful-info)
 (let* ((req (current-request))
	(uri (request-uri req)))
  (if (equal? (uri-path uri) '(/ "greeting"))
   (handle-greeting uri)
  (if (equal? (uri-path uri) '(/ "secret"))
   (handle-secret uri)
  (continue)))))

(vhost-map `(("3.20.161.45" . ,handle)))



