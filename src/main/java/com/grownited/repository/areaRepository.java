package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.dto.AreaDto;
import com.grownited.entity.Area;

@Repository
public interface areaRepository extends JpaRepository<Area, Integer>{

	
	@Query(value = "select a.*, c.city_name from areas a, cities c where a.city_id = c.city_id;", nativeQuery = true)
	List<AreaDto> getAll();
	
	
}
