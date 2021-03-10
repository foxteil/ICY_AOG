package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;
import icy.aog.services.Authentication;
import icy.aog.services.Reservation;


@Controller
public class HomeController {
	@Autowired
	private Authentication auth;
	
	ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String start(AuthBean ab ) {
		
		ab.setSCode("MAIN");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	@RequestMapping(value = "/LOGIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String logIn(Model model,AuthBean ab) {
		ab.setSCode("LOGIN");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/KAKAOLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLog(AuthBean ab) {
		
		ab.setSCode("KAKAOLOG");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/NAVERLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String nagerLog(AuthBean ab) {
		
		ab.setSCode("NAVERLOG");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FACEBOOKLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String facebookLog(AuthBean ab) {
		
		ab.setSCode("FACEBOOKLOG");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOINFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinForm(AuthBean ab) {
		
		ab.setSCode("JOINFORM");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String findForm(AuthBean ab) {
		
		ab.setSCode("JOIN");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/AJOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String Join(AuthBean ab) {
		
		ab.setSCode("AJOIN");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FIND", method = {RequestMethod.GET,RequestMethod.POST})
	public String find(AuthBean ab) {
		
		ab.setSCode("FIND");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/PWFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwForm(AuthBean ab) {
		
		ab.setSCode("PWFORM");
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	//임시
	@RequestMapping(value = "/ADMIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(AuthBean ab) {
		String page = "admin";
		return page;
	}
}
