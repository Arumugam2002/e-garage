package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.State;


@Controller
public class StateController {
	
	
	@GetMapping("state")
	public String getState()
	{
		return "NewState";
	}

	
	@PostMapping("savestate")
	public String saveState(State state)
	{
		System.out.println(state.getState());
		
		return "NewState";
	}
}
