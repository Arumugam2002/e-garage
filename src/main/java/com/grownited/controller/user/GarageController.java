package com.grownited.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Vehicles;
import com.grownited.repository.serviceProviderRepository;

@Controller
public class GarageController {

	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
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
		
Optional<ServiceProvider> opServiceProvider = serviceProviderRepository.findById(id);
		
		if(opServiceProvider.isPresent())
		{
			
			 
			
			model.addAttribute("garages", opServiceProvider.get());
			return "viewgarage";
		}
		else
		{
			model.addAttribute("error","Vehicle id not found");
			return "garages";
		}
		
		
	}
	
}
