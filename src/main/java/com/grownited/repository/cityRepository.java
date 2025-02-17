package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.City;

public interface cityRepository extends JpaRepository<City, Integer>{

}
