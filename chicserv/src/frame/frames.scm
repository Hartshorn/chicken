(load "src/frame/framefuncs.scm")

(define (rlf) (load "src/frame/frames.scm"))

(define (secret-index name)
 (let* ((doc (doc))
	(h (head title: "Error Page"))
	(b (body))
	(d1 (div id: "div1"))
	(message (string-append
		  "Hello, "
		  (->string name)
		  " from ChickServ!")))
  (string-append
   (car doc)
   h
   (car b)
   (element->add d1 message)
   (cdr b)
   (cdr doc))))

(define (index)
 (let* ((doc (doc))
	(h (head title: "ChickServ"))
	(b (body))
	(th1 "Column 1")
	(th2 "Column 2")
	(th3 "Column 3")
	(d1 (element->add 
	     (div id: "div" class: "u-pull-right rightnav")
	     "Chicken is so great!"))
	(d2 (element->add 
	     (div id: "div" class: "u-full-width")
	     "Great because"))
	(d3 (element->add 
	     (div id: "div" class: "u-pull-left leftnav")
	     "it is so simple..."))
	(table (make-table (list th1 th2 th3) (list d1 d2 d3))))
  (string-append
   (car doc)
   h
   (car b)
   table
   (cdr b)
   (cdr doc))))

