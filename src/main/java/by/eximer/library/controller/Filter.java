package by.eximer.library.controller;

//import javax.servlet.*;
import by.eximer.library.service.SessionIdFactory;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Filter implements javax.servlet.Filter {
    // кодировка
    private String encoding;
    
    public static String sessionId = null;

    public void init(FilterConfig config) throws ServletException {
        // читаем из конфигурации
        encoding = config.getInitParameter("requestEncoding");
        
        System.out.println("INIT FILTER()"+encoding);

        // если не установлена — устанавливаем UTF-8
        if (encoding == null) encoding = "UTF-8";
    }

    @Override
    public void doFilter(ServletRequest request,
    		ServletResponse response, FilterChain next)
        throws IOException, ServletException {
    	
    	HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        
    	System.out.println("doFilter");
    	
    	String sessionId = null;
		Cookie[] cookie = req.getCookies();
		for(Cookie obj : cookie) {
			if(obj.getName().equals("session_id")){
				System.out.println(obj.getName() + " : " + obj.getValue());
				sessionId = obj.getValue();
				SessionIdFactory.setSessionId(sessionId);
				break;
			}	
		}
		
		
        req.setCharacterEncoding(encoding);
        resp.setCharacterEncoding(encoding);
		
        response.setContentType("text/html; charset=windows-1251");//charset=UTF-8
        next.doFilter(new LoginationRequestWrapper((HttpServletRequest) req), resp);
    }

    public void destroy() {
    }
}