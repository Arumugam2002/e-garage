package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Appointment;

@Repository
public interface appointmentRepository extends JpaRepository<Appointment, Integer> {

	@Query(value = "SELECT a.*, s.service_name, se.garage_title\r\n"
			+ "FROM appointments a \r\n"
			+ "JOIN services s ON a.services_id = s.services_id \r\n"
			+ "JOIN service_providers se ON a.service_provider_id = se.service_provider_id;\r\n", nativeQuery = true)
	List<Object[]> getAll(); 
	
	@Query(value = "SELECT a.*, s.service_name, se.garage_title\r\n"
			+ "FROM appointments a \r\n"
			+ "JOIN services s ON a.services_id = s.services_id \r\n"
			+ "JOIN service_providers se ON a.service_provider_id = se.service_provider_id \r\n"
			+ "where a.appointment_id = :appointmentId;\r\n", nativeQuery = true)
	List<Object[]> getByAppointmentId(Integer appointmentId); 
	
	
	List<Appointment> findByStatus(String status);
	
}
