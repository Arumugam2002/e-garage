package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "appointment_service")
public class AppointmentService {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer appointmentServiceId;
	private Integer appointmentId;
	
	private Integer servicesId;

    private Double price;
    
    
    

	public AppointmentService() {
		
	}

	public AppointmentService(Integer appointmentServiceId, Integer appointmentId, Integer servicesId, Double price) {
		super();
		this.appointmentServiceId = appointmentServiceId;
		this.appointmentId = appointmentId;
		this.servicesId = servicesId;
		this.price = price;
	}

	public Integer getAppointmentServiceId() {
		return appointmentServiceId;
	}

	public void setAppointmentServiceId(Integer appointmentServiceId) {
		this.appointmentServiceId = appointmentServiceId;
	}

	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}

	public Integer getServicesId() {
		return servicesId;
	}

	public void setServicesId(Integer servicesId) {
		this.servicesId = servicesId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
    
    
}
