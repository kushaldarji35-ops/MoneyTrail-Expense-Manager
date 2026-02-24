package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.VendorEntity;
import com.Grownited.repository.VendorRepository;

@Controller
public class VendorController {
	
	@Autowired
    VendorRepository vendorRepository;

    // Open Status Page
    @GetMapping("newVendor")
    public String newVendor() {
        return "NewVendor";   // Status.jsp
    }

    // Save Status (VERY IMPORTANT → add path)
    @PostMapping("savevendor")
    public String saveStatus(VendorEntity vendorEntity) {

        vendorRepository.save(vendorEntity);

        // redirect prevents duplicate form submission
        return "redirect:/listVendor";
    }
    @GetMapping("listVendor")
    public String listVendor(Model model){
        List<VendorEntity> vendors = vendorRepository.findAll();
        model.addAttribute("vendors", vendors);
        return "ListVendor";
    }
    @GetMapping("deleteVendor")
   	public String deleteVendor(Integer vendorId) {
   		vendorRepository.deleteById(vendorId);
   		
   		return "redirect:/listVendor";//do not open jsp , open another url -> listHackathon
   	}
}
