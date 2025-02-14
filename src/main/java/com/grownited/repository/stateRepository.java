package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.State;

@Repository
public interface stateRepository extends JpaRepository<State, Integer>{

	
	
}
