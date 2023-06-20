package tw.gym.config;


import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

//相當於mvc-servlet.xml的java程式組態
@Configuration
@EnableWebMvc
@ComponentScan(basePackages =  {"tw.gym"})
public class WebAppConfig implements WebMvcConfigurer { 
	
	@Bean
	public MappingJackson2JsonView jsonView() {
		MappingJackson2JsonView jView = new MappingJackson2JsonView();
		jView.setPrettyPrint(true);
		return jView;
	}
	
	@Bean
	public ContentNegotiatingViewResolver contentViewResolver() {
		ContentNegotiatingViewResolver cnViewresolver = new ContentNegotiatingViewResolver();
		List<View> lists = new ArrayList<View>();
		lists.add(jsonView());
		cnViewresolver.setDefaultViews(lists);
		return cnViewresolver;
	}
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/gymcss/**").addResourceLocations("/WEB-INF/resources/gymcss/");
		registry.addResourceHandler("/JS/**").addResourceLocations("/WEB-INF/resources/JS/");
		registry.addResourceHandler("/Cart/**").addResourceLocations("/WEB-INF/resources/Cart/");
		registry.addResourceHandler("/IMG/**").addResourceLocations("/WEB-INF/resources/IMG/");
		
	}
	//不知道
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addRedirectViewController("/", "FirstPage");
	    registry.addViewController("/wonderful.playforfun").setViewName("form");
	}
	
	//不知道
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
		
	}
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
	    InternalResourceViewResolver irv = new InternalResourceViewResolver("/WEB-INF/gymjsp/",".jsp");
	    irv.setOrder(6);
	    return irv;
	}


	
	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasename("i18n.message");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("locale");
		registry.addInterceptor(lci).addPathPatterns("/**");
	}
	
	@Bean
	public SessionLocaleResolver  localeResolver() {
		return new SessionLocaleResolver();
	}
	
	
}
