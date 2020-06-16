package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
//@EnableAspectJAutoProxy // aop
public class DotoriProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(DotoriProjectApplication.class, args);

	}
}
