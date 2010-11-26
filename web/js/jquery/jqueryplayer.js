/*
 * images player
 * author:mr·zhong
 * date:2010-04-19
 */
 
//当前导航页码数字æ°å­
var currentPage = 1;
//图片间隔时间
var playerTime = 10000;

jQuery(function(){	
	SetPlayerNavPosition();		   	
	OnLoadingImages();	
	OnLoadingLinks();
	setInterval("Player()",playerTime);
});

/*
 * 图片播放方法
 */
function Player(){
	PageClick(jQuery("#page_" + currentPage));
	
	if(currentPage == jQuery("#playerNav a").length)
		currentPage = 1;
	else
		currentPage++;
}

/*
 * 创建图片页码·并绑定页码的click事件
 * count:需要创建页面的个数
 */
function CreatePageNberObj(count){
	var pages = '';
	
	for(var i = 1; i <= (count - 1); i++){
		pages += '<a id="page_' + i + '" idx="' + i + '" onfocus="blur()">' + i + '</a>';			
	}

	jQuery("#playerNav").html(pages);
	
	for(var i = 1; i <= count; i++){
		BindPageClick("page_" + i);
	}
}

/*
 * 加载图片集·并为图片设定唯一ID，最后显示一张隐藏其它
 */
function OnLoadingImages(){
	var li_id = 1;
	var Li_link_id = 1;
	
	jQuery("#playerImage li").each(function(){
		jQuery(this).attr("id","play_img_" + li_id);				
		
		if(li_id > 1){
			SetImageShowOrHide(jQuery(this),false);
		}
		
		li_id++;
	});
	
	jQuery(".centerboxMid li").each(function(){
		if (jQuery(this).children().attr("id") == "id_offer1") {
			jQuery(this).attr("id","play_link_img_" + 1);	
		}else if (jQuery(this).children().attr("id") == "id_offer2") {
			jQuery(this).attr("id","play_link_img_" + 2);	
		}else {
			jQuery(this).attr("id","play_link_img_" + 3);	
		}
		
		if(Li_link_id > 1){
			SetImageShowOrHideForDocs(jQuery(this),jQuery(this).attr("id"),false);
		}
		
		Li_link_id++;
	});
}

/*
 * 加载图片相对应链接集·并为链接设定唯一ID，最后显示对相应的链接隐藏其它
 */
function OnLoadingLinks(){
	var a_id = 1;
	
	jQuery("#playerTitle a[href='#']").each(function(){
		jQuery(this).attr("id","link_" + a_id);				

		if(a_id > 1){
			SetImageShowOrHide(jQuery(this),false);
		}
						
		a_id++;
	});
	
	CreatePageNberObj(a_id);
}

/*
 * 绑定图片页码的click事件底层方法
 */
function BindPageClick(id){
	jQuery("#" + id).click(function(){
		PageClick(jQuery(this));
	});
}

/*
 * 图片页码Click处理方法
 * obj:当前页码元素对象
 */
function PageClick(obj){
	var id = obj.attr("idx");	
	//alert(id);

	//当页码在自动播放的时候点击了某个页码数字必须再重新赋值给当前的currentPage记录器
	currentPage = id;
	//设置所有页码样式为默认
	jQuery("#playerNav a").removeClass("hover");
	//设置当前选中的页码数字为指定的颜色
	SetPageColor(obj,true);				
	
	//显示或隐藏图片
	jQuery("#playerImage li").each(function(){			
						   
		if(jQuery(this).attr("id") == ("play_img_" + id)){
			SetImageShowOrHide(jQuery(this),true);
		}else{
			SetImageShowOrHide(jQuery(this),false);			
		}									
	});
	jQuery(".centerboxMid li").each(function(){	
									   
		if(jQuery(this).attr("id") == ("play_link_img_" + id)){
			SetImageShowOrHideForDocs(jQuery(this),jQuery(this).attr("id"),true);
		}else{
			SetImageShowOrHideForDocs(jQuery(this),jQuery(this).attr("id"),false);			
		}									
	});
	
	//显示或隐藏文字链
	jQuery("#playerTitle a").each(function(){										   
		if(jQuery(this).attr("id") == ("link_" + id)){
			SetImageShowOrHide(jQuery(this),true);
		}else{
			SetImageShowOrHide(jQuery(this),false);			
		}									
	});	
}

/*
 * 设置指定的元素或图片显示或不隐藏
 * obj:需要隐藏的元素
 * isShow:显示or隐藏
 */
function SetImageShowOrHide(obj,isShow){
	if(!isShow){
		obj.fadeOut(1000);
	}else{
		obj.fadeIn(2000);
	}
}

/*
 * 设置指定的图片页码样式
 * obj:需要设置的元素
 * isSelect:是否选中
 */
function SetPageColor(obj,isSelect){
	if(!isSelect){
		obj.removeClass("hover");
	}else{
		obj.addClass("hover");
	}
}

/*
 * 设置图片数字链接和图片标题DIV位置
 */
function SetPlayerNavPosition(){
	var offset = jQuery("#playerBox").offset();
	var boxHeight = jQuery("#playerBox").height();
	var navHeight = jQuery("#playerNavAndTitle").height();
	
	jQuery("#playerNavAndTitle").css({ top:(offset.top + boxHeight - navHeight) + 1 + "px", left:offset.left + 1 + "px" });
	//jQuery("#playerNavAndTitle").css({ top:(offset.top + boxHeight - navHeight) + 1 + "px", left:"970.35px" });
}


function SetImageShowOrHideForDocs(obj,id,isShow){
	if(!isShow){
		obj.fadeOut(0);
	}else{
		obj.fadeIn(0);
		jQuery("#contentSpe").html(jQuery("#"+id+"").children().next().val());
	}
}