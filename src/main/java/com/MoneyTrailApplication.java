package com;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;

@SpringBootApplication
public class MoneyTrailApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoneyTrailApplication.class, args);
	}
	
	@Bean
	PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

    @Bean
    Cloudinary getcloudinary() {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "djbjehc6m");
        config.put("api_key", "586198461234981");
        config.put("api_secret", "H_ySgDbRIQWCwZccXgAwJUTgnIU");
        return new Cloudinary(config);
    }
}
