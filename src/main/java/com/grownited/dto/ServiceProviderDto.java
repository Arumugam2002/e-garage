package com.grownited.dto;

public class ServiceProviderDto {

	private Integer serviceProviderId;
	
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
	private String stateName;
	private String cityName;
	private String areaName;
	private String imagePicPath;
	
	/*
	 * public ServiceProviderDto(String speciality, String garageTitle, String
	 * contactNo, String stateName, String cityName, String areaName) { super();
	 * this.speciality = speciality; this.garageTitle = garageTitle; this.contactNo
	 * = contactNo; this.stateName = stateName; this.cityName = cityName;
	 * this.areaName = areaName; }
	 */
	
	//For list garages in admin
	public ServiceProviderDto(Integer serviceProviderId, String speciality, String garageTitle, String contactNo,
			String stateName, String cityName, String areaName) {
		super();
		this.serviceProviderId = serviceProviderId;
		this.speciality = speciality;
		this.garageTitle = garageTitle;
		this.contactNo = contactNo;
		this.stateName = stateName;
		this.cityName = cityName;
		this.areaName = areaName;
	}
	
	
	//For List Garages in user page
	public ServiceProviderDto(Integer serviceProviderId, String speciality, String garageTitle, Integer experienceYear, String contactNo, String imagePicPath,
		String address,	String stateName, String cityName, String areaName) {
		super();
		this.serviceProviderId = serviceProviderId;
		this.speciality = speciality;
		this.garageTitle = garageTitle;
		this.experienceYear = experienceYear;
		this.contactNo = contactNo;
		this.address = address;
		this.imagePicPath = imagePicPath;
		this.stateName = stateName;
		this.cityName = cityName;
		this.areaName = areaName;
		
	}
	
	

	//For View Garages in admin
	public ServiceProviderDto(Integer serviceProviderId, String contactNo, Integer experienceYear, String garageTitle,
            String otherInformation, String speciality, String zipCode, String address,
            String areaName, String stateName, String cityName) {
this.serviceProviderId = serviceProviderId;
this.contactNo = contactNo;
this.experienceYear = experienceYear;
this.garageTitle = garageTitle;
this.otherInformation = otherInformation;
this.speciality = speciality;
this.zipCode = zipCode;
this.address = address;
this.areaName = areaName;
this.stateName = stateName;
this.cityName = cityName;
}




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
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}




	public String getImagePicPath() {
		return imagePicPath;
	}




	public void setImagePicPath(String imagePicPath) {
		this.imagePicPath = imagePicPath;
	}
	
	
}
