package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping("listservices")
	public String getListServices(Model model)
	{
		
		List<Services> services = serviceRepository.findAll();
		
		model.addAttribute("services", services);
		
		return "listservices";
	}
	
	
	@GetMapping("viewservices")
	public String getViewServices(Integer servicesId, Model model)
	{
		Optional<Services> optionalServices = serviceRepository.findById(servicesId);
		
		if(optionalServices.isEmpty())
		{
			
		}
		else {
			
			Services services = optionalServices.get();
			
			model.addAttribute("services",services);
		}
		
		
		return "viewservices";
	}
	
	@GetMapping("editservices")
	public String getEditServicesPage(Integer servicesId, Model model)
	{
		Optional<Services> services = serviceRepository.findById(servicesId);
		
		if(services.isPresent())
		{
			model.addAttribute("services", services.get());
			return "editservices";
		}
		
		else {
			model.addAttribute("error", "Service id not found");
			return "listservices";
		}
		
	}
}
