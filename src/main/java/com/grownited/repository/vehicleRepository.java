package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Vehicles;

@Repository
public interface vehicleRepository extends JpaRepository<Vehicles, Integer>{

}
