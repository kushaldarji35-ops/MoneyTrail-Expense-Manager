package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String saveAccount(AccountEntity accountEntity, HttpSession session) {

        UserEntity currentLogInUser = (UserEntity) session.getAttribute("user");

        // ✅ STEP 1 — verify session user
        if(currentLogInUser == null){
            System.out.println("SESSION USER NULL → LOGIN REQUIRED");
            return "redirect:/login";
        }

        // ✅ STEP 2 — set FK
        accountEntity.setUser(currentLogInUser);

        // ✅ STEP 3 — save
        accountRepository.save(accountEntity);

        return "redirect:/ListAccount";
    }
    @GetMapping("ListAccount")
    public String listAccount(Model model){
        List<AccountEntity> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);
        return "ListAccount";
    }
    @GetMapping("deleteaccount")
	public String deleteaccount(Integer accountId) {
		accountRepository.deleteById(accountId);
		
		return "redirect:/ListAccount";//do not open jsp , open another url -> listHackathon
	}
}
