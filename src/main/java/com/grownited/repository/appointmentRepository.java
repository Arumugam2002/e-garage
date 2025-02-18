package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Appointment;

@Repository
public interface appointmentRepository extends JpaRepository<Appointment, Integer> {

}
