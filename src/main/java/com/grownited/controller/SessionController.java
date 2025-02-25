package com.grownited.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.Users;
import com.grownited.repository.userRepository;
import com.grownited.service.MailService;

import jakarta.servlet.http.HttpSession;



//Creation of Controller
@Controller
public class SessionController {
	
	@Autowired
	userRepository userRepository;
	
	@Autowired
	MailService serviceMail;
	
	@Autowired
	PasswordEncoder encoder;
	
	
	
	@GetMapping(value={"/","signup"})
	public String signup()
	{
		return "signup";
	}
	
//	@GetMapping("/")
//	public String home()
//	{
//		return "index";
//	}
	
	@GetMapping("login")
	public String login()
	{
		return "login";
	}
	
	@GetMapping("index")
	public String homePage()
	{
		return "index";
	}
	
	@GetMapping("forgetpassword")
	public String forgetPasswordPage()
	{
		return "forgetpassword";
	}

	@PostMapping("saveuser")
	public String saveuser(Users users, Model model)
	
	{
		
		Optional<Users> existingUser = userRepository.findByEmail(users.getEmail());
		
		if(existingUser.isPresent())
		{
			model.addAttribute("errorMessage", "User has been already registered!");
			return "signup";
	}
		
		System.out.println(users.getFirstName());
		System.out.println(users.getLastName());
		System.out.println(users.getEmail());
		System.out.println(users.getPassword());
		System.out.println(users.getContactNo());
		System.out.println(users.getGender());
		
		users.setRole("USER");
		users.setActive(true);
		users.setCreateAt(new Date());
		
		String encodePassword = encoder.encode(users.getPassword());
		
		users.setPassword(encodePassword);
		
		userRepository.save(users);
		
		serviceMail.sendWelcomeMail(users.getEmail(), users.getFirstName());
		
		model.addAttribute("successMessage", "User is being successfully registered! ,Please Log in.");
		return "login";
	}
	
//	@PostMapping("login")
//	public String loginPage(Users users)
//	{
//		System.out.println(users.getEmail());
//		System.out.println(users.getPassword());
//		
//		
//		
//		
//		return "index";
//	}
	
	@PostMapping("authenticate")
	//public String loginPage(@RequestParam("email") String email, @RequestParam("password") String password,
           // HttpSession session, Model model) //Session Used
    public String loginPage(String email, String password, Model model, HttpSession session) {
		
		System.out.println(email);
		System.out.println(password);
		
		  //Users user = userRepository.findByEmail(email);
        Optional<Users> op = userRepository.findByEmail(email);
        
        if(op.isEmpty())
        {
        	model.addAttribute("error", "User is not registered");
        	return "login";
        }
        
        Users dbUsers = op.get();
        
        boolean ans = encoder.matches(password, dbUsers.getPassword());
        
        if(ans == false)
        {
        	model.addAttribute("error", "Incorrect Password");
        	return "login";
        }
        
        session.setAttribute("user", dbUsers);
                		
        		if(dbUsers.getRole().equals("ADMIN"))
        		{
        			return "redirect:/admindashboard";
        		}
        		
        		else if(dbUsers.getRole().equals("USER"))
        		{
        			return "redirect:/index";
        		}
        		
        		else {
        			model.addAttribute("error", "Please contact with Admin as your role is not defined");
        			return "login";	
				}
        	
        
//        if(user == null)
//        {
//        	model.addAttribute("errorMessage", "You are not registered");
//        	return "login";
//        }
//        
//        else if (!user.getPassword().equals(password)) {
//        	
//        	model.addAttribute("errorMessage", "Password is Incorrect");
//           
//            return "login"; // Redirect to home page after login
//        } else {
//        	 session.setAttribute("loggedInUser", user); // Store user in session
//            return "index"; // Stay on login page if authentication fails
//        }
    }
	
//	 @GetMapping("state")
//	    public String statePage(HttpSession session) {
//	        Users user = (Users) session.getAttribute("loggedInUser");
//	        if (user == null) {
//	            return "redirect:/login"; // Redirect to login if user is not logged in
//	        }
//	        return "NewState"; // Load state page if user is logged in
//	    }
	
	@GetMapping("logout")
	public String getLogoutPage(HttpSession session)
	{
		session.invalidate();
		return "login";
	}
	
	@PostMapping("sendOtp")
	public String sendOtp()
	{
		return "changepassword";
	}
	
	@PostMapping("updatePassword")
	public String updatePassword()
	{
		return "login";
	}
	
	@GetMapping("listusers")
	public String listUsers(Model model)
	{
		
		List<Users> userList = userRepository.findAll();
		
		model.addAttribute("userList", userList);
		
		return "listusers";
	}
	
	@GetMapping("viewuser")
	public String getViewUser(Integer id, Model model)
	{
		System.out.println("User Id:-----" + id);
		
		Optional<Users> op = userRepository.findById(id);
		
		if(op.isEmpty())
		{
			//user not found
		}
		else {
			Users user = op.get();
			
			model.addAttribute("user",user);
		}
		
		return "viewuser";
	}
	
	
	@GetMapping("deleteuser")
	public String getDeleteUser(Integer id)
	{
		userRepository.deleteById(id);
		
		return "redirect:/listusers";
	}
	
	

}
