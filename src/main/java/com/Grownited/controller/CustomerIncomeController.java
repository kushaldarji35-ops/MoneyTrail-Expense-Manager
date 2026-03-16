package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.IncomeEntity;
import com.Grownited.repository.AccountRepository;
import com.Grownited.repository.IncomeRepository;

@Controller
public class CustomerIncomeController {

    @Autowired
    IncomeRepository incomeRepository;

    @Autowired
    AccountRepository accountRepository;

    // Load Customer Income Page
    @GetMapping("/CustomerIncome")
    public String customerIncome(Model model) {

        model.addAttribute("incomeList", incomeRepository.findAll());
        model.addAttribute("accountList", accountRepository.findAll());

        return "CustomerIncome";
    }
    // ✅ Save Expense
    @PostMapping("savecustomerincome")
	public String saveCustomerIncome(IncomeEntity incomeEntity) {
		
		incomeRepository.save(incomeEntity);
		return "redirect:/CustomerIncome";
	}
    
    @GetMapping("/deletecustomerincome")
    public String deleteCustomerIncome(Integer incomeId) {

        incomeRepository.deleteById(incomeId);

        return "redirect:/CustomerIncome";
    }

}