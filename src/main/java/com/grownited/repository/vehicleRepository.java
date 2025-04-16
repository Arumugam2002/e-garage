package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Vehicles;

@Repository
public interface vehicleRepository extends JpaRepository<Vehicles, Integer>{

	
	List<Vehicles> findByUserId(Integer userId);
	
	
	@Query(value = "select v.*, u.first_name, u.last_name from vehicles v join users u on v.user_id = u.id", nativeQuery = true)
	List<Object[]> getAllVehicles();
}
