package com.wecar.controller.register;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wecar.common.Constant;
import com.wecar.common.SystemUtils;
import com.wecar.form.register.RegisterForm;
import com.wecar.model.user.User;
import com.wecar.model.user.UserType;
import com.wecar.service.user.IUserService;

@Controller
@SessionAttributes("loginUser")
public class RegisterController {
	@Autowired
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	
	@RequestMapping("/toRegister")
	public String toRegister(@ModelAttribute("registerForm") RegisterForm registerForm, 
			BindingResult result, ModelMap model) {
		return "register/regIndex";
	}
	
	@RequestMapping("/regStep2")
	public String regStep2(@ModelAttribute("registerForm") RegisterForm registerForm, 
			BindingResult result, ModelMap model) {
		return "register/regStep2";
	}
	
	@RequestMapping("/register")
	public String register(@ModelAttribute("registerForm") RegisterForm registerForm, 
			BindingResult result, ModelMap model) {
		if (!result.hasErrors()) {
			User user = new User();
			user.setUser_name(registerForm.getUser_name());
			user.setPassword(SystemUtils.encryptPWD(registerForm.getPassword()));
			user.setType(UserType.M);
			user.setCellphone(registerForm.getCellphone());
			user.setEmail(registerForm.getEmail());
			String msg = userService.registerUser(user);
			if (Constant.USERNAME_EXISTED.equals(msg)) {
				result.rejectValue("user_name", "", "登陆名'"+registerForm.getUser_name()+"'已经存在");
			}
			if (Constant.EMAIL_EXISTED.equals(msg)) {
				result.rejectValue("email", "", "邮箱地址'"+registerForm.getUser_name()+"'已经存在");
			}
			model.addAttribute("loginUser", user);
		}
		if (result.hasErrors()) {
			return "register/regIndex";
		}
		return "redirect:home.do";
	}
	
}
