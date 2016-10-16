

(define (index) (string-append 
			"<!doctype html>"
			"<html lang=\"en\">"
			"<head>"
			"<meta charset=\"utf-8\">"
			"<title>Chicken Scheme</title>" 
			"<meta name=\"author\" content=\"Chicken\">"  
			"<link rel=\"stylesheet\" href=\"css/styles.css?v=1.0\">"  
			"</head>"  
			"<body>"
			"<header>"
			"chicken is the best!"
			"</header>"
			"<div>"
			"I mean, for real its super awesome."
			"</div>"
			"</body>"  
			"</html>"))

(define (secret-index name) (string-append 
			"<!doctype html>"
			"<html lang=\"en\">"
			"<head>"
			"<meta charset=\"utf-8\">"
			"<title>Chicken Secret</title>" 
			"<meta name=\"author\" content=\"Chicken\">"  
			"<link rel=\"stylesheet\" href=\"css/styles.css?v=1.0\">"  
			"</head>"  
			"<body>"
			"<header>"
			(->string name) " is the secret!"
			"</header>"
			"<div>"
			"I mean, for real its super secret."
			"</div>"
			"</body>"  
			"</html>"))
