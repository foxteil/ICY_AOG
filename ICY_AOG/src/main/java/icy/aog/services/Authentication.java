package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.AuthBean;

@Service
public class Authentication {
	ModelAndView mav = new ModelAndView();
	public Authentication() {}

	@Autowired
	private PlatformTransactionManager tran;

	public ModelAndView entrance(AuthBean ab) {

		switch (ab.getSCode()) {
		case "MAIN":
			mav = mainCtl(ab);
			
		case "LOGIN":
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
		case "FIND":
			mav = findCtl(ab);

			break;
		case "PWFORM":
			mav = pwFormCtl(ab);

			break;

		}

		return mav;

	}

	private ModelAndView pwFormCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("findform");
		return mav;
	}

	private ModelAndView findCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("find");
		return mav;
	}

	private ModelAndView ajoinCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("ajoin");
		return mav;
	}

	private ModelAndView joinCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("join");
		return mav;
	}

	private ModelAndView facebookCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("main");
		return mav;
	}

	private ModelAndView naverCtl(AuthBean ab) {
		// TODO Auto-generated method stub
		return null;
	}

	private ModelAndView kakaoCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("main");
		return mav;
	}

	private ModelAndView mainCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("main");
		return mav;
	}
	private ModelAndView logInCtl(AuthBean ab) {
		System.out.println("확인");
		mav.setViewName("start");
		return mav;
	}

}