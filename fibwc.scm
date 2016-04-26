;;; write fib in c, then use in chicken

#>
    int fib(int n) {
        int prev = 0, curr = 1, next, i;
        for (i = 0; i < n; i++) {
                next = prev + curr;
                prev = curr;
                curr = next;
        }
        return curr;
    }

    int timestwo(int n) {
        return n * 2;
    }
<#

(define xfib (foreign-lambda int "fib" int))
(define xdub (foreign-lambda int "timestwo" int))

(do ((i 0 (+ i 1))) ((> i 10))
 (printf "~A " (xfib i))
 (printf "~A\n" (xdub i)))

(newline)
