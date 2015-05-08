package com.wecar.controller.debit;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/debit")
@SessionAttributes("loginUser")
public class DebitController {
	
	@RequestMapping("/debitList")
	public String debitList(ModelMap model) {
		return "debit/debitList";
	}
}
