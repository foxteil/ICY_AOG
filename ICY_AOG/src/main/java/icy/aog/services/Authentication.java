package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;


import icy.aog.beans.AuthBean;
import icy.aog.mapper.MemberIF;

@Service
public class Authentication {
	@Autowired
	private MemberIF mmIF;
	@Autowired
	private PlatformTransactionManager tran;
//	@Autowired
//	private Gson gson;

	ModelAndView mav = new ModelAndView();
	public Authentication() {}

	public ModelAndView entrance(AuthBean ab, Model model) {
		System.out.println("entrance 진입");
		
		switch (ab.getSCode()) {
		case "LOGIN":
			mav = logInCtl(ab, model);
			break;
		case "KAKAOLOG":
			mav = kakaoCtl(ab, model);
			break;
		case "NAVERLOG":
			mav = naverCtl(ab, model);
			break;
		case "FACEBOOKLOG":
			mav = facebookCtl(ab, model);
			break;
		case "JOINFORM":
			mav = joinformCtl(ab, model);
			break;	
		case "JOIN":
			mav = joinCtl(ab, model);
			break;
		case "AJOIN":
			mav = ajoinCtl(ab, model);
			break;
		case "FIND":
			mav = findCtl(ab, model);
			break;
		case "PWFORM":
			mav = pwFormCtl(ab, model);
			break;
		case "ADMIN":
			mav = adiminCtl(ab, model);
			break;	
		}
		return mav;
		
	}


	private ModelAndView adiminCtl(AuthBean ab, Model model) {
		mav.setViewName("admin2");
		return mav;
	}

	/*
	private ModelAndView testCtl2(AuthBean ab) {
		System.out.println("testCtl2 진입");
		String jsonData = gson.toJson(mmIF.getMb(ab));
		System.out.println(jsonData);
		mav.addObject("test2", jsonData);
		
		mav.setViewName("test2jsp");
	return mav;
}
*/
//	private ModelAndView testCtl(AuthBean ab) {
//		ab.setMId("test 아이디아이디");
//		mav.setViewName("testjsp");	
//		mav.addObject("test1", "테스트1");
//		mav.addObject("test2", ab.getMId());
//		
//	return mav;
//}



	private ModelAndView pwFormCtl(AuthBean ab, Model model) {
		mav.setViewName("pwform");
		return mav;
	}
	
	private ModelAndView findCtl(AuthBean ab, Model model) {
		//fCode로 분기 findId & findPw !!
		mav.setViewName("find");
		return mav;
	}
	
	private ModelAndView joinformCtl(AuthBean ab, Model model) {
		if(ab.getJCode().equals("U")) {
			mav.setViewName("joinform");
		}else if(ab.getJCode().equals("A")) {
			mav.setViewName("adminjoinform");
		}
		return mav;
	}
	
	private ModelAndView ajoinCtl(AuthBean ab, Model model) {
		System.out.println("ajoinCtl진입");
		System.out.println(ab.getJCode());
		System.out.println(ab.getAHpCode());
		System.out.println(ab.getAId());
		System.out.println(ab.getAPw());
		System.out.println(ab.getARank());
		System.out.println(ab.getAPhone());
		System.out.println(ab.getAName());
		
		mmIF.insStaff(ab);
		
		model.addAttribute("msg", "병원관리자  회원가입이 완료되었습니다.");
		mav.setViewName("admin2");
		return mav;
	}
	
	private ModelAndView joinCtl(AuthBean ab, Model model) {
		System.out.println("joinCtl진입");
		System.out.println(ab.getJCode());
		System.out.println(ab.getMId());
		System.out.println(ab.getMPw());
		System.out.println(ab.getMName());
		System.out.println(ab.getMJumin());
		System.out.println(ab.getMPhone());
		System.out.println(ab.getMAddr());
		
		mmIF.insMember(ab);
		mmIF.insFamily(ab);
		
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		mav.setViewName("main");
		return mav;
	}
	
	private ModelAndView facebookCtl(AuthBean ab, Model model) {
		mav.setViewName("facebooklog");
		return mav;
	}
	
	private ModelAndView naverCtl(AuthBean ab, Model model) {
		mav.setViewName("naverlog");
		return mav;
	}
	
	private ModelAndView kakaoCtl(AuthBean ab, Model model) {
		mav.setViewName("kakaolog");
		return mav;
	}
	
	private ModelAndView logInCtl(AuthBean ab, Model model) {
		System.out.println(ab.getMId());
		System.out.println(ab.getMPw());
		System.out.println(ab.getLogCode());
		
		System.out.println(ab.getAId());
		System.out.println(ab.getAPw());
		System.out.println(ab.getLogCode());
		
		if(ab.getLogCode().equals("U")) { 
			if(mmIF.isUser(ab)==1) {
				System.out.println("아이디 비밀번호 일치!!");
				if(mmIF.isState(ab).equals("A")) {
					System.out.println("state : " + mmIF.isState(ab)+" // 활성화 계정입니다.");
					mav.setViewName("start");
				}else {
					System.out.println("비활성화 계정입니다.");
					model.addAttribute("msg", "비활성화 계정입니다.");
					mav.setViewName("main");
				}
			}else {
				System.out.println("아이디와 비밀번호를 확인해주세요.");
				model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
				mav.setViewName("main");
			}
		}else if(ab.getLogCode().equals("A")){
			if(mmIF.isAdmin(ab)==1) {
				System.out.println("아이디 비밀번호 일치!!");
				mav.setViewName("adminstart");
			}else {
				System.out.println("아이디와 비밀번호를 확인해주세요.");
				model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
				mav.setViewName("admin2");
			}
		}
		//mav.addObject("Info", "메인");
		return mav;
	}
	
	

}