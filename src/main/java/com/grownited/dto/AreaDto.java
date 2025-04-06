package com.grownited.dto;

public class AreaDto {
	private Integer areaId;
	private String areaName;
	private Integer cityId;
	private String cityName;
	
	
	
	
	
	public AreaDto(Integer areaId, String areaName, Integer cityId, String cityName) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
		this.cityId = cityId;
		this.cityName = cityName;
	}
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	
	
}
