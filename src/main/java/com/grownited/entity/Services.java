	package com.grownited.entity;
	
	import jakarta.persistence.Entity;
	import jakarta.persistence.GeneratedValue;
	import jakarta.persistence.GenerationType;
	import jakarta.persistence.Id;
	import jakarta.persistence.Table;
	
	@Entity
	@Table(name = "services")
	public class Services {
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer servicesId;
		
		private String serviceName;
		private String serviceDescription;
		private Double allInclusivePrice;
		
		private Integer serviceProviderId;
		
		
		public Integer getServicesId() {
			return servicesId;
		}
		public void setServicesId(Integer servicesId) {
			this.servicesId = servicesId;
		}
		public String getServiceName() {
			return serviceName;
		}
		public void setServiceName(String serviceName) {
			this.serviceName = serviceName;
		}
		public String getServiceDescription() {
			return serviceDescription;
		}
		public void setServiceDescription(String serviceDescription) {
			this.serviceDescription = serviceDescription;
		}
		public Double getAllInclusivePrice() {
			return allInclusivePrice;
		}
		public void setAllInclusivePrice(Double allInclusivePrice) {
			this.allInclusivePrice = allInclusivePrice;
		}
		public Integer getServiceProviderId() {
			return serviceProviderId;
		}
		public void setServiceProviderId(Integer serviceProviderId) {
			this.serviceProviderId = serviceProviderId;
		}
		
		
		
		
	}
