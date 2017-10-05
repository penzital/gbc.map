$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});

$('#country').on('change',function(){
	   var selection = $(this).val();
	   switch(selection){
		   case "China":
			   $("#socialMedia").show();
			   break;
		   case "Russia":
			   $("#socialMedia").show()
			   break;
		   default:
			   $("#socialMedia input").hide()
	   }
	});


