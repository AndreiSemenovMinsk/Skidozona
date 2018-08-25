package by.eximer.library.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginationRequestWrapper extends HttpServletRequestWrapper {

    public LoginationRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }

    
}