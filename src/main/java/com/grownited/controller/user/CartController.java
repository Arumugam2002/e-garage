package com.grownited.controller.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Cart;
import com.grownited.entity.ServiceProvider;
import com.grownited.entity.Services;
import com.grownited.entity.Users;
import com.grownited.repository.cartRepository;
import com.grownited.repository.serviceProviderRepository;
import com.grownited.repository.serviceRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;




@Controller
public class CartController {

	@Autowired
	serviceRepository serviceRepository;
	
	@Autowired
	cartRepository cartRepository;
	
	
	@Autowired
	serviceProviderRepository serviceProviderRepository;
	
	@GetMapping("viewcart")
	public String getViewCart(HttpSession session, Model model)
	{
		
		//Optional<ServiceProvider> serviceProviders = serviceProviderRepository.findById(id);
		
		
		
		
		
		Users user = (Users) session.getAttribute("user");
		
		Integer userId = user.getId();
		
		if(userId!=null)
		{
			List<Cart> cartItems = cartRepository.findByUserId(userId);
			model.addAttribute("cartItems",cartItems);
			
			double total = 0;
	        for (Cart item : cartItems) {
	            total += item.getPrice();
	        }
	        model.addAttribute("totalPrice", total);
	    
		}
		
		  Integer serviceProviderId = (Integer) session.getAttribute("serviceProviderId");
		    if (serviceProviderId != null) {
		        Optional<ServiceProvider> sp = serviceProviderRepository.findById(serviceProviderId);
		        sp.ifPresent(serviceProvider -> model.addAttribute("serviceProvider", serviceProvider));
		    }
		
		return "viewcart";
	}
	
	
	@PostMapping("addtocart")
	public String addToCart(Integer servicesId, HttpSession session)
	{
		Services service = serviceRepository.findById(servicesId).orElse(null);
		
		Users user = (Users) session.getAttribute("user");
		
		Integer userId = user.getId();
		
		if(service!=null && userId!=null)
		{
			
			List<Cart> existingCart = cartRepository.findByUserId(userId);
			boolean alreadyExists = false;
			
			for(Cart c: existingCart)
			{
				if(c.getServicesId().equals(servicesId))
				{
					alreadyExists = true;
					break;
				}
			}
			
			if(!alreadyExists)
				
			{
				Cart cartItem = new Cart();
				
				cartItem.setUserId(userId);
				cartItem.setServicesId(servicesId);
				cartItem.setServiceName(service.getServiceName());
				cartItem.setPrice(service.getAllInclusivePrice());
				
				
				
				cartItem.setServiceProviderId(service.getServiceProviderId());
				session.setAttribute("serviceProviderId", service.getServiceProviderId());
				cartRepository.save(cartItem);
			}
			
			
		}
		
		
		
		return "redirect:/viewcart";
		
	}
	
	@Transactional
	@PostMapping("removefromcart")
	public String getRemoveFromCart(Integer servicesId, HttpSession session)
	{
		Users user = (Users) session.getAttribute("user");
		
		
		
		if (user != null) {
	        Integer userId = user.getId();
	        cartRepository.deleteByUserIdAndServicesId(userId, servicesId);

	       
	        List<Cart> remainingCart = cartRepository.findByUserId(userId);
	        if (!remainingCart.isEmpty()) {
	            session.setAttribute("serviceProviderId", remainingCart.get(0).getServiceProviderId());
	        } else {
	            session.removeAttribute("serviceProviderId");
	        }
	    }
		
		return "redirect:/viewcart";
	}
	
}
