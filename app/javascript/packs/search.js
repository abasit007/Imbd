console.log("search js file loaded")
document.addEventListener("turbolinks:load", function(){
	$input = $("#q")

	var options = {
		 getValue: "title",
		 url: function(phrase){
		 	return "/search?q="+ phrase
		 },
		 list: {
		 	onChooseEvent: function(){
		 		var url = $input.getSelectedItemData().url
		 		$input.val("")
		 		Turbolinks.visit(url)	
		 	},
				match: {
					enabled: true
				}
			}
		 
	}

	$input.easyAutocomplete(options)
});