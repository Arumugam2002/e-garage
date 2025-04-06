package com.grownited.controller.serviceprovider;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceProviderHomeController {

	@GetMapping("serviceproviderhome")
	public String getServiceHomePage()
	{
		return "serviceproviderhome";
	}
	
	
}
