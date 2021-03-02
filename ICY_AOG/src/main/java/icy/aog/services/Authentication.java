package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;

@Service
public class Authentication {
		public Authentication() {
		}
		
@Autowired
	private PlatformTransactionManager tran;

public ModelAndView entrance(AuthBean ab) {
	
	ModelAndView mav=null; 
	switch (ab.getSCode()) {
	case "login":
		mav = logInCtl(ab);
	
		break;
	case "KAKAOLOG":
		mav = kakaoCtl(ab);
		
		break;
	case "NAVERLOG":
		mav = naverCtl(ab);
		
		break;
	case "FACEBOOKLOG":
		mav = facebookCtl(ab);
		
		break;
	case "JOIN":
		mav = joinCtl(ab);
		
		break;
	case "AJOIN":
		mav = ajoinCtl(ab);
		
		break;
	case "find":
		mav = findCtl(ab);
		
		break;
	case "pwForm":
		mav = pwFormCtl(ab);
		
		break;
		
	}
		
	
	
	return mav;
	
}

private ModelAndView pwFormCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView findCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView ajoinCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView joinCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView facebookCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView naverCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView kakaoCtl(AuthBean ab) {
	// TODO Auto-generated method stub
	return null;
}

private ModelAndView logInCtl(AuthBean ab) {
	ModelAndView mav= new ModelAndView();
	return mav;
}


}