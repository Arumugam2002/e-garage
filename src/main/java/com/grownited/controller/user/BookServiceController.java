package com.grownited.controller.user;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.Appointment;
import com.grownited.entity.AppointmentService;
import com.grownited.entity.Cart;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.entity.Users;
import com.grownited.entity.Vehicles;
import com.grownited.repository.appointmentRepository;
import com.grownited.repository.appointmentServiceRepository;
import com.grownited.repository.cartRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;
import com.grownited.repository.vehicleRepository;

import jakarta.mail.FetchProfile.Item;
import jakarta.servlet.http.HttpSession;

@Controller
public class BookServiceController {

	@Autowired
	serviceRepository serviceRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@Autowired
	appointmentRepository appointmentRepository;
	
	@Autowired
	cartRepository cartRepository;
	
	@Autowired
	vehicleRepository vehicleRepository;
	
	
	@Autowired
	appointmentServiceRepository appointmentServiceRepository;
	
	/*
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
	*/
	
	@PostMapping("bookappointment")
	public String bookAppointment (Model model, HttpSession session, Integer id, String appointmentDateTimeStr, String reason, Integer vehiclesId)
	{
		
		Users user = (Users) session.getAttribute("user");
		Integer userId = user.getId();
		
		List<Cart> cartItems = cartRepository.findByUserId(userId);
		
		
		
		
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime appointmentDateTime = LocalDateTime.parse(appointmentDateTimeStr, formatter);
		
		double totalPrice = 0;
	    for (Cart item : cartItems) {
	        totalPrice += item.getPrice();
	    }

	    Appointment tempAppointment = new Appointment();
	    
	    tempAppointment.setServiceProviderId(id);
	    tempAppointment.setAppointmentDateTime(appointmentDateTime);
	    tempAppointment.setPrice(totalPrice);
	    tempAppointment.setBasePrice(totalPrice);
	    tempAppointment.setStatus("Booked");
	    tempAppointment.setUserId(userId);
	    tempAppointment.setReason(reason);
	    tempAppointment.setVehiclesId(vehiclesId);
	    
	    session.setAttribute("tempAppointment", tempAppointment);
	    session.setAttribute("cartItems", cartItems);
	    
		/*
		 * appointment.setAppointmentDateTime(appointmentDateTime);
		 * appointment.setPrice(totalPrice); appointment.setBasePrice(totalPrice);
		 * appointment.setStatus("Booked"); appointment.setUserId(userId);
		 */

	    //Appointment savedAppointment = appointmentRepository.save(appointment); // get generated ID

	   /* 
	    for (Cart item : cartItems) {
	        AppointmentService appService = new AppointmentService();
	        //appService.setAppointmentId(savedAppointment.getAppointmentId());
	        appService.setServicesId(item.getServicesId());
	        appService.setPrice(item.getPrice());

	       // appointmentServiceRepository.save(appService);
	    } */

	    // Optionally clear the cart
	   // cartRepository.deleteAll(cartItems);

	    return "redirect:/checkout";
	}
	
	
	@GetMapping("viewuserappointment")
	public String getUserAppointment(HttpSession session, Model model)
	{
		Users user = (Users) session.getAttribute("user");
		Integer userId = user.getId();
		
		List<Object[]> appointments = appointmentRepository.getAppointmentByUserId(userId);
		model.addAttribute("appointments", appointments);
		
		return "viewuserappointment";
	}
	
	@PostMapping("/cancel-appointment")
	public String cancelAppointment(@RequestParam("appointmentId") Integer appointmentId,Model model, HttpSession session) {
	   
		Users user = (Users) session.getAttribute("user");
		Integer userId = user.getId();
		
	    int updated = appointmentRepository.cancelAppointment("Cancelled", appointmentId, userId);

	    if (updated > 0) {
	        model.addAttribute("success", "Appointment Cancelled Successfully");
	    } else {
	        model.addAttribute("error", "Could not cancel appointment");
	    }
	    return "redirect:/viewuserappointment"; // or wherever your user sees appointments
	}
	
}
