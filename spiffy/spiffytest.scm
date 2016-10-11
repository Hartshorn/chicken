(use spiffy intarweb uri-common)

(define (rst) (load "spiffytest.scm"))

(define (index name) (string-append 
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
			name " is the best!"
			"</header>"
			"<div>"
			"I mean, for real its super awesome."
			"</div>"
			"</body>"  
			"</html>"))

;; the let* binding makes defined variables
;; available in the same let binding (so uri can be
;; used in th equal? statement)
(define (handle-greeting continue)
 (let* ((uri (request-uri (current-request))))
  (if (equal? (uri-path uri) '(/ "greeting" name))
   (send-response status: 'ok body: (index name))
   (continue))))

(vhost-map `(("localhost" . ,handle-greeting)))



