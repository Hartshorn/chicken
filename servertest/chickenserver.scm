
#>
    extern int runserver(char *ip, int port);
<#


(define c-server (foreign-lambda int "runserver" c-string int))

(c-server "localhost" 8000)
