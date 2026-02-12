package com.Grownited.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("Users")
	public String newUser() {
		return "Users";
	}
	
	@PostMapping("saveUser")
	public String saveUser(UserEntity userEntity) {
      userEntity.setActive(true);
		
		userRepository.save(userEntity);
		return "AdminDashboard";
	}
	
	@GetMapping("ListUsers")
	public String users(Model model){

	    List<UserEntity> userList = userRepository.findAll();

	    model.addAttribute("users", userList);

	    return "ListUsers";
	}
	
	@GetMapping("viewUser")
	public String viewUser(@RequestParam Integer userId, Model model) {

	    if (userId == null) {
	        return "redirect:/listusers";
	    }
	    Optional<UserEntity> opUser = userRepository.findById(userId);

	    if (opUser.isEmpty()) {
	        return "";
	    }
	    UserEntity userEntity = opUser.get();
	    model.addAttribute("user", userEntity);
	   
	    return "ViewUser";
	}
	@GetMapping("deleteUser")
	public String deleteUser(Integer userId) {
		userRepository.deleteById(userId);
		
		return "redirect:/ListUsers";//do not open jsp , open another url -> listHackathon
	}


}