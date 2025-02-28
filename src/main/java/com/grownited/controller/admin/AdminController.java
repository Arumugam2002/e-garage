package com.grownited.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.Users;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	userRepository userRepository;
	
	
	@GetMapping("admindashboard")
	public String getAdminDashboard()
	{
		return "admindashboard";
	}
	
	@GetMapping("adminprofile")
	public String getAdminProfile(HttpSession session, Model model)
	{
		Users user = (Users)session.getAttribute("user");
		
		
		
		
		return "adminprofile";
	}
	
}
