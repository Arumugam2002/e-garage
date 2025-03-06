package com.grownited.controller;



import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grownited.entity.Users;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	userRepository userRepository;
	
	@GetMapping("userprofile")
	public String getUserProfile(HttpSession session, Model model)
	{
		
		Users user = (Users) session.getAttribute("user");
		
		model.addAttribute("user",user);
		
		
		return "userprofile";
		
		
	}
	
	@PostMapping("updateuser")
	public String getUpdateUser(Users user, HttpSession session, RedirectAttributes redirectAttributes)
	
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
			 
			 userRepository.save(existingUser); 
			 
			 session.setAttribute("user", existingUser);
			 
			 redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully");
			 
			 return "redirect:/userprofile?success=true";
		}
		
		else {
			redirectAttributes.addFlashAttribute("error", "User not found");
			return "adminprofile";
		}
	}
	
	
}
