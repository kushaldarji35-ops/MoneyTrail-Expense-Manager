package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.StatusEntity;
import com.Grownited.repository.StatusRepository;

@Controller
public class StatusController {

    @Autowired
    StatusRepository statusRepository;

    // Open Status Page
    @GetMapping("newStatus")
    public String newStatus() {
        return "NewStatus";   // Status.jsp
    }

    // Save Status (VERY IMPORTANT → add path)
    @PostMapping("savestatus")
    public String saveStatus(StatusEntity statusEntity) {

        statusRepository.save(statusEntity);

        // redirect prevents duplicate form submission
        return "redirect:/status";
    }
}
