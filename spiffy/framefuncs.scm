(define (rlff) (load "framefuncs.scm"))

(define (div #!key (id 0))
 (cons
  (string-append
   "<div id=" (->string id) ">")
  "</div>"))

(define (body)
 (cons
  "<body>"
  "</body>"))

(define (head) (string-append
		  "<head>"
		  "<meta charset=\"utf-8\">"
		  "<title>Chicken Scheme</title>" 
		  "<meta name=\"author\" content=\"Chicken\">"  
		  "<link rel=\"stylesheet\" href=\"css/styles.css?v=1.0\">"  
		  "</head>"))

(define (page)
 (let*
  ((d (div id: "test"))
   (b (body))
   (pd (car d))
   (fd (cdr d))
   (pb (car b))
   (fb (cdr b)))
  (string-append 
   (head) 
   pb 
    pd 
     pd 
      pd 
      fd 
     fd 
    fd 
   fb)))
