$(document).ready(function(){
$("#valinnat").hide();
$("#kappale").hide();
$(":radio[name='group']").click(function(){
  var newVal = $(":radio[name='group']:checked").val();
  if (newVal == "teksti") {
    $("#valinnat").show();
  } else {
    $("#valinnat").hide();
  }
  if (newVal == "kappale") {
    $("#kappale").show();
  } else {
    $("#kappale").hide();
  }
});
$(".button").click(function() {
var radio = $("input:radio[name=group]:checked").val();  
var virkkeet = $("#virkkeet").val();
var kappaleet = $("#kappaleet").val();
var random = $("input:checkbox[name=checkbox]:checked").val();
var varit = $("input:checkbox[name=checkboxa]:checked").val();
var dataString = 'radio='+ radio + '&virkkeet=' + virkkeet + '&kappaleet=' + kappaleet + '&random=' + random + '&varit=' + varit; 
// alert (dataString); for debugging
$.ajax({  
  type: "POST",
  url: "generate.php",
  dataType: "html",
  data: dataString,
  success: function(response) {
    $('#puppu').html("<div id='message'></div>");  
    $('#message').html("<h2>Puppusi, ole hyvä!</h2>")
    .append(response)  
    .hide()
	.fadeIn(1500, function(response) {  
      $('#message');
    });  
  }  
});  
return false; 
});
});