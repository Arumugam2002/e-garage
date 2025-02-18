package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.ServiceProvider;
import com.grownited.repository.serviceProviderRepository;

@Controller
public class ServiceProviderController {

	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
	@GetMapping("serviceprovider")
	public String getServiceProvider()
	{
		return "serviceprovider";
	}
	
	@PostMapping("saveserviceprovider")
	public String getSaveServiceProvider(ServiceProvider serviceProvider)
	{
		
		System.out.println(serviceProvider.getContactNo());
		System.out.println(serviceProvider.getGarageTitle());
		System.out.println(serviceProvider.getOtherInformation());
		System.out.println(serviceProvider.getSpeciality());
		System.out.println(serviceProvider.getZipCode());
		System.out.println(serviceProvider.getExperienceYear());
		
		serviceProviderRepository.save(serviceProvider);
		
		
		
		return "index";
	}
	
}
