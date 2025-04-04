package com.grownited.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Appointment;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.repository.appointmentRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;

@Controller
public class BookServiceController {

	@Autowired
	serviceRepository serviceRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@Autowired
	appointmentRepository appointmentRepository;
	
	@GetMapping("bookservice")
	public String getBookService(Model model, Integer id)
	{
		
		List<Services> allServices = serviceRepository.findAll();
		
		Optional<ServiceProvider> allServiceProviders = serviceProviderRepository.findById(id);
		
		
		if(allServiceProviders.isPresent())
		{
			model.addAttribute("allServices", allServices);
			model.addAttribute("allServiceProviders",allServiceProviders.get());
			
			return "userbookservice";
		}
		else {
			model.addAttribute("error", "Service not there");
			
			return "viewgarage";
		}
		
		
		
		
		
		
		
	}
	
	@PostMapping("bookappointment")
	public String bookAppointment(Appointment appointment, Model model)
	{
		
		appointment.setStatus("Pending");
		appointmentRepository.save(appointment);
			
		
		return "redirect:/garages";
	}
	
}
