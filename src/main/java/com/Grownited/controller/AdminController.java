package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.UserRepository;

@Controller
public class AdminController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	ExpenseRepository expenseRepository;

	@GetMapping(value = {"admin-dashboard","/"})
	public String adminDashboard(Model model) {
		long totalUser = userRepository.count();
		long totalCategory = categoryRepository.count();
		Double totalExpense = expenseRepository.getTotalExpense();
	  		
		model.addAttribute("totalUser",totalUser);
		model.addAttribute("totalCategory",totalCategory);
		model.addAttribute("totalExpense", totalExpense);

	
		return "AdminDashboard";
	}
public class Account {
	 @PostMapping(value = {"admin-dashboard","/"})
	    public String saveAccount() {
	        return "AdminDashboard";
	    }
	}
}
