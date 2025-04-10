package com.grownited.controller.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.dto.AreaDto;
import com.grownited.dto.CityDto;
import com.grownited.dto.ServiceProviderDto;
import com.grownited.entity.Area;
import com.grownited.entity.City;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.State;
import com.grownited.repository.areaRepository;
import com.grownited.repository.cityRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.stateRepository;

@Controller
public class GarageAjaxController{
	
	@Autowired
	cityRepository cityRepository;
	
	
	@Autowired
	stateRepository stateRepository;
	
	
	@Autowired
	areaRepository areaRepository;
	
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	
	@GetMapping("/getCities")
	@ResponseBody
	public List<CityDto> getCities(@RequestParam Integer stateId) {
	    
		List<City> cities = cityRepository.findByStateId(stateId);
		
		 List<CityDto> cityDtos = new ArrayList<>();
	        for (City city : cities) {
	            CityDto dto = new CityDto();
	            dto.setCityId(city.getCityId());
	            dto.setCityName(city.getCityName());
	           
	          
	            cityDtos.add(dto);
	        }
	        return cityDtos;
		
	}
	
	@GetMapping("/getAreas")
	@ResponseBody
	public List<AreaDto> getAreas(@RequestParam Integer cityId)
	{
		List<Area> areas = areaRepository.findByCityId(cityId);
		
		List<AreaDto> areaDtos = new ArrayList<>();
        for (Area area : areas) {
            AreaDto dto = new AreaDto();
            dto.setAreaId(area.getAreaId());
            dto.setAreaName(area.getAreaName());
            areaDtos.add(dto);
        }
        return areaDtos;
		
	}
	
	@GetMapping("/getAllGarages")
	@ResponseBody
	public List<ServiceProviderDto> getAllGarages() {
	    
		List<ServiceProviderDto> allServiceProvider = serviceProviderRepository.getGarages();
		
		return allServiceProvider;
	}
	
	
	@GetMapping("/filterGarages")
	@ResponseBody
	public List<ServiceProviderDto> filterGarages(@RequestParam Integer stateId, @RequestParam Integer cityId, @RequestParam Integer areaId)
	{
		List<ServiceProvider> garages = serviceProviderRepository.findByStateIdAndCityIdAndAreaId(stateId, cityId, areaId);
		
		String stateName = stateRepository.findById(stateId).map(State::getStateName).orElse("Unknown");
	    String cityName = cityRepository.findById(cityId).map(City::getCityName).orElse("Unknown");
	    String areaName = areaRepository.findById(areaId).map(Area::getAreaName).orElse("Unknown");
		
		 List<ServiceProviderDto> dtoList = new ArrayList<>();
	        for (ServiceProvider g : garages) {
	            ServiceProviderDto dto = new ServiceProviderDto();
	            dto.setServiceProviderId(g.getServiceProviderId());
	            dto.setGarageTitle(g.getGarageTitle());
	            dto.setContactNo(g.getContactNo());
	            dto.setExperienceYear(g.getExperienceYear());
	            dto.setSpeciality(g.getSpeciality());
	            dto.setImagePicPath(g.getImagePicPath());
	            dto.setAddress(g.getAddress());

	            dto.setStateName(stateName);
	            dto.setCityName(cityName);
	            dto.setAreaName(areaName);

	            dtoList.add(dto);
	        }
	        return dtoList;
	}
	
	
	
}