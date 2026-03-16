package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.AccountRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerAccountController {

    @Autowired
    AccountRepository accountRepository;

    // Customer Account List
    @GetMapping("/CustomerAccount")
    public String customerAccount(Model model, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        List<AccountEntity> accounts = accountRepository.findByUserUserId(user.getUserId());

        model.addAttribute("accounts", accounts);

        return "CustomerAccount";
    }

    // Save Customer Account
    @PostMapping("/savecustomeraccount")
    public String saveCustomerAccount(AccountEntity accountEntity, HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        accountEntity.setUser(user);
        accountEntity.setActive(true);

        accountRepository.save(accountEntity);

        return "redirect:/CustomerAccount";
    }

    // Delete Account
    @GetMapping("/deletecustomeraccount")
    public String deleteCustomerAccount(Integer accountId) {

        accountRepository.deleteById(accountId);

        return "redirect:/CustomerAccount";
    }
}