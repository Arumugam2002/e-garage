package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.Cart;

public interface cartRepository extends JpaRepository<Cart, Integer> {

	
	List<Cart> findByUserId(Integer userId);
	
	void deleteByUserIdAndServicesId(Integer userId, Integer servicesId);
}
