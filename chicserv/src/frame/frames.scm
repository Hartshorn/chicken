(load "src/frame/framefuncs.scm")

(define (rlf) (load "src/frame/frames.scm"))

(define editor-text-area 
 (text-area cols: "100" class: "textarea u-full-width"))

(define (editor)
 (let* ((filebutton (string-append
		     (car (button 
			   id: "filebutton"
			   class: "button" 
			   onclick: "filebuttonaction()"))
		     "File"
		     (cdr (button))))
	(filedropdown (element->add
		       (div id: "filedropdown")
		       "Test!"))
	(filemenu (element->add
		   (div id: "filemenu")
		   (string-append
		    filebutton filedropdown)))
	(editbutton (string-append
		     (car (button 
			   id: "editbutton"
			   class: "button"
			   onclick: "editbuttonaction()"))
		     "Edit"
		     (cdr (button))))
	(editdropdown (element->add
		       (div id: "editdropdown")
		       "Edit Test!"))
	(editmenu (element->add
		   (div id: "editmenu")
		   (string-append
		    editbutton editdropdown)))
	(optionbutton (string-append
		       (car (button 
			     id: "optionbutton"
			     class: "button" 
			     onclick: "optionbuttonaction()"))
		       "Option"
		       (cdr (button))))
	(optiondropdown (element->add
			 (div id: "optiondropdown")
			 "Option Test!"))
	(optionmenu (element->add
		     (div id: "optionmenu")
		     (string-append
		      optionbutton optiondropdown)))
	(statusbutton (string-append
		       (car (button 
			     id: "statusbar" 
			     class: "button statusbar"))
		       "123/456 ln,col status:green"
		       (cdr (button))))
	(filetree (string-append
		   (car (button 
			 id: "filetree" 
			 class: "button"))
		   "File"
		   (cdr (button))))
	(divtopright (element->add
		      (div id: "divtopright")
		      ""))
	(divtopleft (element->add
		     (div id: "divtopleft")
		     (string-append filemenu editmenu optionmenu)))
	(navigation (element->add
		     (div id: "navigation" class: "u-pull-right rightnav")
		     (string-append filetree)))
	(ed (element->add 
	       (div id: "editor") 
	       (string-append
		(car editor-text-area)
		(cdr editor-text-area))))
	(status (element->add
		 (div id: "statusbar" class: "statusbar")
		 statusbutton))
	(mid (string-append ed status))
	(table (make-table (list divtopright divtopleft) (list navigation mid))))
  (string-append
   (car (doc))
   (header title: "Chicken Editor")
   (car (body))
   table
   (cdr (body))
   (cdr (doc)))))



