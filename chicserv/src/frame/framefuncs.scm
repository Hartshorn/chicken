(define (rlff) (load "src/frame/framefuncs.scm"))


(define (doc)
 (cons
  (string-append
   "<!DOCTYPE html>"
   "<html>")
  "</html>"))

(define (header #!key (charset "\"utf-8\"")
		    (title "")
		    (meta-name "")
		    (meta-content "")
		    (link-rel "\"stylesheet\"")
		    (link-href "\"css/styles.css?v=1.0\"")
		    (link-script "\"scripts/chickserv.js\""))
 (string-append
  "<head>"
  "<meta charset=" charset ">"
  "<title>" title "</title>"
  "<meta name=" meta-name "content=" meta-content ">"
  "<link rel=" link-rel "href=" link-href ">"
  "<script src=" link-script "></script>"
  "</head>"))

(define (body)
 (cons
  "<body>"
  "</body>"))

(define (element name  #!key (id "default") (class "default"))
 (cons
  (string-append
   "<"
   (->string name)
   " id=\""
   (->string id)
   "\" class=\""
   (->string class)
   "\">")
  (string-append
   "</"
   (->string name)
   ">")))

(define (element->add element content) 
 (string-append 
  (car element) 
  (->string content) 
  (cdr element)))

(define (div #!key (id "") (class ""))
 (element "div" id: id class: class))

(define (table #!key (id "") (class ""))
 (element "table" id: id class: class))

(define (table-row #!key (id "") (class ""))
 (element "tr" id: id  class: class))

(define (table-header #!key (id "") (class ""))
 (element "th" id: id class: class))

(define (table-data #!key (id "") (class ""))
 (element "td" id: id class: class))

(define (make-table header data status)
 (let* ((table (table))
	(row1 (element->add (table-row) (make-header-list header)))
	(row2 (element->add (table-row) (make-data-list data)))
	(row3 (element->add (table-row) (make-data-list status))))
  (string-append
   (car table)
   row1
   row2
   row3
   (cdr table))))

(define (add-header content)
 (element->add (table-header) content))

(define (add-data content)
 (element->add (table-data) content))

(define (make-header-list header)
 (apply string-append
  (map add-header header)))

(define (make-data-list data)
 (apply string-append
  (map add-data data)))


(define (text-area #!key (rows "4") (cols "50") (id "textarea") (class "default"))
 (cons
  (string-append
   "<textarea rows=\""
   (->string rows)
   " cols=\""
   (->string cols)
   " id=\""
   (->string id)
   "\""
   " class=\""
   (->string class)
   " placeholder=\"Editor\""
   ">")
  "</textarea>"))
   
(define (button #!key (id "default") (class "button") (onclick "test()"))
 (cons
  (string-append
   "<button type=\"button\" value=\"test\" id=\""
   (->string id)
   "\" class=\""
   (->string class)
   "\" onclick=\""
   (->string onclick)
   "\">")
  "</button>"))

(define (create-button-div #!key 
	 (id "button") 
	 (class "button") 
	 (action "test()")
	 (label "TEST"))
 (string-append
  (car (button 
	id: id 
	class: class 
	onclick: action))
  label
  (cdr (button))))

(define (create-dropdown-div #!key
	 (id "dropdown")
	 (content "test"))
 (element->add
  (div id: id)
  content))

(define (create-button-string #!key
	 (id "test")
	 (class "test")
	 (content "content"))
 (string-append
  (car (button 
	id: id 
	class: class))
  content
  (cdr (button))))
