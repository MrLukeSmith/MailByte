$(function() {

	$("#newCampaign").click(function(){
		console.log("Click: New campaign");
	});
	
	$(".formField").change(function(){
		console.log($(this).attr("name") + " - " + $(this).is(':checked'));
		$(".form"+$(this).attr("name")).toggle();
	});

});
