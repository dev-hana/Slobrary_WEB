$(document).ready(function () {
	$("#halfstarsReview").rating({
	      "half": true,
	      "click": function (e) {
	      console.log(e);
	      $("#halfstarsInput").val(e.stars);
	      }
	   });
});

function modal_view(title,loan_id){
	  $("#reviewModal").on('show.bs.modal',function(event){
		  $("#modalTitle").text(title);
		  $("#l_id").val(loan_id);
	  });
}