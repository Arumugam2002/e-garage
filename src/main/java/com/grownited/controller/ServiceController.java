package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;

@Controller
public class ServiceController {

	@Autowired
	serviceRepository serviceRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
	@GetMapping("services")
	public String getServices(Model model)
	{
		
		List<ServiceProvider> allServiceProviders = serviceProviderRepository.findAll();
		
		model.addAttribute("allServiceProviders",allServiceProviders);
		
		
		return "services";
	}
	
	@PostMapping("saveservices")
	public String getSaveServices(Services services)
	{
		
		System.out.println(services.getServiceDescription());
		System.out.println(services.getServiceName());
		System.out.println(services.getAllInclusivePrice());
		
		serviceRepository.save(services);
		
		return "redirect:/listservices";
	}
	
	@GetMapping("listservices")
	public String getListServices(Model model)
	{
		
		List<Object[]> services = serviceRepository.getAll();
		
		model.addAttribute("services", services);
		
		return "listservices";
	}
	
	
	@GetMapping("viewservices")
	public String getViewServices(Integer servicesId, Model model)
	{
		Optional<Services> optionalServices = serviceRepository.findById(servicesId);
		
		if(!optionalServices.isPresent())
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
		
		List<ServiceProvider> serviceProviders = serviceProviderRepository.findAll();
		
		Optional<Services> services = serviceRepository.findById(servicesId);
		
		if(services.isPresent())
		{
			model.addAttribute("services", services.get());
			model.addAttribute("allServiceProviders", serviceProviders);
			return "editservices";
		}
		
		else {
			model.addAttribute("error", "Service id not found");
			return "listservices";
		}
		
	}
	
	@PostMapping("editservices")
	public String getUpdateServicesPage(Integer servicesId, Model model, Services services)
	{
		
		Optional<Services> optionalServices = serviceRepository.findById(servicesId);
		
		if(optionalServices.isPresent())
		{
			Services existingServices = optionalServices.get();
			
			existingServices.setServiceName(services.getServiceName());
			existingServices.setServiceDescription(services.getServiceDescription());
			existingServices.setAllInclusivePrice(services.getAllInclusivePrice());
			existingServices.setServiceProviderId(services.getServiceProviderId());
			
			serviceRepository.save(existingServices);
			
			
			
			return "redirect:/listservices";
		}
		else {
			model.addAttribute("error", "Services not updated");
			return "editservices";
		}
	}
	
	@GetMapping("deleteservices")
	public String getDeleteServices(Integer servicesId)
	{
		serviceRepository.deleteById(servicesId);
		
		return "redirect:/listservices";
	}
}
