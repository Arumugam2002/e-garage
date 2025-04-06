package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.AppointmentService;

public interface appointmentServiceRepository extends JpaRepository<AppointmentService, Integer> {

}
