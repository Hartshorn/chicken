(use socket)


(let ((unix-socket (socket af/unix sock/stream))
      (backlog 1)
      (socket-pathname "sockettest"))

 (socket-bind unix-socket (unix-address socket-pathname))
 
 (socket-listen unix-socket backlog)
 
 (let* ((connected-socket (socket-accept unix-socket))
        (message-length 500)
        (received-data (socket-receive connected-socket message-length)))

  (printf "Data received from the client: '~A'~%" received-data)
  (socket-close connected-socket)
  (socket-close unix-socket)
  (delete-file socket-pathname)))
