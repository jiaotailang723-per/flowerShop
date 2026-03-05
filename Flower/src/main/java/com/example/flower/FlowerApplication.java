package com.example.flower;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@ServletComponentScan("com.example.flower")
public class FlowerApplication extends SpringBootServletInitializer {
    private static final Logger logger = LoggerFactory.getLogger(FlowerApplication.class);

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(FlowerApplication.class);
    }

    public static void main(String[] args) {
        logger.info("FlowerApplication: Starting application");
        SpringApplication.run(FlowerApplication.class, args);
        logger.info("FlowerApplication: Application started");
    }
}