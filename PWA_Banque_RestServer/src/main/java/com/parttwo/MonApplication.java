
package com.parttwo;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Application starting class.
 */
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class MonApplication extends SpringBootServletInitializer {
    
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MonApplication.class);
    }
}
