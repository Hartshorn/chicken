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

(define (editor)
 (let* ((doc (doc))
	(h (head title: "Chicken Editor"))
	(b (body))
	(edarea (text-area cols: "100" class: "textarea u-full-width"))
	(editor 
	 (string-append
	  (car edarea) (cdr edarea)))
	(fbut (string-append
	       (car (button onclick: "filebuttonaction()"))
	       "File"
	       (cdr (button))))
	(fdpdwn (element->add
		 (div id: "fdrpdwn")
		 "Test!"))
	(fmenu (element->add
		(div id: "dpdwcont")
		(string-append
		 fbut fdpdwn)))
	(ebut (string-append
	       (car (button onclick: "editbuttonaction()"))
	       "Edit"
	       (cdr (button))))
	(edpdwn (element->add
		 (div id: "edrpdwn")
		 "Edit Test!"))
	(emenu (element->add
		(div id: "dpdwcont")
		(string-append
		 ebut edpdwn)))
	(obut (string-append
	       (car (button onclick: "optionbuttonaction()"))
	       "Option"
	       (cdr (button))))
	(odpdwn (element->add
		 (div id: "odrpdwn")
		 "Option Test!"))
	(omenu (element->add
		(div id: "opdwcont")
		(string-append
		 obut odpdwn)))
	(statbut (string-append
		  (car (button id: "statusbar" class: "button statusbar"))
		  "123/456 ln,col status:green"
		  (cdr (button))))
	(filetree (string-append
		   (car (button id: "filetree" class: "button"))
		   "File"
		   (cdr (button))))
	(divtopr (element->add
		  (div id: "divtopr")
		  ""))
	(divtopl (element->add
		  (div id: "divtopl")
		  (string-append fmenu emenu omenu)))
	(nav (element->add
	       (div id: "navigation" class: "u-pull-right rightnav")
	       (string-append filetree)))
	(ed (element->add 
	       (div id: "editor") 
	       editor))
	(stat (element->add
	       (div id: "statusbar" class: "statusbar")
	       statbut))
	(mid (string-append ed stat))
	(table (make-table (list divtopr divtopl) (list nav mid))))
  (string-append
   (car doc)
   h
   (car b)
   table
   (cdr b)
   (cdr doc))))



