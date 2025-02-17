package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.City;
import com.grownited.repository.cityRepository;

@Controller
public class CityController {

	
	@Autowired
	cityRepository cityRepository;
	
	@GetMapping("city")
	public String getCityPage()
	{
		return "city";
	}
	
	@PostMapping("savecity")
	public String getCity(City city)
	{
		
		System.out.println(city.getCityName());
		
		cityRepository.save(city);
		
		return "city";
	}
}
