package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Vehicles;
import com.grownited.repository.vehicleRepository;

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
	public String saveVehicleDetails(Vehicles vehicles)
	{
		System.out.println(vehicles.getManufacturer());
		System.out.println(vehicles.getModel());
		System.out.println(vehicles.getVehicleClass());
		System.out.println(vehicles.getYear());
		
		System.out.println(vehicles.getLicensePlate());
		
		
		vehicleRepository.save(vehicles);
		
		return "vehicles";
	}
	
	
}
