package com.Grownited.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.Grownited.Service.MailerService;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserRepository;
import com.cloudinary.Cloudinary;

import jakarta.servlet.http.HttpSession;



@Controller
public class SessionContoller {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	MailerService mailerService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	Cloudinary cloudinary;

		
		@GetMapping("/signup")
		public String openSignupPage() {
			return "Signup"; //jsp name
		}
		@GetMapping("/login")
		public String openLoginPage() {
			return "Login";
		}
		@GetMapping("/forgetPassword")
		public String openForgetPasswordPage() {
			return "ForgetPassword";
		}
		@PostMapping("/resetPassword") // Triggered from forgetPassword.jsp
		public String resetPassword(String email, Model model) {
		    Optional<UserEntity> userOpt = userRepository.findByEmail(email);

		    if (userOpt.isPresent()) {
		        UserEntity user = userOpt.get();
		       
		        // 1. Generate a 6-digit OTP
		        String otp = String.valueOf((int)((Math.random() * 9000) + 1000));
		        
		        // 2. Save OTP to Database
		        user.setOtp(otp);
		        model.addAttribute("email", user.getEmail());
		        userRepository.save(user);
		        
		        // 3. Send OTP via Email
		        mailerService.sendOtpMail(user);
		        model.addAttribute("email", user.getEmail());
		        model.addAttribute("success", "OTP sent to your email!");
		        return "ResetPassword"; // Redirects to your verification page
		    } else {
		        model.addAttribute("error", "Email not found!");
		        return "ForgetPassword";
		    }
		}
		@PostMapping("/update-password") // Triggered from resetpassword.jsp
		public String updatePassword( String email,  String otp,  String newPassword, String confirmPassword, Model model) { 
		                                                  
		    Optional<UserEntity> userOpt = userRepository.findByEmail(email);

		    if (userOpt.isPresent()) {
		        UserEntity user = userOpt.get();
		        
		        // 1. Check if OTP matches the database
		        if (user.getOtp() != null && user.getOtp().equals(otp)) {
		            
		            // 2. Check if passwords match
		            if (newPassword.equals(confirmPassword)) {
		            	String encodedPassword = passwordEncoder.encode(newPassword);
		    			System.out.println(encodedPassword);
		    			user.setPassword(encodedPassword);

		            	//user.setPassword(newPassword.toString());
		                user.setOtp(null); // Clear OTP after use
		                userRepository.save(user);
		                
		                model.addAttribute("success", "Password updated! Please login.");
		                return "Login";
		            } else {
		                model.addAttribute("error", "Passwords do not match!");
		            }
		        } else {
		        	// ❗ WRONG OTP → CLEAR OTP ALSO
		            user.setOtp(null);
		            userRepository.save(user);
		            model.addAttribute("error", "Invalid OTP!");
		        }
		    } else {
		        model.addAttribute("error", "User not found!");
		    }
		    return "ResetPassword";
		}
	/*	@PostMapping("/rlogin")
		public String register(String newPassword) {
		System.out.println("Updated Password: "+newPassword);
		return "Login";
		}
		*/
		@PostMapping("/authenticate")
		public String authenticate(String email,String password,HttpSession session) {
			
			
			Optional<UserEntity> op = userRepository.findByEmail(email);
			
			if(op.isPresent()) {
				
				UserEntity dbuser = op.get();
				session.setAttribute("user", dbuser);
				if (passwordEncoder.matches(password, dbuser.getPassword())) {
				
				//if(dbuser.getPassword().equals(password)) {
					if(dbuser.getRole().equals("ADMIN")) {
						return "redirect:admin-dashboard";
					} else if (dbuser.getRole().equals("CUSTOMER")) {
						return "redirect:/admin-dashboard";// url '
				}
			}
				
		}
			
			
			return "Login";
		}
		
		

		@PostMapping("/register")
		public String register(UserEntity userEntity, MultipartFile profilePic) {
			System.out.println(userEntity.getFirstName());
			System.out.println(userEntity.getFirstName());
			System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());


			userEntity.setCreatedAt(LocalDate.now());
			userEntity.setRole("CUSTOMER");
			userEntity.setActive(true);
			
			// encode password
			String encodedPassword = passwordEncoder.encode(userEntity.getPassword());
			System.out.println(encodedPassword);
			userEntity.setPassword(encodedPassword);

			//file uploading
			System.out.print(profilePic.getOriginalFilename());
			
			try {
				Map  map = 	cloudinary.uploader().upload(profilePic.getBytes(), null);
				String profilePicURL = map.get("secure_url").toString();
				System.out.println(profilePicURL);
				userEntity.setProfilePicURL(profilePicURL);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			// users insert -> UserRepository
			// new -> X
			userRepository.save(userEntity);
			mailerService.sendWelcomeMail(userEntity);
			 
			return "Login";
		}
		
		@GetMapping("logout")
		public String logout(HttpSession session) {
			session.invalidate(); 
			return "Login";
		}
}