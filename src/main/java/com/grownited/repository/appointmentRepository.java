package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.grownited.entity.Appointment;




@Repository
public interface appointmentRepository extends JpaRepository<Appointment, Integer> {
/*
	@Query(value = "SELECT a.*, s.service_name, se.garage_title\r\n"
			+ "FROM appointments a \r\n"
			+ "JOIN services s ON a.services_id = s.services_id \r\n"
			+ "JOIN service_providers se ON a.service_provider_id = se.service_provider_id;\r\n", nativeQuery = true)
	List<Object[]> getAll(); 
	
	
	*/
	
	
	@Query(value = "SELECT " +
            "a.appointment_id AS appointmentId, " +
            "a.appointment_date_time AS appointmentDateTime, " +
            "a.status AS status, " +
            "a.reason AS reason, " +
            "a.price AS price, " +
            "sp.garage_title AS garageTitle, " +
            "GROUP_CONCAT(s.service_name SEPARATOR ', ') AS services, " +
            "v.manufacturer, " + 
            "v.model, " +
            "u.first_name, " +
            "u.last_name " +
            "FROM appointments a " +
            "JOIN service_providers sp ON a.service_provider_id = sp.service_provider_id " +
            "JOIN appointment_service aps ON a.appointment_id = aps.appointment_id " +
            "JOIN services s ON aps.services_id = s.services_id " +
            "JOIN vehicles v ON a.vehicles_id = v.vehicles_id " + 
            "JOIN users u ON a.user_id = u.id " + 
            "GROUP BY a.appointment_id " +
            "ORDER BY a.appointment_id",
           nativeQuery = true)
	List<Object[]> getAll();
	
	
	@Query(value = "SELECT " +
            "a.appointment_id AS appointmentId, " +
            "a.appointment_date_time AS appointmentDateTime, " +
            "a.status AS status, " +
            "a.reason AS reason, " +
            "a.price AS price, " +
            "sp.garage_title AS garageTitle, " +
            "GROUP_CONCAT(s.service_name SEPARATOR ', ') AS services, " +
            "v.manufacturer, " + 
            "v.model, " + 
            "v.license_plate, " + 
            "a.user_id " +
            "FROM appointments a " +
            "JOIN service_providers sp ON a.service_provider_id = sp.service_provider_id " +
            "JOIN appointment_service aps ON a.appointment_id = aps.appointment_id " +
            "JOIN services s ON aps.services_id = s.services_id " +
            "JOIN vehicles v ON a.vehicles_id = v.vehicles_id " + 
            "Where a.user_id = :userId " + 
            "GROUP BY a.appointment_id " +
            "ORDER BY a.appointment_id",
           nativeQuery = true)
	List<Object[]> getAppointmentByUserId(Integer userId);
	
	@Query(value = "SELECT a.*, GROUP_CONCAT(s.service_name SEPARATOR ', ') AS services, se.garage_title, v.manufacturer, v.model " +
            "FROM appointments a " +
            "JOIN appointment_service aps ON a.appointment_id = aps.appointment_id " +
            "JOIN services s ON aps.services_id = s.services_id " +
            "JOIN service_providers se ON a.service_provider_id = se.service_provider_id " +
            "JOIN vehicles v ON a.vehicles_id = v.vehicles_id " +
            "WHERE a.appointment_id = :appointmentId " +
            "GROUP BY a.appointment_id", nativeQuery = true)
List<Object[]> getByAppointmentId(@Param("appointmentId") Integer appointmentId);
	
	
	List<Appointment> findByStatus(String status);
	
	@Modifying
	@Transactional
	@Query("UPDATE Appointment a SET a.status = :status WHERE a.appointmentId = :appointmentId AND a.userId = :userId")
	int cancelAppointment(@Param("status") String status, @Param("appointmentId") Integer appointmentId, @Param("userId") Integer userId);
	
	
	@Query(value="select count(*) from appointments where month(appointment_date_time) = :month", nativeQuery = true)
	Integer countThisMonthAppointment(Integer month);
	
	
	
}
