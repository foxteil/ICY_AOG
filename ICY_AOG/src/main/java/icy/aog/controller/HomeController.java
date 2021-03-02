package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;
import icy.aog.services.Authentication;


@Controller
public class HomeController {

	@Autowired
	private Authentication auth;
	ModelAndView mav = null;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String start(@ModelAttribute AuthBean ab) {
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName(); 
	}
	@RequestMapping(value = "/LOGIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String logIn(@ModelAttribute AuthBean ab) {
		ab.setSCode("LOGIN");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/KAKAOLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLog(@ModelAttribute AuthBean ab) {
		ab.setSCode("KAKAOLOG");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/NAVERLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String naverLog(@ModelAttribute AuthBean ab) {
		ab.setSCode("NAVERLOG");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FACEBOOKLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String facebookLog(@ModelAttribute AuthBean ab) {
		ab.setSCode("FACEBOOKLOG");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	
	
	@RequestMapping(value = "/JOINFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinForm(@ModelAttribute AuthBean ab) {
		if(ab.getJCode().equals("user")) {
			mav = new ModelAndView();
			mav.setViewName("joinform");
		}else if(ab.getJCode().equals("admin")){
			mav = new ModelAndView();
			mav.setViewName("adminjoinform");
		}
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FINDFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String findForm(@ModelAttribute AuthBean ab) {
		if(ab.getFCode().equals("user")) {
			mav = new ModelAndView();
			mav.setViewName("find");
		}else if(ab.getFCode().equals("admin")){
			mav = new ModelAndView();
			mav.setViewName("find");
		}
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String join(@ModelAttribute AuthBean ab) {
		ab.setSCode("JOIN");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/AJOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String aJoin(@ModelAttribute AuthBean ab) {
		ab.setSCode("AJOIN");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FIND", method = {RequestMethod.GET,RequestMethod.POST})
	public String find(@ModelAttribute AuthBean ab) {
		ab.setSCode("FIND");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/PWFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwForm(@ModelAttribute AuthBean ab) {
		ab.setSCode("PWFORM");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
	//임시
	@RequestMapping(value = "/ADMIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(@ModelAttribute AuthBean ab) {
		ab.setSCode("ADMIN");
		mav = new ModelAndView();
		mav = auth.entrance(ab);
		return mav.getViewName();
	}
}