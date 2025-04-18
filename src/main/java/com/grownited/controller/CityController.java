package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grownited.entity.City;
import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.repository.cityRepository;
import com.grownited.repository.stateRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CityController {

	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	userRepository userRepository;
	
	@Autowired
	stateRepository stateRepository;
	
	@GetMapping("city")
	public String getCityPage(Model model)
	{
		
		List<State> listStates = stateRepository.findAll();
		model.addAttribute("listStates", listStates);
		
		return "city";
	}
	
	@PostMapping("savecity")
	public String getCity(City city, HttpSession session, Model model)
	{
		
		System.out.println(city.getCityName());
		
		Optional<City> existingCity = cityRepository.findByCityName(city.getCityName());
		
		if(existingCity.isPresent())
		{
			model.addAttribute("errorMessage", "City already exists");
			
			List<State> listStates = stateRepository.findAll();
			model.addAttribute("listStates", listStates);
			return "city";
		}
		
		
		
	City dbCity = cityRepository.save(city);
	
	Users user = (Users) session.getAttribute("user");
	
	System.out.println(user.getFirstName());
	
		user.setCity(dbCity);
		
		userRepository.save(user);
		return "redirect:/listcity";
	}
	
	@GetMapping("listcity")
	public String getAllCity(Model model)
	{
		//List<City> city = cityRepository.findAll();
		
		model.addAttribute("city",cityRepository.getAll());
		
		
		return "listcity";
	}
	
	@GetMapping("deletecity")
	public String deleteArea(Integer id, RedirectAttributes redirectAttributes)
	{
		if(userRepository.existsByCity_CityId(id))
		{
			redirectAttributes.addFlashAttribute("errorMessage", "Cannot delete city; users are linked to it.");
		}
		else {
			try {
				cityRepository.deleteById(id);
				redirectAttributes.addFlashAttribute("successMessage", "City deleted successfully");
			}catch (Exception e) {
				redirectAttributes.addFlashAttribute("errorMessage", "Error deleting city. Please try again later.");
	        }
			
		}	
		
		
		return "redirect:/listcity";
	}
}
