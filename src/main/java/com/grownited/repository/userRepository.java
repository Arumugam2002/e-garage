package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Users;
import java.util.List;


@Repository
public interface userRepository extends JpaRepository<Users, Integer> {

	Users findByEmail(String email);
}
