package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Services;

@Repository
public interface serviceRepository extends JpaRepository<Services, Integer> {

	
	List<Services> findByServiceProviderId(Integer serviceProviderId);
	
	
	@Query( value = "select s.*, sp.garage_title from services s, service_providers sp where s.service_provider_id = sp.service_provider_id;", nativeQuery = true)
	List<Object[]> getAll();
	
	
	
}
