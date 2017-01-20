$(document).on('turbolinks:load', function() {
	"use strict";

	/*RSVP Form*/
	$(".submit_block_1").on("click", function(e){
		send_form('block_1');
		return false;
	});

	function send_form(type){

	var name = $("input#name_"+type).val();
	if (name == "") {
		$("input#name_"+type).css({border:"1px solid red"});
		$("input#name_"+type).focus();
		return false;
	}
	var email = $("input#email_"+type).val();
	if (email == "") {
		$("input#email_"+type).css({border:"1px solid red"});
		$("input#email_"+type).focus();
		return false;
	}
	var guest = $("input#guest_"+type).val();
	if (guest == "") {
		$("input#guest_"+type).css({border:"1px solid red"});
		$("input#guest_"+type).focus();
		return false;
	}
	var attending = $("input#attending_"+type).val();
	if (attending == "") {
		$("input#attending_"+type).css({border:"1px solid red"});
		$("input#attending_"+type).focus();
		return false;
	}

	var dataString = '&name=' + name + '&email=' + email + '&guest=' + guest + '&attending=' + attending;
	var form = $(this);
	var str = form.serialize();
	$.ajax({
		type: "POST", url: "mail/mail.php",	data: dataString, success: function() {
		$('#div_'+type).html("<div id='form_send_message'>Thank you for your request, we will contact you as soon as possible to confirm your booking.</div>", 1500);
	}
	});
	}

	/*FireFly in Intro*/
	$.firefly({
		color: '#f00', minPixel: 1, maxPixel: 3, total : 55, on: '.into_firefly'
	});
});
