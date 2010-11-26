$(document).ready(function () {
    $(".template").hide();
	$(".content").show();
	$(".showContent").hide();
	
	$(".showTemplate").click(function () {
		showTemplate();
		$(this).hide();
	});
	$(".showContent").click(function () {
		showContent();
		$(this).hide();
	});
	
});

function showTemplate() {
    $(".showContent").show();
	$(".template").show();
	$(".content").hide();
	
}
function showContent() {
    $(".showTemplate").show();
	$(".template").hide();
	$(".content").show();
}


