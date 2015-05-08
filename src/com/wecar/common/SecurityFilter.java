package com.wecar.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.model.user.User;

public class SecurityFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		String path = request.getServletPath();
		if ("/toLogin.do".equals(path) || "/toRegister.do".equals(path)
				|| "/register.do".equals(path) || "/home.do".equals(path)
				|| "/regStep2.do".equals(path) || "/login.do".equals(path)
				|| "/logout.do".equals(path)) {
			arg2.doFilter(request, response);
		} else {
			User user = (User)request.getSession().getAttribute("loginUser");
			if (user==null || user.getId()==0) {
				response.sendRedirect(request.getContextPath()+"/toLogin.do");
			} else {
				arg2.doFilter(request, response);
			}
		}
		//arg2.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
