package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.SubCategoryEntity;
import com.Grownited.repository.SubCategoryRepository;

@Controller
public class SubCategoryController {

    @Autowired
    SubCategoryRepository subCategoryRepository;

    // Open Form
    @GetMapping("/newSubCategory")
    public String newSubCategory() {
        return "NewSubCategory";
    }

    // Save
    @PostMapping("/saveSubCategory")
    public String saveSubCategory(SubCategoryEntity subCategory) {

        subCategoryRepository.save(subCategory);

        return "redirect:/listSubCategory";
    }

    // List Page
    @GetMapping("/listSubCategory")
    public String listSubCategory(Model model) {
		List<SubCategoryEntity> subcategoryList = subCategoryRepository.findAll();
        model.addAttribute("subCategoryList", subcategoryList);

        return "ListSubCategory";
    }
}
