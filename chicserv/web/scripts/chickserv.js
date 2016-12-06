function test() { alert("onclick not set!") }


function filebuttonaction() {
	document.getElementById("filedropdown").classList.toggle("show");
}

function editbuttonaction() {
}

function optionbuttonaction() {
}

window.onclick = function(event) {
	if(!event.target.matches('.filebutton')) {
		var dropdowns = document.getElementsByClassName("filedropdown");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdowns = dropdowns[i];
			if (openDropdowns.classList.contains('show')) {
				openDropdowns.classList.remove('show');
			}
		}
	}
	// if event target matches the others...
}

function requestbuttonaction_GET() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("statusbar").innerHTML =
				this.responseText;
		}
	};
	xhttp.open("GET", "callback", true);
	xhttp.send();
}

