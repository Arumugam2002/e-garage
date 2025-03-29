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
import com.grownited.entity.Users;
import com.grownited.entity.Vehicles;
import com.grownited.repository.serviceProviderRepository;

import jakarta.servlet.http.HttpSession;

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
	public String getSaveServiceProvider(ServiceProvider serviceProvider, HttpSession session, Model model)
	{
		
		Users user = (Users) session.getAttribute("user");
		
		if(user != null)
		{
			System.out.println(serviceProvider.getContactNo());
			System.out.println(serviceProvider.getGarageTitle());
			System.out.println(serviceProvider.getOtherInformation());
			System.out.println(serviceProvider.getSpeciality());
			System.out.println(serviceProvider.getZipCode());
			System.out.println(serviceProvider.getExperienceYear());
			//serviceProvider.setUser(user);
			
			
			
			serviceProviderRepository.save(serviceProvider);
			model.addAttribute("successMessage", "Service Provider added successfully");
			return "redirect:/listserviceproviders";
		}
		else {
			
			model.addAttribute("error", "user id not found");
			return "serviceprovider";
		}
		
		
		
		
		
		
	}
	
	@GetMapping("listserviceproviders")
	public String getListServiceProvider(Model model)
	{
		List<ServiceProvider> serviceProvider = serviceProviderRepository.findAll();
		
		model.addAttribute("serviceProvider",serviceProvider);
		
		return "listserviceproviders";
	}
	
	@GetMapping("viewserviceprovider")
	public String getViewServiceProvider(Integer id, Model model)
	{
		
Optional<ServiceProvider> optionalServiceProvider = serviceProviderRepository.findById(id);
		
		if(optionalServiceProvider.isEmpty())
		{
			
		}
		else {
			
			ServiceProvider serviceProvider = optionalServiceProvider.get();
			
			model.addAttribute("serviceProvider",serviceProvider);
		}
		
		
	
		
		return "viewserviceprovider";
	}
	
	@GetMapping("editserviceprovider")
	public String getEditServiceProvider(Integer id, Model model)
	{
		
Optional<ServiceProvider> optionalServiceProvider = serviceProviderRepository.findById(id);
		
		if(optionalServiceProvider.isPresent())
		{
			model.addAttribute("serviceProvider", optionalServiceProvider.get());
			return "editserviceprovider";
		}
		else {
			
			model.addAttribute("error", "Vehicle not found");
			return "listserviceproviders";
		}
		
	}
	
	
	@PostMapping("editserviceprovider")
	public String getUpdateServiceProvider(Integer id, Model model, ServiceProvider serviceProvider)
	{
		Optional<ServiceProvider> optionalServiceProvider = serviceProviderRepository.findById(id);
		
		if(optionalServiceProvider.isPresent())
		{
			ServiceProvider existingServiceProvider = optionalServiceProvider.get();
			
			existingServiceProvider.setContactNo(serviceProvider.getContactNo());
			existingServiceProvider.setExperienceYear(serviceProvider.getExperienceYear());
			existingServiceProvider.setGarageTitle(serviceProvider.getGarageTitle());
			
			existingServiceProvider.setOtherInformation(serviceProvider.getOtherInformation());
			existingServiceProvider.setSpeciality(serviceProvider.getSpeciality());
			existingServiceProvider.setZipCode(serviceProvider.getZipCode());
			
			
			
			serviceProviderRepository.save(existingServiceProvider);
			
			
			
			return "redirect:/listserviceproviders";
		}
		else {
			model.addAttribute("error", "ServiceProvider not updated");
			return "editserviceprovider";
		}
	}
	
	@GetMapping("deleteserviceprovider")
	public String getDeleteServiceProvider(Integer id)
	{
		serviceProviderRepository.deleteById(id);
		
		return "redirect:/listserviceproviders";
	}
	
	
}
