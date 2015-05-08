package com.wecar.controller.login;


import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.wecar.common.Constant;
import com.wecar.form.login.LoginForm;
import com.wecar.service.user.IUserService;

@Controller
@SessionAttributes("loginUser")
public class LoginController {
	@Autowired
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/toLogin")
	public String toLogin(@ModelAttribute("loginForm")LoginForm loginForm, ModelMap model) {
		return "login/login";
	}
	
	@RequestMapping("/login")
	public String login(@ModelAttribute("loginForm") LoginForm loginForm, BindingResult result, ModelMap model) {
		if (!result.hasErrors()) {
			Map<String, Object> map = userService.login(loginForm.getUser_name(), loginForm.getPassword());
			String loginCode = (String)map.get("loginCode");
			if (!StringUtils.isEmpty(loginCode)) {
				if (Constant.LOGIN_USER_NOT_EXIST.equals(loginCode)) {
					result.rejectValue("user_name", "", "登录名不存在");
				} else {
					result.rejectValue("password", "", "密码错误");
				}
			} else {
				model.addAttribute("loginUser", map.get("loginUser"));
			}
		}
		if (result.hasErrors()) {
			return "login/login";
		}
		return "home/index";
	}
	
	@RequestMapping("/logout")
	public String logout(ModelMap model, SessionStatus status) {
		model.addAttribute("loginUser", null);
		status.setComplete();
		return "home/index";
	}
}
