package com.Grownited.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "expense")
public class ExpenseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer expenseId;
	private String title;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private CategoryEntity category;

	@ManyToOne
	@JoinColumn(name = "subcategory_id")
	private SubCategoryEntity subCategory;

	@ManyToOne
	@JoinColumn(name = "vendor_id")
	private VendorEntity vendor;

	@ManyToOne
	@JoinColumn(name = "account_id")
	private AccountEntity account;

	@ManyToOne
	@JoinColumn(name = "status_id")
	private StatusEntity status;
	private Float amount;
	private LocalDate date;
	private String description;
	private Integer userId;
	public Integer getExpenseId() {
		return expenseId;
	}
	public void setExpenseId(Integer expenseId) {
		this.expenseId = expenseId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public CategoryEntity getCategory() {
		return category;
	}
	public void setCategory(CategoryEntity category) {
		this.category = category;
	}
	public SubCategoryEntity getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(SubCategoryEntity subCategory) {
		this.subCategory = subCategory;
	}
	public VendorEntity getVendor() {
		return vendor;
	}
	public void setVendor(VendorEntity vendor) {
		this.vendor = vendor;
	}
	public AccountEntity getAccount() {
		return account;
	}
	public void setAccount(AccountEntity account) {
		this.account = account;
	}
	public StatusEntity getStatus() {
		return status;
	}
	public void setStatus(StatusEntity status) {
		this.status = status;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public void setActive(boolean b) {
		// TODO Auto-generated method stub
		
	}

}
