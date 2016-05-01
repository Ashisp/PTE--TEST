var formattedPassage = "";
function formatPassage(){
	var passage = document.getElementById("passage").innerHTML;
	return passage.split(" ");
}

function addAttributeToWord(word){
	formattedPassage = formattedPassage + "<span ondblclick='activateHighlight(this)'>" + word + "</span> ";	//$(this).addClass(\"blue\")
}

function activateHighlight(elem){
	//alert('hi');
	if($(elem).hasClass('yellow')){
		$(elem).removeClass('yellow');
	}else{
		$(elem).addClass('yellow');
	}
}