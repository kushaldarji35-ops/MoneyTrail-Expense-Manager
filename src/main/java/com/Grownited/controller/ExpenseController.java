package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.StatusEntity;
import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.AccountRepository;
import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.ExpenseRepository;
import com.Grownited.repository.StatusRepository;
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
    
    @Autowired
    AccountRepository accountRepository;
    
    @Autowired
    StatusRepository statusRepository;

    // ✅ Open Expense Form
    @GetMapping("expense")
    public String expensePage(Model model) {
    	
    	List<CategoryEntity> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList",categoryList);
		
		List<SubCategoryEntity> subcategoryList = subCategoryRepository.findAll();
        model.addAttribute("subCategoryList", subcategoryList);
		
        List<VendorEntity> vendorList = vendorRepository.findAll();
		model.addAttribute("vendorList",vendorList);
		
		List<AccountEntity> accountList = accountRepository.findAll();
		model.addAttribute("accountList",accountList);
		
		List<StatusEntity> statusList = statusRepository.findAll();
		model.addAttribute("statusList",statusList);
		
        return "Expense";
    }

    @PostMapping("saveexpense")
    public String saveExpense(ExpenseEntity expenseEntity,
            Integer categoryId,
            Integer subCategoryId,
            Integer vendorId,
            Integer accountId,
            Integer statusId) {

        CategoryEntity category = categoryRepository.findById(categoryId).get();
        SubCategoryEntity subCategory = subCategoryRepository.findById(subCategoryId).get();
        VendorEntity vendor = vendorRepository.findById(vendorId).get();
        AccountEntity account = accountRepository.findById(accountId).get();
        StatusEntity status = statusRepository.findById(statusId).get();

        expenseEntity.setCategory(category);
        expenseEntity.setSubCategory(subCategory);
        expenseEntity.setVendor(vendor);
        expenseEntity.setAccount(account);
        expenseEntity.setStatus(status);

        expenseRepository.save(expenseEntity);

        return "redirect:/listexpense";
    }
    @GetMapping("listexpense")
    public String listExpense(Model model) {
        List<ExpenseEntity> expenseList = expenseRepository.findAll();
        model.addAttribute("expenseList",expenseList);
        return "ListExpense";
    }
    @GetMapping("deleteexpense")
	public String deleteUser(Integer expenseId) {
		expenseRepository.deleteById(expenseId);
		
		return "redirect:/listexpense";//do not open jsp , open another url -> listHackathon
	}
    
}