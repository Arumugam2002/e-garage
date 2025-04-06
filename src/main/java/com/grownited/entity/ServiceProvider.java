package com.grownited.entity;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "service_providers")
public class ServiceProvider {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer serviceProviderId;
	/*
	 * @ManyToMany
	 * 
	 * @JoinColumn(name="userid", referencedColumnName = "id") private Users user;
	 * 
	 * 
	 */
	
	private Integer userId;
	private String speciality;
	private String garageTitle;
	private String zipCode;
	private String contactNo;
	private Integer experienceYear;
	private String otherInformation;
	private Integer stateId;
	private Integer cityId;
	private String address;
	private Integer areaId;
	private String imagePicPath;
	
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getStateId() {
		return stateId;
	}
	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	/*
	 * public Users getUser() { return user; } public void setUser(Users user) {
	 * this.user = user; }
	 */
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
	public String getImagePicPath() {
		return imagePicPath;
	}
	public void setImagePicPath(String imagePicPath) {
		this.imagePicPath = imagePicPath;
	}
	
	
}
