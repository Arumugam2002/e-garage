package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.State;
import com.grownited.repository.stateRepository;


@Controller
public class StateController {
	
	@Autowired
	stateRepository stateRepository;
	
	@GetMapping("state")
	public String getState()
	{
		return "NewState";
	}

	
	@PostMapping("savestate")
	public String saveState(State state)
	{
		System.out.println(state.getStateName());
		stateRepository.save(state);
		
		return "login";
	}
}
