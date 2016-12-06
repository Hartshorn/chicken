(load "src/frame/framefuncs.scm")

(define editor-text-area 
 (text-area cols: "100" class: "textarea u-full-width"))

(define (create-file-menu)
 (element->add
  (div id: "filemenu")
  (string-append
   (create-button-div 
    id: "filebutton" 
    class: "button" 
    action: "filebuttonaction()"
    label: "File")
   (create-dropdown-div
    id: "filedropdown"
    content: "TEST!"))))

(define (create-edit-menu)
 (element->add
  (div id: "editmenu")
  (string-append
   (create-button-div 
    id: "editbutton" 
    class: "button" 
    action: "editbuttonaction()"
    label: "Edit")
   (create-dropdown-div
    id: "editdropdown"
    content: "TEST!"))))

(define (create-option-menu)
 (element->add
  (div id: "optionmenu")
  (string-append
   (create-button-div 
    id: "optionbutton" 
    class: "button" 
    action: "optionbuttonaction()"
    label: "Option")
   (create-dropdown-div
    id: "optiondropdown"
    content: "TEST!"))))

(define (create-test-request-get)
 (element->add
  (div id: "xmlhttprequest")
  (string-append
   (create-button-div
    id: "requestbutton"
    class: "button"
    action: "requestbuttonaction_GET()"
    label: "Request-GET")
   (create-dropdown-div
    id: "editdropdown"
    content: "REQUEST!"))))

(define (create-blank-div)
 (div id: "statusbar" class: "blank"))

(define (create-status-bar)
 (element->add
  (div id: "statusbar" class: "statusbar")
  (create-button-string
   id: "statusbar"
   class: "button statusbar"
   content: "123/456 ln,col status:green")))


;; these might be repetitive
;; is this already done in framefuncs.scm?
(define (create-file-tree)
 (create-button-string
  id: "filetree"
  class: "button"
  content: "File"))

;; same here
(define (create-section #!key
	 (id "default")
	 (class "default")
	 (content "content"))
 (element->add
  (div id: id class: class)
  content))
  

(define (editor)
 (let* ((divtopleft (create-section
		     id: "divtopleft"
		     content:
		     (string-append 
		      (create-file-menu) 
		      (create-edit-menu) 
		      (create-option-menu)
		      (create-test-request-get))))
	(navigation (create-section
		     id: "navigation" 
		     class: "u-pull-right rightnav"
		     content:
		     (string-append (create-file-tree))))
	(editorsec (create-section
		    id: "editor"
		    content:
		    (string-append
		     (car editor-text-area)
		     (cdr editor-text-area))))
	(status (create-status-bar))
	(layout (make-table 
		 (list (create-blank-div) divtopleft) 
		 (list navigation editorsec)
		 (list (create-blank-div) status))))
  (string-append
   (car (document title: "Chicken Editor"))
   layout
   (cdr (document)))))


(define (callback)
 (create-button-string))
