package com.grownited.controller.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		
		model.addAttribute("user", user);
		
		
		return "adminprofile";
	}
	
	@PostMapping("updateadmin")
	public String getUpdateProfile(Users user, HttpSession session, Model model)
	{
		Optional<Users> optionalUser = userRepository.findById(user.getId());
		
		if(optionalUser.isPresent())
		{
			Users existingUser = optionalUser.get();
			
			existingUser.setFirstName(user.getFirstName());
			  existingUser.setLastName(user.getLastName());
			  existingUser.setEmail(user.getEmail());
			  
			  
			  existingUser.setContactNo(user.getContactNo());
			  existingUser.setGender(user.getGender());
			 
			 userRepository.save(user); 
			 session.setAttribute("user", existingUser);
			 
			 return "redirect:/user/adminprofile?success=true";
			
		}
		
		else {
			model.addAttribute("error", "User not found");
			return "adminprofile";
		}
		
		
		/*
		 * optionalUser.ifPresent(existingUser -> {
		 * 
		 * existingUser.setFirstName(user.getFirstName());
		 * existingUser.setLastName(user.getLastName());
		 * existingUser.setEmail(user.getEmail());
		 * 
		 * 
		 * existingUser.setContactNo(user.getContactNo());
		 * existingUser.setGender(user.getGender());
		 * 
		 * userRepository.save(user); session.setAttribute("user", existingUser);
		 * 
		 * 
		 * });
		 */
		/* return "redirect:/user/adminprofile?success=true"; */
	}
	
}
