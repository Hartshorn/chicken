(use socket)

(let* ((unix-socket (socket af/unix sock/stream))
       (pathname "sockettest")
       (message-to-send "this is a test"))

 (socket-connect unix-socket (unix-address pathname))
 (let ((number-of-bytes-sent (socket-send unix-socket message-to-send)))
  (printf "number of bytes sent to server: ~A~%" number-of-bytes-sent))
 
 (socket-close unix-socket))
