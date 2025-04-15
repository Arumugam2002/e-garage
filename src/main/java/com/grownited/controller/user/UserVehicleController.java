package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Users;
import com.grownited.entity.Vehicles;
import com.grownited.repository.vehicleRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserVehicleController {

	@Autowired
	vehicleRepository vehicleRepository;
	
	@GetMapping("useraddvehicles")
	public String getAddVehicles()
	{
		return "useraddvehicles";
	}
	
	@PostMapping("useraddvehicles")
	public String getSaveVehicles(Vehicles vehicles, HttpSession session)
	{
		Users user = (Users) session.getAttribute("user");
		Integer userid = user.getId();
		
		vehicles.setUserId(userid);
		
		vehicleRepository.save(vehicles);
		
		return "useraddvehicles";
	}
	
	@GetMapping("userviewvehicles")
	public String getVehicles(Model model, HttpSession session)
	{
		
		Users user = (Users) session.getAttribute("user");
		Integer userid = user.getId();
		List<Vehicles> vehicles = vehicleRepository.findByUserId(userid);
		
		model.addAttribute("vehicles", vehicles);
		
		return "userviewvehicles";
		
	}
	
}
