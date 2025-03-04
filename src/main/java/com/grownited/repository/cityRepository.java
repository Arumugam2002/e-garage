package com.grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.dto.CityDto;
import com.grownited.entity.City;

@Repository
public interface cityRepository extends JpaRepository<City, Integer>{

	
	@Query(value = "select c.*, s.state_name from states s, cities c where s.state_id = c.state_id", nativeQuery = true)
	List<CityDto> getAll();
	
	
	Optional<City>  findByCityName(String cityName);
	
}
