(use spiffy intarweb uri-common)

;;(load "src/server/serverfuncs.scm")

(define (rl) (load "as.scm"))

(define (handle continue)
 (let* ((req (current-request))
	(uri (request-uri req)))
  (if (equal? (uri-path uri) '(/ "doit"))
   (handle-it uri)
   (begin
    (print "callback:")
    (print uri)
    (continue)))))

;; change this for the environment
(vhost-map `(("3.20.161.45" . ,handle)))

;; use this to compile and run
;;(start-server)

(define (handle-it uri)
  (send-response status: 'ok body: (doit)))

(define (make-string pair)
  (string-append (car pair) (cdr pair)))

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
		    (link-script "\"scripts/as.js\""))
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

(define (document #!key (title "Default"))
 (cons
  (string-append
   (car (doc))
   (header title: title)
   (car (body)))
  (string-append
   (cdr (body))
   (cdr (doc)))))

(define (element name #!key (id "") (class ""))
  (cons
    (string-append
      "<" (->string name) " id=\"" (->string id) "\" class=\"" (->string class) "\">")
    (string-append
      "</" (->string name) ">")))






(define (doit)
(make-string (document)))
