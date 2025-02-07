package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//Creation of Controller
@Controller
public class SessionController {
	
	@GetMapping("signup")
	public String signup()
	{
		return "signup";
	}
	
	
	@GetMapping("login")
	public String login()
	{
		return "login";
	}

}
