(define (rlff) (load "framefuncs.scm"))


(define (doc)
 (cons
  (string-append
   "<!DOCTYPE html>"
   "<html>")
  "</html>"))

(define (head #!key (charset "\"utf-8\"")
		    (title "")
		    (meta-name "")
		    (meta-content "")
		    (link-rel "\"stylesheet\"")
		    (link-href "\"css/styles.css?v=1.0\""))
 (string-append
  "<head>"
  "<meta charset=" charset ">"
  "<title>" title "</title>"
  "<meta name=" meta-name "content=" meta-content ">"
  "<link rel=" link-rel "href=" link-href ">"
  "</head>"))

(define (body)
 (cons
  "<body>"
  "</body>"))

(define (div #!key (id "default") (class "default"))
 (cons
  (string-append
   "<div id=\"" 
   (->string id) 
   "\""
   " class=\""
   (->string class)
   "\">")
  "</div>"))

(define (div->add div content) 
 (string-append (car div) "<p>" content "</p>" (cdr div)))



