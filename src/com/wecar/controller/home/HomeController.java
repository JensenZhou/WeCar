package com.wecar.controller.home;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wecar.service.user.IUserService;

@Controller
@SessionAttributes("loginUser")
public class HomeController {
	@Autowired
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	
	@RequestMapping("/home")
	public String home(ModelMap model) {
		return "home/index";
	}
}
