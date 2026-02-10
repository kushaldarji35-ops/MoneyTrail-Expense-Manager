package com.Grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
	@GetMapping(value = {"admin-dashboard","/"})
	public String adminDashboard() {
		return "AdminDashboard";
	}
public class Account {
	 @PostMapping(value = {"admin-dashboard","/"})
	    public String saveAccount() {
	        return "AdminDashboard";
	    }
	}
}
