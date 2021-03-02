package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;
import icy.aog.services.Authentication;

@Controller
public class HomeController {

	@Autowired
	private Authentication auth;
	
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String start(Model model,AuthBean ab ) {
		String page = "start" ;
//		if(ab.getSCode().equals(null)) {
//			page = "start";
//		}else if(ab.getSCode().equals("c")){
//			page = "adminstart"; 
//		}
		return page;
	}
	@RequestMapping(value = "/LOGIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String logIn(Model model,AuthBean ab) {
		ModelAndView mav= new ModelAndView();
		ab.setSCode("login");
		mav= auth.entrance(ab);
		String page="main";
		
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/KAKAOLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLog(Model Member) {
		
		String page = "kakaolog";
		return page;
	}
	
	@RequestMapping(value = "/NAVERLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String nagerLog(Model Member) {
		
		String page = "naverlog";
		return page;
	}
	
	@RequestMapping(value = "/FACEBOOKLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String facebookLog(Model Member) {
		
		String page = "facebooklog";
		return page;
	}
	
	@RequestMapping(value = "/JOINFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinForm(Model Member,AuthBean ab) {
		
		String page ;
		if(ab.getSCode().equals("c")) {
			page = "joinform";
		}else {
			page = "adminjoinform"; 
		}
		return page;
	}
	
	@RequestMapping(value = "/JOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String findForm(Model Member) {
		
		String page = "start";
		return page;
	}
	
	@RequestMapping(value = "/AJOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String Join(Model Member) {
		
		String page = "ajoin";
		return page;
	}
	
	@RequestMapping(value = "/FIND", method = {RequestMethod.GET,RequestMethod.POST})
	public String find(Model Member) {
		
		String page = "find";
		return page;
	}
	
	@RequestMapping(value = "/PWFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwForm(Model Member) {
		
		String page = "pwform";
		return page;
	}
	//임시
	@RequestMapping(value = "/ADMIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(Model model ) {
		String page = "admin";
		return page;
	}
}
