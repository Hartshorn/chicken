(import chicken scheme)
(use hypergiant)

(define scene 
 (make-parameter #f))

(define camera 
 (make-parameter #f))

(define line-width 
 (/ 256))

(define grid-line 
 (rectangle-mesh 
  (+ 1 line-width) 
  line-width 
  centered?: #f))

(define grid-rows 19)

(define (build-grid)
 (let* ((-line-width/2 (- (/ line-width 2)))
	(line-spacing (/ (sub1 grid-rows)))
	(lateral-lines
	 (let loop ((i 0) (lines '()))
	  (if (= i grid-rows)
	       lines
	       (loop (add1 i)
		     (cons
		      (cons grid-line
			    (translation
			     (make-point -line-width/2 
					(+ (* i line-spacing)
					    -line-width/2)
					0)))
		      lines)))))
	(vertical-lines
	 (map (lambda (a) 
	       (cons grid-line
		     (translate (make-point 0 1 0)
				(rotate-z (- pi/2)
					  (copy-mat4 (cdr a))))))
	  lateral-lines)))
    (append lateral-lines
	    vertical-lines)))

(define marker
 (circle-mesh (/ 120) 12))

(define (build-markers)
 (let* ((3nodes (/ 3 (sub1 grid-rows)))
	(15nodes ( / 15 (sub1 grid-rows)))
	(marker-points `((,3nodes  . ,3nodes)
			 (,3nodes  . 0.5)
			 (,3nodes  . ,15nodes)
			 (0.5	   . ,3nodes)
			 (0.5	   . 0.5)
			 (0.5	   . ,15nodes)
			 (,15nodes . ,3nodes)
			 (,15nodes . 0.5)
			 (,15nodes . ,15nodes))))
  (map (lambda (p)
	(cons marker
	      (translation (make-point (car p) (cdr p) 0))))
   marker-points)))

;(define board-grid-mesh 
; (mesh-transform-append
;  (append
;   (build-grid)
;   (build-markers))))

(define keys (make-bindings
	      `((quit ,+key-escape+ press: ,stop))))

(define board-mesh (rectangle-mesh 1.2 1.2
		    color: (lambda (_) 
			    '(0.5 0.4 0.2))))

(define (init-board) 
 (add-node (scene) color-pipeline-render-pipeline
  mesh: board-mesh
  position: (make-point 0.5 0.5 0)))

(define (init)
 (push-key-bindings keys)
 (scene (make-scene))
 (camera (make-camera 
	  #:perspective #:position 
	  (scene) 
	  near: 0.001 
	  angle: 35))
 (set-camera-position! (camera) (make-point 0.5 0.5 2))
 (init-board))

(start 800 600 "Go" resizable: #f init: init)


