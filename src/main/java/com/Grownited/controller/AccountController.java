package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.AccountRepository;

import jakarta.servlet.http.HttpSession;

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
    @PostMapping("/addaccount")
    public String saveAccount(AccountEntity accountEntity,UserEntity userEntity,HttpSession session) {
    
    	UserEntity currentLogInUser = (UserEntity) session.getAttribute("user");
		accountEntity.setUserId(currentLogInUser.getUserId());
    	
        accountRepository.save(accountEntity);

        // redirect prevents duplicate form submission
        return "AdminDashboard";
    }
}
