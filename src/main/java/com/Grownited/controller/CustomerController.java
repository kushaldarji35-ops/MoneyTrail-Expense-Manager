package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.UserRepository;

@Controller
public class CustomerController {
	
	@Autowired
	ExpenseRepository expenseRepository;
	
	@GetMapping("customer-dashboard")
	public String customerDashboard(Model model) {
		long totalExpense = expenseRepository.count();
		
		model.addAttribute("totalExpense",totalExpense);
		
		
		return "CustomerDashboard";
	}

	@GetMapping("home")
	public String home() {
		return "Home";
	}
}
