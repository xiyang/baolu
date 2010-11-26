package com.lsxyz.baolu.core.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

public class CharsetFilter implements Filter
{
    public void destroy() 
    {
        
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
    {
        try
        {
            HttpServletRequest httpRequest = (HttpServletRequest)request;
            String method = httpRequest.getMethod().toLowerCase();
            if(method.equals("post"))
            {
                //如果是post，即表单方法，直接设置charset即可
                request.setCharacterEncoding("UTF-8");
            }
            
            chain.doFilter(request, response);
        }
        catch(Exception e){}
    }
    
    public void init(FilterConfig filterConfig) 
    {
        
    }
}

