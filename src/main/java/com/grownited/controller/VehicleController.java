package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.eclipse.tags.shaded.java_cup.runtime.lr_parser;
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
public class VehicleController {
	
	@Autowired
	vehicleRepository vehicleRepository;

	@GetMapping("vehicles")
	public String getVehiclesPage()
	{
		return "vehicles";
	}
	
	@PostMapping("savevehicles")
	public String saveVehicleDetails(Vehicles vehicles, HttpSession session)
	{
		
		Users user = (Users) session.getAttribute("user");
		Integer userid = user.getId();
		
		
		
		System.out.println(vehicles.getManufacturer());
		System.out.println(vehicles.getModel());
		System.out.println(vehicles.getVehicleClass());
		System.out.println(vehicles.getYear());
		
		System.out.println(vehicles.getLicensePlate());
		
		vehicles.setUserId(userid);
		vehicleRepository.save(vehicles);
		
		return "vehicles";
	}
	
	@GetMapping("listvehicles")
	public String getListVehicles(Model model)
	{
		List<Object[]> vehicles = vehicleRepository.getAllVehicles();
		
		model.addAttribute("vehicles",vehicles);
		
		return "listvehicles";
		
	}
	
	@GetMapping("viewvehicle")
	public String getViewVehicle(Model model, Integer id)
	{
		
		List<Object[]> opVehicles = vehicleRepository.getByVehiclesId(id);
		
		model.addAttribute("vehicle", opVehicles);
		return "viewvehicle";
		
		
		
		
		
	}
	
	@GetMapping("editvehicle")
	public String getEditVehicle(Integer id, Model model)
	{
		
		Optional<Vehicles> optionalVehicles = vehicleRepository.findById(id);
		
		if(optionalVehicles.isPresent())
		{
			model.addAttribute("vehicle", optionalVehicles.get());
			return "editvehicle";
		}
		else {
			
			model.addAttribute("error", "Vehicle not found");
			return "listvehicles";
		}
		
		
	}
	
	
	@PostMapping("editvehicle")
	public String getUpdateVehicle(Vehicles vehicle, Integer vehiclesId, Model model)
	{
		
		
		
		
		
		Optional<Vehicles> opVehicles = vehicleRepository.findById(vehiclesId);
		
		if(opVehicles.isPresent())
		{
			Vehicles existingVehicles = opVehicles.get();
			
			existingVehicles.setManufacturer(vehicle.getManufacturer());
			existingVehicles.setModel(vehicle.getModel());
			existingVehicles.setYear(vehicle.getYear());
			existingVehicles.setLicensePlate(vehicle.getLicensePlate());
			existingVehicles.setVehicleClass(vehicle.getVehicleClass());
			
			
			
			
			vehicleRepository.save(existingVehicles);
			
			model.addAttribute("vehicle",existingVehicles);
			
			return "redirect:/listvehicles";
	
		}
		else {
			
			model.addAttribute("error", "Vehicle Details not updated");
			
			return "editvehicle";
		}
	}
	
	@GetMapping("deletevehicle")
	public String getDeleteVehicle(Integer id)
	{
		vehicleRepository.deleteById(id);
		
		return "redirect:/listvehicles";
	}
	
}
