function test() { alert("onclick not set!") }


function filebuttonaction() {
	document.getElementById("filedropdown").classList.toggle("show");
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
}
