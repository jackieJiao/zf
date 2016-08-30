package com.sinoway.sinowayCrawer.utils;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginAuthenticationSuccessHandler implements AuthenticationSuccessHandler {  

	protected Logger logger = Logger.getLogger("Auth");
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();  
   
    public void onAuthenticationSuccess(HttpServletRequest request,   
      HttpServletResponse response, Authentication authentication) throws IOException {  
        handle(request, response, authentication);  
        clearAuthenticationAttributes(request);  
    }  
   
    protected void handle(HttpServletRequest request,   
      HttpServletResponse response, Authentication authentication) throws IOException {  
        String targetUrl = determineTargetUrl(authentication);  
   
        if (response.isCommitted()) {  
            logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);  
            return;  
        }  
   
        redirectStrategy.sendRedirect(request, response, targetUrl);  
    }  
   
     
    protected String determineTargetUrl(Authentication authentication) {  
        boolean isSINO = false;  
        boolean isFA = false;  
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();  
        for (GrantedAuthority grantedAuthority : authorities) {  
            if (grantedAuthority.getAuthority().equals("ROLE_SINOWAY")) {  
            	isSINO = true;  
                break;  
            } else if (grantedAuthority.getAuthority().equals("ROLE_FA")) {  
            	isFA = true;  
                break;  
            }  
        }  
   
        if (isSINO) {  
            return "/query.jsp";  
        } else if (isFA) {  
            return "/states.jsp";  
        } else {  
            throw new IllegalStateException();  
        }  
    }  
   
    protected void clearAuthenticationAttributes(HttpServletRequest request) {  
        HttpSession session = request.getSession(false);  
        if (session == null) {  
            return;  
        }  
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);  
    }  
   
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {  
        this.redirectStrategy = redirectStrategy;  
    }  
    protected RedirectStrategy getRedirectStrategy() {  
        return redirectStrategy;  
    }  
} 
