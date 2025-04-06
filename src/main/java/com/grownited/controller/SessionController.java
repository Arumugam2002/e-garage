package com.grownited.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
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
	
	@Autowired
	Cloudinary cloudinary;

	@GetMapping(value = { "/", "signup" })
	public String signup() {
		return "signup";
	}

//	@GetMapping("/")
//	public String home()
//	{
//		return "index";
//	}

	@GetMapping("login")
	public String login() {
		return "login";
	}

	@GetMapping("index")
	public String homePage() {
		return "index";
	}

	@GetMapping("forgetpassword")
	public String forgetPasswordPage() {
		return "forgetpassword";
	}

	@PostMapping("saveuser")
	public String saveuser(Users users, Model model, MultipartFile profilePic)

	{
		System.out.println(profilePic.getOriginalFilename());
		
		try {
			
			Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
			
			users.setProfilePicPath(result.get("url").toString());
		} catch (IOException e) {
			
			
			e.printStackTrace();
			model.addAttribute("errorMessage", "Error uploading file.");
	        return "signup";
		}

		Optional<Users> existingUser = userRepository.findByEmail(users.getEmail());

		if (existingUser.isPresent()) {
			model.addAttribute("errorMessage", "User has been already registered!");
			return "signup";
		}

		System.out.println(users.getFirstName());
		System.out.println(users.getLastName());
		System.out.println(users.getEmail());
		System.out.println(users.getPassword());
		System.out.println(users.getContactNo());
		System.out.println(users.getGender());
		System.out.println(users.getRole());

		//users.setRole("USER");
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
//		return "index";ivi
//	}

	@PostMapping("authenticate")
	// public String loginPage(@RequestParam("email") String email,
	// @RequestParam("password") String password,
	// HttpSession session, Model model) //Session Used
	public String loginPage(String email, String password, Model model, HttpSession session) {

		System.out.println(email);
		System.out.println(password);

		// Users user = userRepository.findByEmail(email);
		Optional<Users> op = userRepository.findByEmail(email);

		if (op.isEmpty()) {
			model.addAttribute("error", "User is not registered");
			return "login";
		}

		Users dbUsers = op.get();

		boolean ans = encoder.matches(password, dbUsers.getPassword());

		if (ans == false) {
			model.addAttribute("error", "Incorrect Password");
			return "login";
		}

		session.setAttribute("user", dbUsers);

		if (dbUsers.getRole().equals("ADMIN")) {
			return "redirect:/admindashboard";
		}

		else if (dbUsers.getRole().equals("USER")) {
			return "redirect:/index";
		}
		
		else if(dbUsers.getRole().equals("SERVICE PROVIDER"))
		{
			return "redirect:/serviceproviderhome";
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
	public String getLogoutPage(HttpSession session) {
		session.invalidate();
		return "login";
	}

	@PostMapping("sendOtp")
	public String sendOtp(String email, HttpSession session, Model model) {

		String otp = serviceMail.generateOtp();
		session.setAttribute("otp", otp);
		session.setAttribute("email", email);

		Optional<Users> op = userRepository.findByEmail(email);

		if (op.isPresent()) {
			serviceMail.sendOtpMail(email, otp);

			model.addAttribute("message", "OTP has been sent to your email");
			return "changepassword";
		} else {
			model.addAttribute("error", "Email not registered");
			return "forgetpassword";
		}

		/* return "changepassword"; */
	}

	@GetMapping("verifyotp")
	public String getVerifyOtp()

	{
		return "verifyotp";
	}

	@GetMapping("resetpassword")
	public String getResetPassword() {
		return "resetpassword";
	}

	// @PostMapping("verifyotp")
	@PostMapping("changepassword")
	public String verifyOtp(String otp, String password, String confirmpassword, HttpSession session, Model model) {
		String sessionOtp = (String) session.getAttribute("otp");
		String email = (String) session.getAttribute("email");
		
		
		if(sessionOtp == null || !sessionOtp.equals(otp))
		{
			 model.addAttribute("error", "Invalid Otp please try again"); 
			 return "changepassword";
		}
		
		if(!password.equals(confirmpassword))
		{
			 model.addAttribute("error", "Passwords do not match.");
		     return "changepassword";
		}
		
		Optional<Users> op = userRepository.findByEmail(email);
		
		String encodePassword = encoder.encode(password);
		
		if(op.isPresent()) 
		{ 
			Users user = op.get(); 
			user.setPassword(encodePassword);
		
		  userRepository.save(user); 
		  session.invalidate();
		  
		  return "login";
		  
		}

		else {
			model.addAttribute("error", "Error updating password");
			return "changepassword";
		}
		/*
		 * String encodePassword = encoder.encode(password);
		 * 
		 * if(sessionOtp != null && sessionOtp.equals(otp)) { Optional<Users> op =
		 * userRepository.findByEmail(email);
		 * 
		 * if(op.isPresent()) { Users user = op.get(); user.setPassword(encodePassword);
		 * userRepository.save(user); session.invalidate();
		 * 
		 * return "login";
		 * 
		 * }else { model.addAttribute("error", "Error updating password"); return
		 * "changepassword"; }
		 * 
		 * 
		 * model.addAttribute("email", email); return "resetpassword";
		 * 
		 * } else { model.addAttribute("error", "Invalid Otp please try again"); return
		 * "changepassword"; }
		 */
	}

	@GetMapping("listusers")
	public String listUsers(Model model) {

		List<Users> userList = userRepository.findAll();

		model.addAttribute("userList", userList);

		return "listusers";
	}

	@GetMapping("viewuser")
	public String getViewUser(Integer id, Model model) {
		System.out.println("User Id:-----" + id);

		Optional<Users> op = userRepository.findById(id);

		if (op.isEmpty()) {
			// user not found
		} else {
			Users user = op.get();

			model.addAttribute("user", user);
		}

		return "viewuser";
	}
	
	@GetMapping("edituser")
	public String getEditUser(Integer id, Model model)
	{
		System.out.println("User Id:-----" + id);
		
		Optional<Users> optionalUser = userRepository.findById(id);
	    
	    if (optionalUser.isPresent()) {
	        model.addAttribute("user", optionalUser.get()); // Add user to the model
	        return "edituser";
	    } else {
	        model.addAttribute("error", "User not found");
	        return "listusers"; // Redirect to user list page if user not found
	    }
	
		
		
	}
	
	@PostMapping("edituser")
	public String editUser(Users user, Integer id, RedirectAttributes redirectAttributes, HttpSession session)
	{
		
		Optional<Users> optionalUser = userRepository.findById(id);
		
		if(optionalUser.isPresent())
		{
			Users existingUser = optionalUser.get();
			
			  existingUser.setFirstName(user.getFirstName());
			  existingUser.setLastName(user.getLastName());
			  existingUser.setEmail(user.getEmail());
			  
			  
			  existingUser.setContactNo(user.getContactNo());
			  existingUser.setGender(user.getGender());
			  existingUser.setRole(user.getRole());
			 
			 userRepository.save(existingUser); 
			 
			 session.setAttribute("user", existingUser);
			 
			 redirectAttributes.addFlashAttribute("successMessage", "User Updated Successfully");
			 
			
			 return "redirect:/listusers";
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "User not updated");
			
			return "edituser";
		}
		
	}

	@GetMapping("deleteuser")
	public String getDeleteUser(Integer id) {
		userRepository.deleteById(id);

		return "redirect:/listusers";
	}

}
