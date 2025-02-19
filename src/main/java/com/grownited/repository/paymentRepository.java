package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.Payment;

@Repository
public interface paymentRepository extends JpaRepository<Payment, Integer> {

}
