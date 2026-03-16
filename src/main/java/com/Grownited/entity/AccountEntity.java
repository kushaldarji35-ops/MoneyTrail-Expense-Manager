package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "account")
public class AccountEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer accountId;
	private String title;
	private Boolean exDefault;
	private Integer amount;
	 @ManyToOne
	    @JoinColumn(name="user_id")
	    private UserEntity user;

	
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Boolean getExDefault() {
		return exDefault;
	}
	public void setExDefault(Boolean exDefault) {
		this.exDefault = exDefault;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	public void setActive1(boolean b) {
		// TODO Auto-generated method stub
		
	}
	public void setActive(boolean b) {
		// TODO Auto-generated method stub
		
	}


}
