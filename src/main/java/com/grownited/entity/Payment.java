package com.grownited.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "payments")
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer paymentId;
	
	@OneToOne
	@JoinColumn(name="appointment_id")
	private Appointment appointmentRefId;
	private Double amountPaid;
	private LocalDateTime paymentDate;
	private String paymentStatus;
	private String lastFourDigit;
	private String transactionId;
	
	
	
	
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getLastFourDigit() {
		return lastFourDigit;
	}
	public void setLastFourDigit(String lastFourDigit) {
		this.lastFourDigit = lastFourDigit;
	}
	public Integer getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(Integer paymentId) {
		this.paymentId = paymentId;
	}
	public Appointment getAppointmentRefId() {
		return appointmentRefId;
	}
	public void setAppointmentRefId(Appointment appointmentRefId) {
		this.appointmentRefId = appointmentRefId;
	}
	public Double getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(Double amountPaid) {
		this.amountPaid = amountPaid;
	}
	public LocalDateTime getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(LocalDateTime paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	
	
	
}
