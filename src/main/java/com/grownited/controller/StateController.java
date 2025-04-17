package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grownited.entity.State;
import com.grownited.entity.Users;
import com.grownited.repository.stateRepository;
import com.grownited.repository.userRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class StateController {
	
	@Autowired
	stateRepository stateRepository;
	
	@Autowired
	userRepository userRepository;
	
	
	
	
	
	
	@GetMapping("state")
	public String getState()
	{
		return "NewState";
	}

	
	@PostMapping("savestate")
	public String saveState(State state, HttpSession session, Model model)
	//public String saveState(State state)
	{
		System.out.println(state.getStateName());
		
		Optional<State> existingState = stateRepository.findByStateName(state.getStateName());
		
		if(existingState.isPresent())
		{
			model.addAttribute("errorMessage", "State already exists");
			return "NewState";
		}
		
		
		
	State dbState = stateRepository.save(state);
		Users user = (Users)session.getAttribute("user");
		
		System.out.println(user.getFirstName());
		
		user.setState(dbState);
		userRepository.save(user);
		
		return "redirect:/liststates";
	}
	
	@GetMapping("liststates")
	public String getListAllStates(Model model)
	{
		List<State> states = stateRepository.findAll();
		
		model.addAttribute("states",states);
		
		return "liststates";
	}
	
	@GetMapping("deletestates")
	public String deleteArea(Integer id, RedirectAttributes redirectAttributes)
	{
		if(userRepository.existsByState_StateId(id))
		{
			redirectAttributes.addFlashAttribute("errorMessage", "Cannot delete states; users are linked to it.");
		}
		else {
			
			try {
				stateRepository.deleteById(id);
				
				
				redirectAttributes.addFlashAttribute("successMessage","State deleted succesfully");
			}
			catch (Exception e) {
				// TODO: handle exception
				redirectAttributes.addFlashAttribute("errorMessage", "Error deleting states. Please try again later.");
			}
		}
		return "redirect:/liststates";
	}
}
