package icy.aog.controller;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;
import icy.aog.services.Authentication;


@Controller
public class HomeController {

	@Autowired
	private Authentication auth;
	ModelAndView mav = null;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String logInForm(@ModelAttribute AuthBean ab, Model model) {
		return "main";
	}
	@RequestMapping(value = "/LOGIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String logIn(@ModelAttribute AuthBean ab, Model model) {
		mav = new ModelAndView();
		ab.setSCode("LOGIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/KAKAOLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLog(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("KAKAOLOG");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/NAVERLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String naverLog(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("NAVERLOG");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FACEBOOKLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String facebookLog(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("FACEBOOKLOG");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	
	@RequestMapping(value = "/FINDFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String findForm(@ModelAttribute AuthBean ab, Model model) {
		if(ab.getFCode().equals("user")) {
			mav.setViewName("find");
		}else if(ab.getFCode().equals("admin")){
			mav.setViewName("find");
		}
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOINFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinform(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("JOINFORM");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String join(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("JOIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/AJOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String aJoin(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("AJOIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/FIND", method = {RequestMethod.GET,RequestMethod.POST})
	public String find(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("FIND");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/PWFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwForm(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("PWFORM");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	//임시
	@RequestMapping(value = "/ADMIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("ADMIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	@RequestMapping(value = "/TEST", method = {RequestMethod.GET,RequestMethod.POST})
	public String test(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("TEST");
		mav = auth.entrance(ab, model);
		
		System.out.println(mav.getViewName());
		System.out.println(ab.getMId());
		System.out.println(mav.getModel().get("test1"));
		System.out.println(mav.getModel().get("test2"));
		
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/TEST2", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String test2(@ModelAttribute AuthBean ab, Model model) {
		//ab.setSCode("TEST");
		mav = auth.entrance(ab, model);
		
		System.out.println(mav.getViewName());
		
		
		return mav.getViewName();
	}
}