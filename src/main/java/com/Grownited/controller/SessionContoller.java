package com.Grownited.controller;

import java.nio.file.attribute.UserDefinedFileAttributeView;
import com.Grownited.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.UserEntity;

@Controller
public class SessionContoller {
	
	@Autowired
	UserRepository userRepository;
		
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
		@PostMapping("/register")
		public String register(UserEntity userEntity) {
			System.out.println(userEntity.getFirstName());
			System.out.println(userEntity.getFirstName());
			System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());


			
			userEntity.setRole("PARTICIPANT");
			userEntity.setActive(true);

			
			// users insert -> UserRepository
			// new -> X
			userRepository.save(userEntity);
			
			 
			return "Login";
		}
}