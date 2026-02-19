package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.IncomeEntity;
import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.SubCategoryRepository;
import com.Grownited.repository.VendorRepository;


@Controller
public class ExpenseController {

    @Autowired
    ExpenseRepository expenseRepository;
    
    @Autowired
    CategoryRepository categoryRepository;
    
    @Autowired
    SubCategoryRepository subCategoryRepository;
    
    @Autowired
    VendorRepository vendorRepository;

    // ✅ Open Expense Form
    @GetMapping("expense")
    public String expensePage(Model model) {
    	
    	List<CategoryEntity> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList",categoryList);
		
		List<SubCategoryEntity> subcategoryList = subCategoryRepository.findAll();
        model.addAttribute("subCategoryList", subcategoryList);
		
        List<VendorEntity> vendorList = vendorRepository.findAll();
		model.addAttribute("vendorList",vendorList);
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