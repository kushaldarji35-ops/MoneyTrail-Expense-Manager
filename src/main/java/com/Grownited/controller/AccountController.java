package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.AccountEntity;
import com.Grownited.repository.AccountRepository;

@Controller
public class AccountController {

    @Autowired
    AccountRepository accountRepository;

    // ✅ Open Account Form
    @GetMapping("/account")
    public String accountPage() {
        return "Account";  
        // account.html OR account.jsp
    }

    // ✅ Save Account Data
    @PostMapping("/account")
    public String saveAccount(AccountEntity accountEntity) {

        accountRepository.save(accountEntity);

        // redirect prevents duplicate form submission
        return "AdminDashboard";
    }
}
