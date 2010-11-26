
var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);

	if (id == "newsTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#newsTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteNews(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/news/detail";
		} else {
			buildNewsList(parameterString);
		}
	}
}

function deleteNews(parameterString) {
	if (confirm('Are you sure ?')) {
		
		document.location.href = path + "/admin/news/delete";
	}
}
function buildNewsList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/news/list?"+parameterString;
	
}

function addOrModifyNews() {
	
	document.location.href = path + "/admin/news/addOrModify?id=" + $('#newsId').val() + "&title=" + $('#title').val() + "&content=" + $('#content').val();
}

function getNewsById(newsId, title) {
	document.location.href = path + "/admin/news/detail?id=" + newsId;
}

function getNewsDetailById(newsId, title) {
	document.location.href = path + "/news/detail?id=" + newsId + "&title=" + title;
}

function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#newsTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#newsTable input[type=checkbox]').trigger('click');
		}
	}
}

function checkTitle(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtNewsMsg").html($("#newsTitleWarn").val());
		return false;
	} 
	return true;
}

function clearMsg(){
	$("#validationtNewsMsg").text("");
}

function test(){
	alert($("content").val());
}
