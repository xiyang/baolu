package com.lsxyz.baolu.core.web.tag;

import com.lsxyz.baolu.core.common.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.support.DelegatingMessageSource;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Locale;


@SuppressWarnings("serial")
public class PageTag extends TagSupport {
	
	//4 items in total current page1/1, 4 items per page  first page     last page       go to       switch to
	private String action;
	private String param;
	private String color;

	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
			this.color = color;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	

	private DelegatingMessageSource messageSource;
	
	public int doEndTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			out.print("</div>");
		}catch(Exception e){
			e.printStackTrace();
		}
		return this.SKIP_BODY;
	}

	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
		String path = pageContext.getServletContext().getContextPath();
		Page page = (Page) request.getAttribute("page");
		messageSource = (DelegatingMessageSource) RequestContextUtils.getWebApplicationContext(request).getBean("messageSource");
		
		try {
			
			out.print("<div style='width:180px; margin-top:4px ; float:left; text-align: left;font-size: 12;' >");
			if (StringUtils.isNotBlank(color)) {
				
				out.print(" <span style='background-color:"+color+";'></span>");
				out.print(" <span style='background-color:"+color+";'>");
			} else {
				out.print(" <span>");
			}
			
//			out.print(this.getPageInfo((HttpServletRequest) request,page));
			out.print("</span></div>");
			writePageNumber(out,request,path,page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}
	
	private void writePageNumber(JspWriter out , HttpServletRequest request, String path, Page page) throws IOException{
		
//		String first = this.messageSource.getMessage("page.button.first",null, RequestContextUtils.getLocale((HttpServletRequest)request));
//		String previous = this.messageSource.getMessage("page.button.previous",null, RequestContextUtils.getLocale((HttpServletRequest)request));
//		String next = this.messageSource.getMessage("page.button.next",null, RequestContextUtils.getLocale((HttpServletRequest)request));
//		String last = this.messageSource.getMessage("page.button.last",null, RequestContextUtils.getLocale((HttpServletRequest)request));
		String pageTag = "";
		if(StringUtils.isNotBlank(param) && param.indexOf("position") != -1){
			pageTag = param.substring(param.indexOf("=")+1, param.indexOf("&"));
			param = param.substring(param.indexOf("&")+1);
		}
		if(StringUtils.equals(param, "&")){
			param = "";
		}
		out.print(" <div  class=\"productListPages\">");
	
		if (StringUtils.isNotBlank(color)) {
			out.print(" <span style='background-color:"+color+" margin:0px 1px;' >");
		} else {
			out.print(" <span style='margin:0px 1px;'>");
		}
		/*out.print("<a href='"+path+"/"+this.action+"?currentPage=1&pageMethod=first");
		if (StringUtils.isNotBlank(param)){
			out.print("&"+param);
		}
		out.print("'>");
		out.print(first+"</a></span>");*/
		if (1 <= page.getCurrentPage()){
			if (StringUtils.isNotBlank(color)) {
				out.print(" <span style='background-color:"+color+"'>");
			} else {
				out.print(" <span>");
			}
			out.print("<a href='"+path+"/"+this.action+"?currentPage="+page.getCurrentPage()+"&pageMethod=previous");
			if (StringUtils.isNotBlank(param)){
				out.print("&"+param);
			}
			out.print("'>");
			out.print("<div class=\"productListPrevious\" > </div>"+"</a></span>");
		}
		
		/*for (Integer num :page.getPageList()){
			if (StringUtils.isNotBlank(color)) {
				out.print("<span style='background-color:"+color+"'>");
			} else {
				out.print("<span >");
			}
		
			out.print("<a href='"+path+"/"+this.action+"?currentPage="+num+"&pageMethod=null");
			if (StringUtils.isNotBlank(param)){
				out.print("&"+param);
			}
			out.print("'>");
			if ( num == page.getCurrentPage()) {
				out.print("<font style='color: red ;text-align: center'>"+num+"</font>");
			} else {
				out.print(num);
			}
			out.print("</a></span>");
		}*/
		
		/*if (page.getPageList().size() > 0 && page.getTotalPages() > page.getPageList().get(page.getPageList().size()-1)){
			if (StringUtils.isNotBlank(color)) {
				out.print("<span style='background-color:"+color+"'>");
			} else {
				out.print("<span >");
			}
			out.print("<span>...</span>");
			out.print("</span>");
		}*/
		
		writeTurnInfo(out,request,page,path, pageTag);
		if (page.getCurrentPage() <= page.getTotalPages()) {
			if (StringUtils.isNotBlank(color)) {
				out.print(" <span style='background-color:"+color+"'>");
			} else {
				out.print(" <span>");
			}
			out.print("<a href='"+path+"/"+this.action+"?currentPage="+page.getCurrentPage()+"&pageMethod=next");
			if (StringUtils.isNotBlank(param)){
				out.print("&"+param);
			}
			out.print("'>");
			out.print("<div class=\"productListNext\" > </div>"+"</a></span>");
		}
		/*if (StringUtils.isNotBlank(color)) {
			out.print(" <span style='background-color:"+color+"'>");
		} else {
			out.print(" <span>");
				
		}
		out.print("<a href='"+path+"/"+this.action+"?currentPage="+page.getCurrentPage()+"&pageMethod=last");
		if (StringUtils.isNotBlank(param)){
			out.print("&"+param);
		}
		out.print("'>");
		out.print(last+" </a></span>");
		
		if (StringUtils.isNotBlank(color)) {
			out.print(" <span style='background-color:"+color+"'></span>");
		} else {
			out.print(" <span ></td>");	
		}*/
		out.print("");
		
	}
	
	private void writeTurnInfo(JspWriter out ,HttpServletRequest request, Page page,String path, String pageTag) throws IOException {
//		String sTurn = messageSource.getMessage("page.turnto",null,RequestContextUtils.getLocale((HttpServletRequest)request));
//		String pageName =  messageSource.getMessage("page.page",null,RequestContextUtils.getLocale((HttpServletRequest)request));
		//String go = this.messageSource.getMessage("page.button.go",null, RequestContextUtils.getLocale((HttpServletRequest)request));
		
		Object[] param = {page.getCurrentPage(),page.getTotalPages()>0?page.getTotalPages():1};
		String test = messageSource.getMessage("page.message",param, Locale.getDefault());
		test = test.replace("pagenumber", "pagenumber"+pageTag);
		/*if (StringUtils.isNotBlank(color)) {
			out.print( "<span style=' font-size: 12px;background-color:"+color+"'>"+sTurn+"</span>" );
		} else {
			out.print( "<span style='font-size: 12px' align='center'>"+sTurn+"</span>" );
		}*/
		/*if (StringUtils.isNotBlank(color)) {
			out.print("<span style=' font-size: 12px;background-color:"+color+"' >"+pageName+"</span>");
			out.print("<span style=' font-size: 12px;cursor:pointer;background-color:"+color+"' onclick='go()'>	");
		} else {
			out.print("<span align='right' style='font-size: 12px'>"+pageName+"</span>");
			out.print("<span style='font-size: 12px; cursor:pointer;text-decoration: underline; 'onclick='go()'>");
		}*/
		out.print("<span class=\"productListPage\">");
//		out.print("<input name='textfield' onkeydown ='validateInput(event)'  id='pagenumber' type='text'  style='height:14px; width:25px;' size='5'/> </span>");
		out.print(test+"</span>");
		
		out.print("<a href='javascript:void(null);' onclick='go"+pageTag+"()'>"+"<div class=\"productListGo\"></div>"+"</a>");
		//out.print("<a href='/abgent/'"+action+ "onclick='go()'>"+"<div class=\"productListGo\"></div>"+"</a>");
		writeScrpt(out,path, pageTag);
		out.print("</span>");
		
	}
	
	private void writeScrpt(JspWriter out,String path, String pageTag) throws IOException{
		out.print("<script type='text/javascript'>");
		out.print("function go"+pageTag+"() {");
		out.print("var pagenumber = document.getElementById('pagenumber"+pageTag+"').value;");
		out.print("if(!pagenumber) return false;");
		out.print("var strP=/^[1-9]\\d*$/;");
		out.print(" if(!strP.test(pagenumber)) return false; ");
		out.print(" try{ if(parseInt(pagenumber)!=pagenumber) return false; }");
		out.print("catch(ex){ return false; }");
		out.print("document.location.href ='"+ path+"/"+action+"?currentPage='+pagenumber+'&method=null");
		if (StringUtils.isNotBlank(param)){
			out.print("&"+param);
		}
		out.print("'");
		out.print("}");
		
//		out.print("function validateInput(event){");
//		out.print("var key =  event.keyCode ;");
//	
//		out.print("if (key == 13){");
//		out.print("return go();");
//		out.print("}");
//		out.print("if ((event.ctrlKey || event.shiftKey)||key ==32 ||(key > 57 && key <96) ||key >106){");
//		out.print("alert('please input number'); event.returnValue=false");
//		out.print("}}");
	
		out.print("</script>");
	}
	
	private String getPageInfo(HttpServletRequest request, Page page){
	
		Object[] param = {page.getTotalRows(),page.getCurrentPage(),page.getTotalPages()>0?page.getTotalPages():1,page.getPageSize()};
		String pageInfo = messageSource.getMessage("page.info",param, Locale.getDefault());
		return pageInfo;
	}

}
