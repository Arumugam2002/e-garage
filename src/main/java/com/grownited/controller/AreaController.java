package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Area;
import com.grownited.repository.areaRepository;

@Controller
public class AreaController {

	@Autowired
	areaRepository areaRepository;
	
	@GetMapping("area")
	public String getArea()
	{
		return "area";
	}
	
	@GetMapping("listarea")
	public String getListArea()
	{
		return "listarea";
	}
	
	@PostMapping("savearea")
	public String getSaveArea(Area area)
	{
		System.out.println(area.getAreaName());
		
		areaRepository.save(area);
		
		return "list:/areas";
	}
}