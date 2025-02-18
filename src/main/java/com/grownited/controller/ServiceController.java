package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Services;
import com.grownited.repository.serviceRepository;

@Controller
public class ServiceController {

	@Autowired
	serviceRepository serviceRepository;
	
	
	@GetMapping("services")
	public String getServices()
	{
		return "services";
	}
	
	@PostMapping("saveservices")
	public String getSaveServices(Services services)
	{
		
		System.out.println(services.getServiceDescription());
		System.out.println(services.getServiceName());
		System.out.println(services.getAllInclusivePrice());
		
		serviceRepository.save(services);
		
		return "index";
	}
}
