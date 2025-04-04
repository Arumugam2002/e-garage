package com.grownited.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.entity.Vehicles;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;

@Controller
public class GarageController {

	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@Autowired
	serviceRepository serviceRepository;
	
	
	@GetMapping("garages")
	public String getListGarages(Model model)
	{
		List<ServiceProvider> allGarages = serviceProviderRepository.findAll();
		
		model.addAttribute("allGarages",allGarages);
		
		return "garages";
	}
	
	@GetMapping("viewgarage")
	public String getViewGarage(Integer id, Model model)
	{
		
		List<Services> services = serviceRepository.findAll();
		
Optional<ServiceProvider> opServiceProvider = serviceProviderRepository.findById(id);

	
		
		if(opServiceProvider.isPresent())
		{
			
			model.addAttribute("services", services); 
			
			model.addAttribute("garages", opServiceProvider.get());
			return "viewgarage";
		}
		else
		{
			model.addAttribute("error","Data not found");
			return "garages";
		}
		
		
	}
	
	
	
}
