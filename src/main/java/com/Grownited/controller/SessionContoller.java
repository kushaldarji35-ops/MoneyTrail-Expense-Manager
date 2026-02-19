package com.Grownited.controller;

import java.time.LocalDate;
import java.util.Optional;

import com.Grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.Service.MailerService;
import com.Grownited.entity.UserEntity;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class SessionContoller {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	MailerService mailerService;
		
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
		@PostMapping("/rpass")
		public String openResetPasswordPage() {
			return "ResetPassword";
		}
		@PostMapping("/rlogin")
		public String register(String newPassword) {
		System.out.println("Updated Password: "+newPassword);
		return "Login";
		}
		
		@PostMapping("/authenticate")
		public String authenticate(String email,String password,HttpSession session) {
			
			
			Optional<UserEntity> op = userRepository.findByEmail(email);
			
			if(op.isPresent()) {
				
				UserEntity dbuser = op.get();
				session.setAttribute("user", dbuser);
				if(dbuser.getPassword().equals(password)) {
					if(dbuser.getRole().equals("CUSTOMER")) {
						return "redirect:admin-dashboard";
					}
				}
			}
			
			
			return "Login";
		}
		
		

		@PostMapping("/register")
		public String register(UserEntity userEntity) {
			System.out.println(userEntity.getFirstName());
			System.out.println(userEntity.getFirstName());
			System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());


			userEntity.setCreatedAt(LocalDate.now());
			userEntity.setRole("CUSTOMER");
			userEntity.setActive(true);

			
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