$(function() {
	
	$(".formField").change(function(){
		$(".form"+$(this).attr("name")).toggle();
	});

  $("#submit_new_template").click(function(){
    var valid = true;
    var file = $("#templatefile").val();
    var name = $("#templatename").val();
    $("#templatefile").removeClass("invalid");
    $("#templatename").removeClass("invalid");
    
    if ((!valid_file_type()) || (file == "")){
      $("#templatefile").addClass("invalid");
      valid = false;
    }
    
    if (name == ""){
      $("#templatename").addClass("invalid");
      valid = false;
    }
    
    return valid;
  });

});

function valid_file_type(){
  var valid = false;
  var file = $("#templatefile").val();
  var splitfile = file.split(".");
  if (splitfile.length == 2){
    if (splitfile[1].toLowerCase() == "html"){
      valid = true;
    }   
  }
  return valid;
}
