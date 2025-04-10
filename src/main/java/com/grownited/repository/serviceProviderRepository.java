package com.grownited.repository;

import java.text.AttributedString;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grownited.dto.ServiceProviderDto;
import com.grownited.entity.ServiceProvider;

@Repository
public interface serviceProviderRepository extends JpaRepository<ServiceProvider, Integer> {

	@Query(value = "select sp.service_provider_id, sp.garage_title, sp.speciality, sp.contact_no, a.area_name,s.state_name,c.city_name from service_providers sp, areas a, states s, cities c where sp.state_id = s.state_id and sp.area_id = a.area_id and sp.city_id = c.city_id;", nativeQuery = true)
	List<ServiceProviderDto> getAll();
	
	@Query(value = " select sp.service_provider_id, sp.speciality,  sp.garage_title, sp.experience_year, sp.contact_no, sp.image_pic_path, sp.address,s.state_name, c.city_name , a.area_name from service_providers sp, areas a, states s, cities c where sp.state_id = s.state_id and sp.area_id = a.area_id and sp.city_id = c.city_id;", nativeQuery = true)
	List<ServiceProviderDto> getGarages();
	
	@Query(value = "SELECT sp.service_provider_id, sp.contact_no, sp.experience_year, sp.garage_title,\r\n"
			+ "       sp.other_information, sp.speciality, sp.zip_code, sp.address,\r\n"
			+ "       a.area_name, s.state_name, c.city_name\r\n"
			+ "FROM service_providers sp\r\n"
			+ "JOIN areas a ON sp.area_id = a.area_id\r\n"
			+ "JOIN states s ON sp.state_id = s.state_id\r\n"
			+ "JOIN cities c ON sp.city_id = c.city_id\r\n"
			+ "WHERE sp.service_provider_id = :serviceProviderId;", nativeQuery = true)
	ServiceProviderDto getByServiceProviderId(Integer serviceProviderId);
	
	
	List<ServiceProvider> findByStateIdAndCityIdAndAreaId(Integer stateId, Integer cityId, Integer areaId);
	
	List<ServiceProvider> findByUserId(Integer userId);	
	
}
