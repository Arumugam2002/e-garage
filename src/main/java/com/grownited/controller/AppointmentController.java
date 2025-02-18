package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Appointment;
import com.grownited.repository.appointmentRepository;

@Controller
public class AppointmentController {

	
	@Autowired
	appointmentRepository appointmentRepository;
	
	
	@GetMapping("appointment")
	public String getAppointment()
	{
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
		
		appointmentRepository.save(appointment);
		
		return "index";
	}
	
	
	
}
