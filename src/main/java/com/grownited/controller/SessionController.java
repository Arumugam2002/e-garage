package com.grownited.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Users;
import com.grownited.repository.userRepository;

//Creation of Controller
@Controller
public class SessionController {
	
	@Autowired
	userRepository userRepository;
	
	
	
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
	public String saveuser(Users users)
	
	{
		
		System.out.println(users.getFirstName());
		System.out.println(users.getLastName());
		System.out.println(users.getEmail());
		System.out.println(users.getPassword());
		System.out.println(users.getContactNo());
		System.out.println(users.getGender());
		
		users.setRole("USER");
		users.setActive(true);
		users.setCreateAt(new Date());
		
		
		
		userRepository.save(users);
		return "login";
	}
	
	@PostMapping("login")
	public String loginPage(Users users)
	{
		System.out.println(users.getEmail());
		System.out.println(users.getPassword());
		
		
		
		
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
