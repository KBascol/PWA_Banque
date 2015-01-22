/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pwa.nosecure;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;



/**
 *
 * @author nicolas
 */
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class MonApplication extends SpringBootServletInitializer {
    
    
   protected SpringApplicationBuilder configure(SpringApplicationBuilder application){
       return application.sources(MonApplication.class);
   }
   
}
