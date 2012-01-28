$(function() {
	
	$(".formField").change(function(){
		$(".form"+$(this).attr("name")).toggle();
	});

});
