Buu = typeof(Buu) == "undefined" ?  {}:Buu;
Buu.starRating = function (rates) {
	rates = Math.floor(rates*2)/2;
	console.log(rates);
	for (var i=1; i<=rates; i++)
		document.write($("<span>").addClass("rateStar").get(0).outerHTML);
}