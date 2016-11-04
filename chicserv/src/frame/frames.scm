(load "framefuncs.scm")

(define (rlsf) (load "spiffyframe.scm"))

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


(define (index)
 (let* ((doc (doc))
	(h (head title: "Chicken Server"))
	(b (body))
	(d1 (div id: "div1" class: "u-pull-right rightnav"))
	(d2 (div id: "div2" class: "u-full-width"))
	(d3 (div id: "div3" class: "u-pull-left leftnav")))
  (string-append
   (car doc)
   h
   (car b)
   (div->add d1 "Chicken is so great!")
   (div->add d2 "This is another div.")
   (div->add d3 "and yet another.")
   (cdr b)
   (cdr doc))))
