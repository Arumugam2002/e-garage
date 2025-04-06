package com.grownited.controller;

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

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.dto.ServiceProviderDto;
import com.grownited.entity.Area;
import com.grownited.entity.City;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.entity.Vehicles;
import com.grownited.repository.areaRepository;
import com.grownited.repository.cityRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.stateRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class ServiceProviderController {

	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@Autowired
	areaRepository areaRepository;
	
	@Autowired
	stateRepository stateRepository;
	
	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	Cloudinary cloudinary;
	
	
	@GetMapping("serviceprovider")
	public String getServiceProvider(Model model)
	{
		
		List<Area> allAreas = areaRepository.findAll();
		List<City> allCities = cityRepository.findAll();
		List<State> allStates = stateRepository.findAll();
		
		model.addAttribute("allStates", allStates);
		model.addAttribute("allCities", allCities);
		model.addAttribute("allAreas", allAreas);
		
		return "serviceprovider";
	}
	
	@PostMapping("saveserviceprovider")
	public String getSaveServiceProvider(ServiceProvider serviceProvider, HttpSession session, Model model, MultipartFile imagePic)
	{
		
		System.out.println(imagePic.getOriginalFilename());
		
		try {
			
			Map result = cloudinary.uploader().upload(imagePic.getBytes(), ObjectUtils.emptyMap());
			
			
			serviceProvider.setImagePicPath(result.get("url").toString());
		} catch (IOException e) {
			
			
			e.printStackTrace();
			model.addAttribute("errorMessage", "Error uploading file.");
	        return "serviceprovider";
		}
		
		
		Users user = (Users) session.getAttribute("user");
		
		if(user != null)
		{
			System.out.println(serviceProvider.getContactNo());
			System.out.println(serviceProvider.getGarageTitle());
			System.out.println(serviceProvider.getOtherInformation());
			System.out.println(serviceProvider.getSpeciality());
			System.out.println(serviceProvider.getZipCode());
			System.out.println(serviceProvider.getExperienceYear());
			//serviceProvider.setUser(user);
			
			
			
			serviceProviderRepository.save(serviceProvider);
			model.addAttribute("successMessage", "Service Provider added successfully");
			return "redirect:/listserviceproviders";
		}
		else {
			
			model.addAttribute("error", "user id not found");
			return "serviceprovider";
		}
		
		
		
		
		
		
	}
	
	@GetMapping("listserviceproviders")
	public String getListServiceProvider(Model model)
	{
		List<ServiceProviderDto> serviceProvider = serviceProviderRepository.getAll();
		
		model.addAttribute("serviceProvider",serviceProvider);
		
		return "listserviceproviders";
	}
	
	@GetMapping("viewserviceprovider")
	public String getViewServiceProvider(Integer id, Model model)
	{
		
		ServiceProviderDto serviceProvider = serviceProviderRepository.getByServiceProviderId(id);
		
	
		model.addAttribute("serviceProvider",serviceProvider);
		
		return "viewserviceprovider";
	}
	
	@GetMapping("editserviceprovider")
	public String getEditServiceProvider(Integer id, Model model)
	{
		
Optional<ServiceProvider> optionalServiceProvider = serviceProviderRepository.findById(id);

		
		
		if(optionalServiceProvider.isPresent())
		{
			ServiceProvider serviceProvider = optionalServiceProvider.get();
			
			List<State> allStates = stateRepository.findAll();
	        List<City> allCities = cityRepository.findAll();
	        List<Area> allAreas = areaRepository.findAll();
			
			model.addAttribute("serviceProvider", serviceProvider);
			model.addAttribute("allStates", allStates);
	        model.addAttribute("allCities", allCities);
	        model.addAttribute("allAreas", allAreas);
			model.addAttribute("selectedStateId", serviceProvider.getStateId());
	        model.addAttribute("selectedCityId", serviceProvider.getCityId());
	        model.addAttribute("selectedAreaId", serviceProvider.getAreaId());
			return "editserviceprovider";
		}
		else {
			
			model.addAttribute("error", "Vehicle not found");
			return "listserviceproviders";
		}
		
	}
	
	
	@PostMapping("editserviceprovider")
	public String getUpdateServiceProvider(Integer id, Model model, ServiceProvider serviceProvider,MultipartFile imagePic)
	{
		Optional<ServiceProvider> optionalServiceProvider = serviceProviderRepository.findById(id);
		
		
		
		if(optionalServiceProvider.isPresent())
		{
			ServiceProvider existingServiceProvider = optionalServiceProvider.get();
			
			try {
				
				if(imagePic!=null && !imagePic.isEmpty())
				{
					Map result = cloudinary.uploader().upload(imagePic.getBytes(), ObjectUtils.emptyMap());
					
					
					existingServiceProvider.setImagePicPath(result.get("url").toString());
				}
				
				
			} catch (IOException e) {
				
				
				e.printStackTrace();
				model.addAttribute("errorMessage", "Error uploading file.");
		        return "serviceprovider";
			}
			
			existingServiceProvider.setContactNo(serviceProvider.getContactNo());
			existingServiceProvider.setExperienceYear(serviceProvider.getExperienceYear());
			existingServiceProvider.setGarageTitle(serviceProvider.getGarageTitle());
			
			existingServiceProvider.setOtherInformation(serviceProvider.getOtherInformation());
			existingServiceProvider.setSpeciality(serviceProvider.getSpeciality());
			existingServiceProvider.setZipCode(serviceProvider.getZipCode());
			existingServiceProvider.setAddress(serviceProvider.getAddress());
			
			existingServiceProvider.setStateId(serviceProvider.getStateId());
	        existingServiceProvider.setCityId(serviceProvider.getCityId());
	        existingServiceProvider.setAreaId(serviceProvider.getAreaId());
			
			
			
			serviceProviderRepository.save(existingServiceProvider);
			
			
			
			return "redirect:/listserviceproviders";
		}
		else {
			model.addAttribute("error", "ServiceProvider not updated");
			return "editserviceprovider";
		}
	}
	
	@GetMapping("deleteserviceprovider")
	public String getDeleteServiceProvider(Integer id)
	{
		serviceProviderRepository.deleteById(id);
		
		return "redirect:/listserviceproviders";
	}
	
	
}
