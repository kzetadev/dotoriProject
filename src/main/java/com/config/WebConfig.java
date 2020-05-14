package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc	//<mvc:annotation-driven>
public class WebConfig extends WebMvcConfigurerAdapter{
//	<bean class=" org.springframework.web.servlet.view.InternalResourceViewResolver">
//	    <property name="prefix">
//	        <value>/WEB-INF/views/</value>
//	    </property>
//	    <property name="suffix">
//	        <value>.jsp</value>
//	    </property>
//	</bean>
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
//		registry.addResourceHandler("/css/**").addResourceLocations("/css/");
//		registry.addResourceHandler("/fonts/**").addResourceLocations("/fonts/");
//		registry.addResourceHandler("/img/**").addResourceLocations("/img/");
//		registry.addResourceHandler("/js/**").addResourceLocations("/js/");
		registry.addResourceHandler("/**").addResourceLocations("/");
	}
}
