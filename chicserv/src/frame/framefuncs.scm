(define (rlff) (load "src/frame/framefuncs.scm"))


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

(define (element->add element content) 
 (string-append (car element) (->string content) (cdr element)))


(define (table #!key (id "") (class ""))
 (cons
  (string-append
   "<table id=\""
   (->string id)
   "\""
   " class=\""
   (->string class)
   "\">")
  "</table>"))

(define (table-row #!key (id "") (class ""))
 (cons
  (string-append
   "<tr id=\""
   (->string id)
   "\""
   " class=\""
   (->string class)
   "\">")
  "</tr>"))

(define (table-header #!key (id "") (class ""))
 (cons
  (string-append
   "<th id=\""
   (->string id)
   "\""
   " class=\""
   (->string class)
   "\">")
  "</th>"))

(define (table-data #!key (id "") (class ""))
 (cons
  (string-append
   "<td id=\""
   (->string id)
   "\""
   " class=\""
   (->string class)
   "\">")
  "</td>"))

(define (make-table header data)
 (let* ((table (table))
	(row1 (element->add (table-row) (make-header-list header)))
	(row2 (element->add (table-row) (make-data-list data))))
  (string-append
   (car table)
   row1
   row2
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

