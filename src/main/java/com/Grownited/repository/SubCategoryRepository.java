package com.Grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.Grownited.entity.SubCategoryEntity;

public interface SubCategoryRepository 
        extends JpaRepository<SubCategoryEntity, Integer> {

}
