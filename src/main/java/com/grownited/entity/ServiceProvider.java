package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "service_providers")
public class ServiceProvider {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer serviceProviderId;
	private String speciality;
	private String garageTitle;
	private String zipCode;
	private String contactNo;
	private Integer experienceYear;
	private String otherInformation;
	
	
	public Integer getServiceProviderId() {
		return serviceProviderId;
	}
	public void setServiceProviderId(Integer serviceProviderId) {
		this.serviceProviderId = serviceProviderId;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getGarageTitle() {
		return garageTitle;
	}
	public void setGarageTitle(String garageTitle) {
		this.garageTitle = garageTitle;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public Integer getExperienceYear() {
		return experienceYear;
	}
	public void setExperienceYear(Integer experienceYear) {
		this.experienceYear = experienceYear;
	}
	public String getOtherInformation() {
		return otherInformation;
	}
	public void setOtherInformation(String otherInformation) {
		this.otherInformation = otherInformation;
	}
	
	
}
