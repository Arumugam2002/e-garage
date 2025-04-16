package com.grownited.controller.serviceprovider;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.Area;
import com.grownited.entity.City;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.repository.areaRepository;
import com.grownited.repository.cityRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;
import com.grownited.repository.stateRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class ServiceProviderHomeController {

	@Autowired
	areaRepository areaRepository;
	
	@Autowired
	stateRepository stateRepository;
	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
	@Autowired
	serviceRepository serviceRepository;
	
	@Autowired
	userRepository userRepository;
	
	@Autowired
	Cloudinary cloudinary;
	
	
	@GetMapping("serviceproviderhome")
	public String getServiceHomePage()
	{
		return "serviceproviderhome";
	}
	
		

	
	@GetMapping("servicegarage")
	public String getAddGarage(Model model)
	{
		
		List<Area> allAreas = areaRepository.findAll();
		List<City> allCities = cityRepository.findAll();
		List<State> allStates = stateRepository.findAll();
		
		model.addAttribute("allStates", allStates);
		model.addAttribute("allCities", allCities);
		model.addAttribute("allAreas", allAreas);
		
		
		return "servicegarage";
	}
	
	@PostMapping("savegarage")
	public String getSaveGarage(Model model, ServiceProvider serviceProvider, MultipartFile imagePic, HttpSession session)
	{
System.out.println(imagePic.getOriginalFilename());
		
		try {
			
			Map result = cloudinary.uploader().upload(imagePic.getBytes(), ObjectUtils.emptyMap());
			
			
			serviceProvider.setImagePicPath(result.get("url").toString());
		} catch (IOException e) {
			
			
			e.printStackTrace();
			model.addAttribute("errorMessage", "Error uploading file.");
	        return "servicegarage";
		}
		
		Users user = (Users) session.getAttribute("user");
		Integer userid = user.getId();
		
		System.out.println(serviceProvider.getContactNo());
		System.out.println(serviceProvider.getGarageTitle());
		System.out.println(serviceProvider.getOtherInformation());
		System.out.println(serviceProvider.getSpeciality());
		System.out.println(serviceProvider.getZipCode());
		System.out.println(serviceProvider.getExperienceYear());
		serviceProvider.setUserId(userid);
		
		
		
		serviceProviderRepository.save(serviceProvider);
		model.addAttribute("successMessage", "Service Provider added successfully");
		return "redirect:/serviceproviderhome";
	}
	
	
	@GetMapping("servicegarageadd")
	public String getAddServicePage(Model model, Integer garageId)
	{
		
		
		model.addAttribute("garageId", garageId);
		 model.addAttribute("service", new Services());
	
		
		return "servicegarageadd";
	}
	
	
	@PostMapping("servicegarageadd")
	public String getSaveService(Services services, Integer garageId)
	{
		services.setServiceProviderId(garageId);
		
		serviceRepository.save(services);
		
		return "serviceproviderhome";
	}
	
	@GetMapping("viewservicegarage")
	public String getViewGaragePage(Model model, HttpSession session)
	{
		
		Users user = (Users) session.getAttribute("user");
		
		List<ServiceProvider> garages = serviceProviderRepository.findByUserId(user.getId());
        model.addAttribute("garages", garages);
        
		
		
		
		return "viewservicegarage";
	}
	
	@GetMapping("viewserviceproviderservices")
	public String getServicesPage(Integer garageId, Model model)
	{
		List<Services> services = serviceRepository.findByServiceProviderId(garageId); 
		model.addAttribute("services",services);
		
		return "viewserviceproviderservices";
	}
	
}
