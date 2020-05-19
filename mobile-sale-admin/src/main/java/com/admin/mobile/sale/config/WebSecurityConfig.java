package com.admin.mobile.sale.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.admin.mobile.sale.service.UserDetailsServiceImpl;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Override
    public void configure(WebSecurity web) throws Exception {
    	web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/vendor/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	
        http.authorizeRequests()
                .antMatchers("/login", "/login?**")
                .permitAll()
                .anyRequest().authenticated();

        http.formLogin()
                .loginProcessingUrl("/login")
                .loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .successHandler(successHandler())
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout**", "POST"));
        http.sessionManagement().maximumSessions(-1).sessionRegistry(sessionRegistry());
		http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
    }
    
    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }
    
    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new RedirectFilter();
    }
}
