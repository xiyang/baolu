package com.lsxyz.baolu.core.web.action;

import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RestUrlRewriteFilter extends OncePerRequestFilter implements Filter{
	private static final String DEFAULT_EXECUDE_EXTENTIONS = "jsp,jspx,do,wrk,php";
	private static final String DEFAULT_PREFIX = "/static";
	
	private String prefix;
	private boolean debug = true;
	private String[] excludeExtentions = new String[0];
	private String[] excludePrefixes = new String[0];
	
	protected void initFilterBean() throws ServletException {
		try {
			initParameter(getFilterConfig());
		} catch (IOException e) {
			throw new ServletException("init paramerter error",e);
		}
	}

	private void initParameter(FilterConfig filterConfig) throws IOException {
		prefix = getStringParameter(filterConfig,"prefix",DEFAULT_PREFIX);
		debug = getBooleanParameter(filterConfig,"debug",false);
		String excludeExtentionsString = getStringParameter(filterConfig,"excludeExtentions",DEFAULT_EXECUDE_EXTENTIONS);
		excludeExtentions = excludeExtentionsString.split(",");
		
		String excludePrefixsString = getStringParameter(filterConfig,"excludePrefixes",null);
		if(StringUtils.hasText(excludePrefixsString)) {
			excludePrefixes = excludePrefixsString.split(",");
		}
	}

	protected void doFilterInternal(HttpServletRequest request,HttpServletResponse response, FilterChain filterChain)throws ServletException, IOException {
		
		String from = request.getRequestURI().substring(request.getContextPath().length());
		
		if(from.indexOf("paypalipn.jsp") != -1 ){
			filterChain.doFilter(request, response);
			return;
		}
		
		if(rewriteURL(from)) {
			String to = from;
			to = prefix+from;
			if(debug) {
				System.out.println("RestUrlRewriteFilter: forward request from "+from+" to "+to);
			}
			request.getRequestDispatcher(to).forward(request, response);
			return;
		}else {
			
			String currentUrl = request.getRequestURI();
			if(debug) {
				System.out.println("RestUrlRewriteFilter: not rewrite url:" + currentUrl);
			}
			
			doForCRO(request);
			
			if ( currentUrl.indexOf("products/catalog/") != -1 && currentUrl.indexOf("_") != -1) {
				
				String finalUrlStart = currentUrl.substring(0, currentUrl.indexOf("_") );
				String finalUrlEnd = "";
				if(currentUrl.indexOf("?") != -1){
					finalUrlEnd = currentUrl.substring(currentUrl.indexOf("?")+1);
				}
				
				String finalUrl = finalUrlStart + finalUrlEnd;
				String contextPath = request.getContextPath();
				if( finalUrl.indexOf(contextPath) != -1 ){
					finalUrl = StringUtils.replace(finalUrl, contextPath, "");
				}
				
				if(debug) {
					System.out.println(" proccess product url:" + currentUrl+" to : "+finalUrl);
				}
				request.getRequestDispatcher(finalUrl).forward(request, response);		
				return ;
			}else if ( currentUrl.indexOf("catalog/") != -1 && currentUrl.indexOf("_") != -1) {

				String contextPath = request.getContextPath();
				if( currentUrl.indexOf(contextPath) != -1 ){
					currentUrl = StringUtils.replace(currentUrl, contextPath, "");
				}
				request.getRequestDispatcher(currentUrl).forward(request, response);		
				return ;
			}
			filterChain.doFilter(request, response);
		}
	}
	
	private void doForCRO(HttpServletRequest request) {
	    String currentUrl = request.getRequestURI();
	    if(currentUrl.indexOf("/user") != -1) {
	    	return;
	    }
	    
	    if(currentUrl.indexOf("/cro") != -1) {
	    	Scope.Flash.current().put("user.from", "cro");
	    }else {
	    	Scope.Flash.current().remove("user.from");
	    }
	}
	
	private boolean rewriteURL(String from) {
		String extension = StringUtils.getFilenameExtension(from);
		if(extension == null || "".equals(extension)) {
			return false;
		}
		
		for(String excludePrefix : excludePrefixes) {
			if(from.startsWith(excludePrefix)) {
				return false;
			}
		}
		
		for(String excludeExtension : excludeExtentions) {
			if(excludeExtension.equals(extension)) {
				return false;
			}
		}
		return true;
	}

	private String getStringParameter(FilterConfig filterConfig,String name,String defaultValue) {
		String value = filterConfig.getInitParameter(name);
		if(value == null || "".equals(value.trim())) {
			return defaultValue;
		}
		return value;
	}
	
	private boolean getBooleanParameter(FilterConfig filterConfig,String name,boolean defaultValue) {
		String value = getStringParameter(filterConfig, name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}
	
}

