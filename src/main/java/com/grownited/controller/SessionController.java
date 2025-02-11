package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

//Creation of Controller
@Controller
public class SessionController {
	
	@GetMapping(value={"/","signup"})
	public String signup()
	{
		return "signup";
	}
	
//	@GetMapping("/")
//	public String home()
//	{
//		return "index";
//	}
	
	@GetMapping("login")
	public String login()
	{
		return "login";
	}
	
	@GetMapping("forgetpassword")
	public String forgetPasswordPage()
	{
		return "forgetpassword";
	}

	@PostMapping("saveuser")
	public String saveuser()
	{
		return "login";
	}
	
	@PostMapping("login")
	public String loginPage()
	{
		return "index";
	}
	
	@PostMapping("sendOtp")
	public String sendOtp()
	{
		return "changepassword";
	}
	
	@PostMapping("updatePassword")
	public String updatePassword()
	{
		return "login";
	}
	
	

}
