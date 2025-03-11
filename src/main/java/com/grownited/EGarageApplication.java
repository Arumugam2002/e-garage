package com.grownited;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@SpringBootApplication
public class EGarageApplication {

	public static void main(String[] args) {
		SpringApplication.run(EGarageApplication.class, args);
	}
	
	@Bean
	PasswordEncoder encoder()
	{
		return new BCryptPasswordEncoder(10);
	}

	@Bean
 	Cloudinary cloudinary() {
 		Map<String, String> config = ObjectUtils.asMap("cloud_name", "ds3xzwnx7", "api_key", "921421839539593",
 				"api_secret", "IwVq3sEZ02XAla4wO9ZGGYU8yY8");
 		return new Cloudinary(config);
 	}
}
