package com.lsxyz.baolu.core.web.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class ValidateHandlerInterceptor implements HandlerInterceptor {

	private static Log log = LogFactory.getLog(ValidateHandlerInterceptor.class); 
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		 	if( null == request.getSession().getAttribute("user")){
		 		log.debug("no user"); 
		 		return true;
		 	}
		   log.debug("invoke method,but before render view : " + new Date()); 
		   return false;
	}

}
