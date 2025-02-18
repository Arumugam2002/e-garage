package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.ServiceProvider;

@Repository
public interface serviceProviderRepository extends JpaRepository<ServiceProvider, Integer> {

	
	
	
}
