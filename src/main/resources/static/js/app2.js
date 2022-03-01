
function password_toggle(element) {
	var x = element.previousSibling.previousElementSibling.previousSibling.previousElementSibling.previousSibling.previousElementSibling;
	if (x.type === "password") {
		x.type = "text";
	} 
	else {
		x.type = "password";
  	}
}