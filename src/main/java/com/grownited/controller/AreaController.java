package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grownited.dto.AreaDto;
import com.grownited.entity.Area;
import com.grownited.entity.City;
import com.grownited.repository.areaRepository;
import com.grownited.repository.cityRepository;
import com.grownited.repository.userRepository;

@Controller
public class AreaController {

	@Autowired
	areaRepository areaRepository;
	
	@Autowired
	cityRepository cityRepository;
	
	@Autowired
	userRepository userRepository;
	
	@GetMapping("area")
	public String getArea(Model model)
	{
		List<City> allCities = cityRepository.findAll();
		
		model.addAttribute("allCities",allCities);
		
		return "area";
	}
	
	@GetMapping("listarea")
	public String getListArea(Model model)
	{
		
		List<AreaDto> allAreas = areaRepository.getAll();
		
		model.addAttribute("allAreas", allAreas);
		
		return "listarea";
	}
	
	@PostMapping("savearea")
	public String getSaveArea(Area area)
	{
		System.out.println(area.getAreaName());
		
		areaRepository.save(area);
		
		return "redirect:/listarea";
	}
	
	
	@GetMapping("deletearea")
	public String deleteArea(Integer id, RedirectAttributes redirectAttributes)
	{
		if(userRepository.existsByArea_AreaId(id))
		{
			redirectAttributes.addFlashAttribute("errorMessage", "Cannot delete area; users are linked to it.");
		}
		else {
			try {
				areaRepository.deleteById(id);
				redirectAttributes.addFlashAttribute("successMessage", "Area deleted successfully");
			}
			catch (Exception e) {
				// TODO: handle exception
				redirectAttributes.addFlashAttribute("errorMessage", "Error deleting area. Please try again later.");
			}
		}
		
		
		
		return "redirect:/listarea";
	}
}