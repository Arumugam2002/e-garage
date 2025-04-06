package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "cart")
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartId;
	
	
	private Integer userId;
	private Integer servicesId;
	private String serviceName;
	private Integer price;
	private Integer serviceProviderId;
	
	public Cart()
	{
		
	}
	
	
	
	public Cart(Integer cartId, Integer userId, Integer servicesId, String serviceName, Integer price,
			Integer serviceProviderId) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.servicesId = servicesId;
		this.serviceName = serviceName;
		this.price = price;
		this.serviceProviderId = serviceProviderId;
	}



	public Integer getServicesId() {
		return servicesId;
	}
	public void setServicesId(Integer servicesId) {
		this.servicesId = servicesId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}


	public Integer getCartId() {
		return cartId;
	}


	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public Integer getServiceProviderId() {
		return serviceProviderId;
	}


	public void setServiceProviderId(Integer serviceProviderId) {
		this.serviceProviderId = serviceProviderId;
	}	
	
	
	
}
