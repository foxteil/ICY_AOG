package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;
import icy.aog.mapper.MemberIF;

@Service
public class Authentication {
	ModelAndView page = new ModelAndView();
	
	@Autowired
	private MemberIF mIF;
	
	public Authentication() {}
		
//	@Autowired
//	private PlatformTransactionManager tran;

	public ModelAndView entrance(AuthBean ab) {
		System.out.println("entrance 진입");
		
		switch (ab.getSCode()) {
		case "START":
			page = startCtl(ab);
			break;
		case "LOGIN":
		System.out.println("LOGIN 스위치분기");
			page = logInCtl(ab);
			break;
		case "KAKAOLOG":
			page = kakaoCtl(ab);
			break;
		case "NAVERLOG":
			page = naverCtl(ab);
			break;
		case "FACEBOOKLOG":
			page = facebookCtl(ab);
			break;
		case "JOIN":
			page = joinCtl(ab);
			break;
		case "AJOIN":
			page = ajoinCtl(ab);
			break;
		case "FIND":
			page = findCtl(ab);
			break;
		case "PWFORM":
			page = pwFormCtl(ab);
			break;
		}
		return page;
		
	}
	
	private ModelAndView startCtl(AuthBean ab) {
		page.setViewName("start");
		return page;
}

	private ModelAndView pwFormCtl(AuthBean ab) {
		page.setViewName("pwform");
		return page;
	}
	
	private ModelAndView findCtl(AuthBean ab) {
		//fCode로 분기 findId & findPw !!
		page.setViewName("find");
		return page;
	}
	
	private ModelAndView ajoinCtl(AuthBean ab) {
		page.setViewName("adminjoinform");
		return page;
	}
	
	private ModelAndView joinCtl(AuthBean ab) {
		page.setViewName("joinform");
		return page;
	}
	
	private ModelAndView facebookCtl(AuthBean ab) {
		page.setViewName("facebooklog");
		return page;
	}
	
	private ModelAndView naverCtl(AuthBean ab) {
		page.setViewName("naverlog");
		return page;
	}
	
	private ModelAndView kakaoCtl(AuthBean ab) {
		page.setViewName("kakaolog");
		return page;
	}
	
	private ModelAndView logInCtl(AuthBean ab) {
		/*
		if(ab.getLogCode().equals("user")) {
			if(mIF.isUser(ab)==1) {
				System.out.println("유저 로그인 통과");
			}else if(mIF.isAdmin(ab)==1){
				System.out.println("관라자 로그인 통과");
				
			}
		}
		 */		
		page.addObject("Info", "메인");
		page.setViewName("main");
		return page;
	}


}