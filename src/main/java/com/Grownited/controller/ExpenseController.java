package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.IncomeEntity;
import com.Grownited.repository.ExpenseRepository;


@Controller
public class ExpenseController {

    @Autowired
    ExpenseRepository expenseRepository;

    // ✅ Open Expense Form
    @GetMapping("expense")
    public String expensePage() {
        return "Expense";
    }

    
    // ✅ Save Expense
    @PostMapping("saveexpense")
    public String saveExpense(ExpenseEntity expenseEntity) {

        expenseEntity.setActive(true); // optional field

        expenseRepository.save(expenseEntity);

        // PRG Pattern (VERY IMPORTANT)
        return "redirect:/admin-dashboard";
    }
    
    @GetMapping("listexpense")
    public String listExpense(Model model) {
        List<ExpenseEntity> expenseList = expenseRepository.findAll();
        model.addAttribute("expenseList",expenseList);
        return "ListExpense";
    }

}