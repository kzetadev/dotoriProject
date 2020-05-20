package com.config;

import java.sql.Driver;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@PropertySource("classpath:com/db/config/db.properties")
//@ComponentScan(basePackages = {"com.example.demo.dao", "com.example.demo.config"},
//		excludeFilters = @ComponentScan.Filter(Controller.class))
@MapperScan(basePackages = {"*.*.mapper"})
//@ComponentScan(basePackages= {"com.config"})
public class RootConfig {
	@Value("${driver}")
	private String driver;
	@Value("${url}")
	private String url;
	@Value("${user}")
	private String user;
	@Value("${password}")
	private String password;
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
//	<context:property-placeholder location="classpath:jdbc.properties"/>
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
//	<bean id="dataSource" class="org.springframework.jdbc.datasource.SimpleDriverDataSource">
//	    <property name="driverClass" value="${jdbc.driverClassName}"/>
//	    <property name="url" value="${jdbc.url}"/>
//	    <property name="username" value="${jdbc.username}"/>
//	    <property name="password" value="${jdbc.password}"/>
//	</bean>
	@Bean
	public DataSource dataSource() {
		SimpleDriverDataSource ds = null;
		try {
			ds = new SimpleDriverDataSource();
			ds.setDriverClass((Class<? extends Driver>) Class.forName(driver));
			ds.setUrl(url);
			ds.setUsername(user);
			ds.setPassword(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return ds;
	}

//	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
//	    <property name="dataSource" ref="dataSource" />
//	    <property name="mapperLocations" value="classpath*:mapper/**/*-mapper.xml"/>
//	</bean>
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		Resource[] resources = resolver.getResources("classpath*:**/**/**/*Mapper.xml");
		sqlSessionFactory.setMapperLocations(resources);
		return sqlSessionFactory;
	}
//	<bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate" 
//      destroy-method="clearCache">
//        <constructor-arg ref="sqlSessionFactory"/>
//    </bean>
	@Bean(destroyMethod="clearCache")
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {//public SqlSessionFactoryBean sqlSessionFactory()
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
