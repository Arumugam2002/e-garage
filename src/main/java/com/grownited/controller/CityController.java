package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.City;
import com.grownited.entity.Users;
import com.grownited.repository.cityRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CityController {

	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	userRepository userRepository;
	
	@GetMapping("city")
	public String getCityPage()
	{
		return "city";
	}
	
	@PostMapping("savecity")
	public String getCity(City city, HttpSession session)
	{
		
		System.out.println(city.getCityName());
		
	City dbCity = cityRepository.save(city);
	
	Users user = (Users) session.getAttribute("loggedInUser");
	
	System.out.println(user.getFirstName());
	
		user.setCity(dbCity);
		
		userRepository.save(user);
		return "index";
	}
	
	@GetMapping("listcity")
	public String getAllCity(Model model)
	{
		List<City> city = cityRepository.findAll();
		
		model.addAttribute("city",city);
		
		
		return "listcity";
	}
}
