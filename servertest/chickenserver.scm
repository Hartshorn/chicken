
#>
    extern int runserver(char *ip, int port);
<#


(define c-server (foreign-lambda int "runserver" c-string int))

(c-server "127.0.0.1" 8080)
