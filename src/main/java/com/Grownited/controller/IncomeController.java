package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.IncomeEntity;
import com.Grownited.repository.IncomeRepository;

@Controller
public class IncomeController {
	
	@Autowired
	IncomeRepository incomeRepository;
	
	@GetMapping("newIncome")
	public String Income() {
		return "NewIncome";
	}
	
	@PostMapping("saveIncome")
	public String SaveIncome(IncomeEntity incomeEntity) {
		
		incomeRepository.save(incomeEntity);
		return "redirect:/listIncome";
	}
	@GetMapping("listIncome")
	public String listCategory(Model model) {
		List<IncomeEntity> incomList = incomeRepository.findAll();
		model.addAttribute("incomeList",incomList);
		
		return "ListIncome";
	}

}
