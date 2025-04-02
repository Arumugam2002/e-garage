package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Users;
import java.util.List;
import java.util.Optional;


@Repository
public interface userRepository extends JpaRepository<Users, Integer> {

	Optional<Users> findByEmail(String email);
	
	List<Users> findByRole(String role);
	
	@Query(value = "select count(*) from users where month(create_at) = :month and role='USER';",nativeQuery = true)
	Integer countThisUserMonth(Integer month);
}
