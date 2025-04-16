package com.grownited.controller.user;



import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.dto.CityDto;
import com.grownited.entity.Area;
import com.grownited.entity.City;
import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.repository.areaRepository;
import com.grownited.repository.cityRepository;
import com.grownited.repository.stateRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	userRepository userRepository;
	
	@Autowired
	areaRepository areaRepository;
	
	
	@Autowired
	stateRepository stateRepository;
	
	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	Cloudinary cloudinary;
	
	@GetMapping("userprofile")
	public String getUserProfile(HttpSession session, Model model)
	{
		
		Users user = (Users) session.getAttribute("user");
		
		List<State> allStates = stateRepository.findAll();
        List<City> allCities = cityRepository.findAll();
        List<Area> allAreas = areaRepository.findAll();
        
        model.addAttribute("allStates", allStates);
        model.addAttribute("allCities", allCities);
        model.addAttribute("allAreas", allAreas);
        
        
        model.addAttribute("selectedStateId", user.getState());
        model.addAttribute("selectedCityId", user.getCity());
        model.addAttribute("selectedAreaId", user.getArea());
		
		model.addAttribute("user",user);
		
		
		return "userprofile";
		
		
	}
	
	@PostMapping("updateuser")
	public String getUpdateUser(Users user, HttpSession session, RedirectAttributes redirectAttributes, MultipartFile profilePic, Integer stateId, Integer areaId, Integer cityId)
	
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
		        return "userprofile";
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
			 
			 return "redirect:/userprofile?success=true";
		}
		
		else {
			redirectAttributes.addFlashAttribute("error", "User not found");
			return "userprofile";
		}
	}
	
	@GetMapping("userchangepassword")
	public String getUserChangePassword()
	{
		return "userchangepassword";
	}
	
	@PostMapping("updateuserpassword")
	public String getUpdateUserPassword(String oldpassword, String newpassword, String confirmpassword, HttpSession session, Model model)
	{
		Users user = (Users) session.getAttribute("user");
		
		Optional<Users> optionalUser = userRepository.findById(user.getId());
		
		if(!optionalUser.isPresent())
		{
			model.addAttribute("error", "user not found");
			return "userchangepassword";
		}
		
		Users existingUser = optionalUser.get();
		
		if(!encoder.matches(oldpassword, existingUser.getPassword()))
		{
			model.addAttribute("error", "Old Password is incorrect");
			return "userchangepassword";
		}
		
		
		if(!newpassword.equals(confirmpassword))
		{
			model.addAttribute("error", "New password does not match with confirm password");
			
			return "userchangepassword";
		}
		
		existingUser.setPassword(encoder.encode(newpassword));
		
		userRepository.save(existingUser);
		
		session.setAttribute("user", existingUser);
		
		model.addAttribute("successMessage", "Password changed successfully");
		return "userchangepassword";
	}
	
	@GetMapping("/get-cities")
	@ResponseBody
	public List<Map<String, Object>> getCitiesByState(@RequestParam("stateId") int stateId) {
	    List<City> cities = cityRepository.findByStateId(stateId);
	    List<Map<String, Object>> cityList = new ArrayList<>();

	    for (City city : cities) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("cityId", city.getCityId());
	        map.put("cityName", city.getCityName());
	        cityList.add(map);
	    }
	    return cityList;
	}

	@GetMapping("/get-areas")
	@ResponseBody
	public List<Map<String, Object>> getAreasByCity(@RequestParam("cityId") int cityId) {
	    List<Area> areas = areaRepository.findByCityId(cityId);
	    List<Map<String, Object>> areaList = new ArrayList<>();

	    for (Area area : areas) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("areaId", area.getAreaId());
	        map.put("areaName", area.getAreaName());
	        areaList.add(map);
	    }
	    return areaList;
	}
	
}
