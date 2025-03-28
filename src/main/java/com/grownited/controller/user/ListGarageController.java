package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.ServiceProvider;
import com.grownited.repository.serviceProviderRepository;

@Controller
public class ListGarageController {

	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
	@GetMapping("garages")
	public String getListGarages(Model model)
	{
		List<ServiceProvider> allGarages = serviceProviderRepository.findAll();
		
		model.addAttribute("allGarages",allGarages);
		
		return "garages";
	}
	
}
