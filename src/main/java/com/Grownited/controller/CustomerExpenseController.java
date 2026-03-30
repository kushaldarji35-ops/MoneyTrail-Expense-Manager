package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.CategoryEntity;
import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.StatusEntity;
import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.*;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
public class CustomerExpenseController {

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

    @Autowired
    ExpenseRepository expenseRepository;

    @GetMapping("/CustomerExpense")
    public String customerExpense(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        model.addAttribute("categoryList", categoryRepository.findAll());
        model.addAttribute("subCategoryList", subCategoryRepository.findAll());
        model.addAttribute("vendorList", vendorRepository.findAll());

        model.addAttribute("accountList",
                accountRepository.findByUserUserId(user.getUserId()));

        model.addAttribute("statusList", statusRepository.findAll());

        List<ExpenseEntity> expenses =
                expenseRepository.findByUserId(user.getUserId());

        model.addAttribute("expenseList", expenses);

        return "CustomerExpense";
    }

    @PostMapping("/savecustomerexpense")
    public String saveCustomerExpense(ExpenseEntity expenseEntity, HttpSession session, Integer categoryId,
            Integer subCategoryId,
            Integer vendorId,
            Integer accountId,
            Integer statusId) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }
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

        expenseEntity.setUserId(user.getUserId());
        expenseEntity.setActive(true);

        expenseRepository.save(expenseEntity);

        return "redirect:/CustomerExpense";
    }

    @GetMapping("/deletecustomerexpense")
    public String deleteCustomerExpense(Integer expenseId, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        expenseRepository.deleteById(expenseId);

        return "redirect:/CustomerExpense";
    }
}