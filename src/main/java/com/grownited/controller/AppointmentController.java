package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grownited.entity.Appointment;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.repository.appointmentRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;

@Controller
public class AppointmentController {

	
	@Autowired
	appointmentRepository appointmentRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@Autowired
	serviceRepository serviceRepository;
	
	
	@GetMapping("appointment")
	public String getAppointment(Model model)
	{
		
		List<Services> allServices = serviceRepository.findAll();
		
		List<ServiceProvider> allServiceProviders = serviceProviderRepository.findAll();
		
		model.addAttribute("allServices",allServices);
		
		model.addAttribute("allServiceProviders",allServiceProviders);
		
		return "appointment";
	}
	
	
	@PostMapping("saveappointment")
	public String getSaveAppointment(Appointment appointment)
	{
		
		System.out.println(appointment.getReason());
		System.out.println(appointment.getBasePrice());
		System.out.println(appointment.getPrice());
		System.out.println(appointment.getAppointmentDateTime());
		System.out.println(appointment.getStatus());
		
		appointment.setStatus("Pending");
		
		appointmentRepository.save(appointment);
		
		return "redirect:/listappointments";
	}
	
	
	@GetMapping("listappointments")
	public String getListAppointments(Model model)
	{
		List<Object[]> allAppointments = appointmentRepository.getAll();
		
		model.addAttribute("allAppointments",allAppointments);
		
		return "listappointments";
	}
	
	@PostMapping("updateappointmentstatus")
	public String getUpdateAppointmentStatus(Integer appointmentId, String status, RedirectAttributes redirectAttributes)
	{
		Optional<Appointment> optionalAppointment = appointmentRepository.findById(appointmentId);
		
		if(optionalAppointment.isPresent())
		{
			Appointment appointment = optionalAppointment.get();
			
			appointment.setStatus(status);
			
			appointmentRepository.save(appointment);
			
			redirectAttributes.addFlashAttribute("successMessage", "Status Updated successfully");
		}
		else {
			redirectAttributes.addFlashAttribute("error", "Appointment not found");
		}
		
		return "redirect:/listappointments";
	}
	
}
