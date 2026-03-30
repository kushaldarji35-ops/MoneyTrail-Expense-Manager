package com.Grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.ExpenseEntity;

@Repository
public interface ExpenseRepository extends JpaRepository<ExpenseEntity, Integer> {
	List<ExpenseEntity> findByUserId(Integer userId);
	@Query("SELECT COALESCE(SUM(e.amount),0) FROM ExpenseEntity e")
	Double getTotalExpense();
}
