package manohar.munnur.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;

@Configuration
public class SwaggerConfig {
	
	@Bean
	public OpenAPI apiInfo() {
		
		return new OpenAPI()
				.info(new Info()
						.title("CRUD REST API")
						.description("API documentation for CRUD Spring Boot application")
						.version("1.0.0"));
		
	}
	
}