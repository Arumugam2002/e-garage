package com.grownited.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.State;
import java.util.List;


@Repository
public interface stateRepository extends JpaRepository<State, Integer>{

	Optional<State> findByStateName(String stateName);
	
}
