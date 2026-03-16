package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.ExpenseEntity;
import com.Grownited.entity.UserEntity;
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
    public String saveCustomerExpense(ExpenseEntity expenseEntity, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

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