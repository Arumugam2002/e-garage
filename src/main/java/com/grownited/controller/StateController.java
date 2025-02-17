package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.repository.stateRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class StateController {
	
	@Autowired
	stateRepository stateRepository;
	
//	@Autowired
//	userRepository userRepository;
	
	
	
	
	
	
	@GetMapping("state")
	public String getState()
	{
		return "NewState";
	}

	
	@PostMapping("savestate")
	//public String saveState(State state, HttpSession session)
	public String saveState(State state)
	{
		System.out.println(state.getStateName());
		stateRepository.save(state);
	//State dbState = stateRepository.save(state);
		//Users user = (Users)session.getAttribute("loggedInUser");
		
		//System.out.println(user.getFirstName());
		
		//user.setState(dbState);
		//userRepository.save(user);
		
		return "index";
	}
}
