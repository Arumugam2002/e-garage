package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "areas")
public class Area {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer areaId;
	private String areaName;
	
	@OneToOne
	@JoinColumn(name="city_ref_id")
	private City cityRefId;

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

	public City getCityRefId() {
		return cityRefId;
	}

	public void setCityRefId(City cityRefId) {
		this.cityRefId = cityRefId;
	}

	
	
	
}
