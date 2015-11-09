$("document").ready(function(){
	//set first pagination element to active
	$(".getPage").eq(0).addClass("active");
	
	//handle ajax paging
	$(".pagination").on("click", ".getPage", function(){
		//get variables to complete the request
		var catId = $(".pagination").first().data("category");
		var pageRequest = $(this).data("page");	
		//make ajax GET request to product controller
		getPage(catId, pageRequest)		
	});
	
	$(".pagination").on("click", ".next", function(){
		var catId = $(".pagination").first().data("category");
		var currentPage = $(".getPage.active").first().data("page");
		var nextPage = parseInt(currentPage) + 1;
		if(!$(this).hasClass("disabled")) {
			getPage(catId, nextPage);
		}
		
	});
	
	$(".pagination").on("click", ".previous", function(){
		var catId = $(".pagination").first().data("category");
		var currentPage = $(".getPage.active").first().data("page");
		var nextPage = parseInt(currentPage) - 1;
		if(!$(this).hasClass("disabled")) {
			getPage(catId, nextPage);
		}
		
	});
});

function getPage(catId, pageRequest)
{
	var baseURL = $(".pagination").first().data("baseurl");
	var totalPages = $(".pagination").first().data("total");
	var requestURL = baseURL + "/products/" + catId + "/getPage/" + pageRequest;
	$.get(requestURL, function(data, status){
		$(".productListing").html(data);
    });
	
	//update pagination view buttons
	pageRequest !=1 ? $(".previous").removeClass("disabled") : $(".previous").addClass("disabled");
	pageRequest !=totalPages ? $(".next").removeClass("disabled") : $(".next").addClass("disabled");
	$(".getPage").removeClass("active");
	$(".getPage").eq(pageRequest-1).addClass("active");
	
}