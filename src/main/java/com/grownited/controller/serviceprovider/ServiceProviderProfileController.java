package com.grownited.controller.serviceprovider;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.Area;
import com.grownited.entity.City;
import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.repository.areaRepository;
import com.grownited.repository.cityRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;
import com.grownited.repository.stateRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class ServiceProviderProfileController {

	
	@Autowired
	areaRepository areaRepository;
	
	@Autowired
	stateRepository stateRepository;
	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
	@Autowired
	serviceRepository serviceRepository;
	
	@Autowired
	userRepository userRepository;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	Cloudinary cloudinary;

	@GetMapping("serviceproviderprofile")
	public String getServiceProviderProfile(HttpSession session, Model model)
	{
		
		Users user = (Users) session.getAttribute("user");
		
		List<Area> allAreas = areaRepository.findAll();
		List<City> allCities = cityRepository.findAll();
		List<State> allStates = stateRepository.findAll();
		
		model.addAttribute("allStates", allStates);
		model.addAttribute("allCities", allCities);
		model.addAttribute("allAreas", allAreas);
		model.addAttribute("user",user);
		
		return "serviceproviderprofile";
	}
	
	@PostMapping("updateserviceprovider")
	public String getUpdateServiceProvider(Users user, HttpSession session, RedirectAttributes redirectAttributes, MultipartFile profilePic, Integer stateId, Integer areaId, Integer cityId)
	{
		State selectedState = stateRepository.findById(stateId).orElse(null);
		City selectedCity = cityRepository.findById(cityId).orElse(null);
		Area selectedArea = areaRepository.findById(areaId).orElse(null);
		
		if(profilePic!=null && !profilePic.isEmpty())
		{
			System.out.println(profilePic.getOriginalFilename());
			
			try {
				
				Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
				
				user.setProfilePicPath(result.get("url").toString());
			} catch (IOException e) {
				
				
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("errorMessage", "Error uploading file.");
		        return "serviceproviderprofile";
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
				  existingUser.setArea(selectedArea);
				  existingUser.setCity(selectedCity);
				  existingUser.setState(selectedState);
				  
				  if(profilePic!=null && !profilePic.isEmpty())
				  {
					  existingUser.setProfilePicPath(user.getProfilePicPath());
				  }
				 
				 userRepository.save(existingUser); 
				 
				 session.setAttribute("user", existingUser);
				 
				 redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully");
				 
				 return "redirect:/serviceproviderprofile?success=true";
		}
			else {
				redirectAttributes.addFlashAttribute("error", "User not found");
				return "serviceproviderprofile";
			}
	}
	
	@GetMapping("serviceproviderchangepassword")
	public String getProviderChangePassword()
	{
		return "serviceproviderchangepassword";
	}
	
	
	@PostMapping("updateserviceproviderpassword")
	public String getUpdateProviderPassword(String oldpassword, String newpassword, String confirmpassword, HttpSession session, Model model)
	{
		Users user = (Users) session.getAttribute("user");
		
		Optional<Users> optionalUser = userRepository.findById(user.getId());
		
		if(!optionalUser.isPresent())
		{
			model.addAttribute("error", "user not found");
			return "serviceproviderchangepassword";
		}
		
		Users existingUser = optionalUser.get();
		
		if(!encoder.matches(oldpassword, existingUser.getPassword()))
		{
			model.addAttribute("error", "Old Password is incorrect");
			return "serviceproviderchangepassword";
		}
		
		
		if(!newpassword.equals(confirmpassword))
		{
			model.addAttribute("error", "New password does not match with confirm password");
			
			return "serviceproviderchangepassword";
		}
		
		existingUser.setPassword(encoder.encode(newpassword));
		
		userRepository.save(existingUser);
		
		session.setAttribute("user", existingUser);
		
		model.addAttribute("successMessage", "Password changed successfully");
		return "serviceproviderchangepassword";
	}
	
	
}
