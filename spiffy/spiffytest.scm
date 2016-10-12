(use spiffy intarweb uri-common)
(require-extension regex)

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


;; the let* binding makes defined variables
;; available in the same let binding (so uri can be
;; used in th equal? statement)
(define (handle continue)
 (let* ((uri (request-uri (current-request))))
  (if (equal? (uri-path uri) '(/ "greeting"))
   (begin
    (send-response status: 'ok body: (index))
    (print uri))
  (if (equal? (uri-path uri) '(/ "secret"))
   (send-response status: 'ok body: (secret-index (drop (uri-query uri) 1)))
   (continue)))))

(vhost-map `(("localhost" . ,handle)))



