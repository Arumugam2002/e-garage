package com.grownited.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.Users;
import com.grownited.repository.appointmentRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;
import com.grownited.repository.userRepository;
import com.grownited.repository.vehicleRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	userRepository userRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@Autowired
	vehicleRepository vehicleRepository;
	
	@Autowired
	appointmentRepository appointmentRepository;
	
	@Autowired
	Cloudinary cloudinary;
	
	
	@GetMapping("admindashboard")
	public String getAdminDashboard(Model model)
	{
		long userCount =userRepository.count();
		
		Integer totalCustomer = userRepository.findByRole("USER").size();
		
		Integer totalAdmin = userRepository.findByRole("ADMIN").size();
		
		long serviceProviderCount = serviceProviderRepository.count();
		
		long vehiclesCount = vehicleRepository.count();
		
		Integer inProgressAppointment = appointmentRepository.findByStatus("InProgress").size();
		
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		
		
		
		  Integer monthWiseCustomer [] = new Integer[12];
		  
		  for(int i = 1; i <= 12; i++) { 
			    Integer count = userRepository.countThisUserMonth(i); 
			    System.out.println("Month " + i + ": " + count); // Log the result for each month
			    monthWiseCustomer[i-1] = count; 
			}
		  
		  Integer monthWiseAppointment[] = new Integer[12];
		  
		  for(int i=1;i<=12;i++)
		  {
			  Integer count = appointmentRepository.countThisMonthAppointment(i);
			  System.out.println("Month" + i + ": " + count);
			  monthWiseAppointment[i-1] = count;
		  }
		 
		
		Integer thisMonthCustomerCount = userRepository.countThisUserMonth(month);	
		
		model.addAttribute("totalAdmin", totalAdmin);
		
		model.addAttribute("totalCustomer",totalCustomer);
		
		model.addAttribute("monthWiseCustomer",  monthWiseCustomer);
		
		model.addAttribute("monthWiseAppointment",  monthWiseAppointment);
		
		model.addAttribute("thisMonthCustomerCount", thisMonthCustomerCount);
		
		model.addAttribute("currentMonth", LocalDate.now().getMonth());
		
		model.addAttribute("inProgressAppointment",inProgressAppointment);
		
		model.addAttribute("serviceProviderCount", serviceProviderCount);
		
		model.addAttribute("vehiclesCount", vehiclesCount);
		
		model.addAttribute("userCount", userCount);
		
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
	public String getUpdateProfile(Users user, HttpSession session, RedirectAttributes redirectAttributes, MultipartFile profilePic)
	{
		
		if(profilePic!=null && !profilePic.isEmpty())
		{
			System.out.println(profilePic.getOriginalFilename());
			
			try {
				
				Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
				
				user.setProfilePicPath(result.get("url").toString());
			} catch (IOException e) {
				
				
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("errorMessage", "Error uploading file.");
		        return "adminprofile";
			}
		}
		
		
		
		
		Optional<Users> optionalUser = userRepository.findById(user.getId());
		
		if(optionalUser.isPresent())
		{
			Users existingUser = optionalUser.get();
			
			existingUser.setFirstName(user.getFirstName());
			  existingUser.setLastName(user.getLastName());
			  existingUser.setEmail(user.getEmail());
			  
			  
			  existingUser.setContactNo(user.getContactNo());
			  existingUser.setGender(user.getGender());
			  
			  if(profilePic!=null && !profilePic.isEmpty())
			  {
				  existingUser.setProfilePicPath(user.getProfilePicPath());
			  }
			 
			 userRepository.save(existingUser); 
			 
			 session.setAttribute("user", existingUser);
			 
			 redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully");
			 
			 
			 return "redirect:/adminprofile?success=true";
			
		}
		
		else {
			redirectAttributes.addFlashAttribute("error", "User not found");
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
