$(document).ready(function() {
url = window.location.href;
	$('#ajax_form').submit(function(e){
   //AJAX clall
   e.preventDefault();

   $.ajax({
   	type: "post",
   	data: $(this).serialize(),
   	url: "/surveys/"+surveyID+"/add_questions",

   	success: function(success) {
   		console.log(success);


   		$('section').append('<h2>#'+ QCount+' '+ question +'</h2>')
   		$('section').append('<p>choice1: '+ choice1 +'</p>')
   		$('section').append('<p>choice2: '+ choice2 +'</p>')
   	}
   });
     // get last num
 })

$('.status').each(function(e){
   that=this;
   count =0 ;
   
   
   $.ajax({
   	type: "get",
   	data: {status: "draft"},
   	url: "/contracts/status/"+ $("[data-id='"+ e +"']").data("status")  +"",

   	success: function(success) {
   		console.log(success);
   		// count
   		$("[data-id='"+e +"']").append(success);
   		console.log(that);
   		count++;
   	}
   });
    
 })
$("#reject").click(function(){
	console.log("Reject")
	window.location.href = url+"/update_status/rejected"
});
$("#accept").click(function(){
	console.log("Accept")
	window.location.href = url+"/update_status/completed"
});
$("#changeProposal").click(function(){
	console.log("changeProposal")
});
$("#logs").click(function(){
	window.location.href = url+"/logs"

});

$("#newContract").click(function(){
   window.location.href = document.location.origin + "/contracts/new"



});



});