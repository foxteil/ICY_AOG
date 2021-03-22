package icy.aog.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.utils.Encryption;
import icia.oap.utils.ProjectUtils;
import icy.aog.beans.AuthBean;

import icy.aog.mapper.MemberIF;

@Service
public class Authentication {
	@Autowired
	private MemberIF mmIF;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils pu;

	ModelAndView mav = new ModelAndView();
	public Authentication() {}

	public ModelAndView entrance(AuthBean ab, Model model) {
		System.out.println("----entrance 진입----");
		
		switch (ab.getSCode()) {
		case "LOGIN":
			mav = logInCtl(ab, model);
			break;
		case "KAKAOLOG":
			mav = kakaoCtl(ab, model);
			break;
		case "NAVERLOGINFORM":
			mav = naverLogInformCtl(ab, model);
			break;	
		case "NAVERLOG":
			mav = naverCtl(ab, model);
			break;
		case "GOOGLELOG":
			mav = googleCtl(ab, model);
			break;
		case "JOINFORM":
			mav = joinformCtl(ab, model);
			break;	
		case "JOINFORM2":
			mav = joinform2Ctl(ab, model);
			break;		
		case "JOIN":
			mav = joinCtl(ab, model);
			break;
		case "AJOIN":
			mav = ajoinCtl(ab, model);
			break;
		case "POPUPHPSEARCH":
			mav = popUpHpSeachCtl(ab, model);
			break;
		case "POPUPHPSEARCHFORM":
			mav = popUpHpSeachformCtl(ab, model);
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
	private ModelAndView popUpHpSeachformCtl(AuthBean ab, Model model) {
		mav.setViewName("popuphpsearch");
		return mav;
	}

	private ModelAndView popUpHpSeachCtl(AuthBean ab, Model model) {
		System.out.println("ab.getMWord() : "+ab.getMWord());
			
		String jsonData = gson.toJson(mmIF.seachHospital(ab));
		System.out.println(jsonData);
		
		mav.addObject("hpList", jsonData);
		mav.setViewName("popuphpsearch");
		return mav;
	}
	


	private ModelAndView adiminCtl(AuthBean ab, Model model) {
		mav.setViewName("admin2");
		return mav;
	}
	

	private ModelAndView pwFormCtl(AuthBean ab, Model model) {
		mav.setViewName("pwform");
		return mav;
	}
	
	private ModelAndView findCtl(AuthBean ab, Model model) {
		//fCode로 분기 findId & findPw !!
		mav.setViewName("find");
		return mav;
	}
	
	private ModelAndView joinform2Ctl(AuthBean ab, Model model) {
		
		mav.setViewName("joinform2");
		
		return mav;
	}
	
	private ModelAndView joinformCtl(AuthBean ab, Model model) {
		
	
		model.addAttribute("fName", ab.getFName());
		model.addAttribute("fJumin", ab.getFJumin());
		model.addAttribute("fPhone", ab.getFPhone());
		model.addAttribute("fAddr", ab.getFAddr());
		
		if(ab.getJCode().equals("U")) {
			System.out.println("ab.getFName(): "+ab.getFName());
			System.out.println("ab.getFJumin(): "+ab.getFJumin());
			System.out.println("ab.getFPhone(): "+ab.getFPhone());
			System.out.println("ab.getFAddr(): "+ab.getFAddr());
			mav.setViewName("joinform");
		}else if(ab.getJCode().equals("A")) {
			mav.setViewName("adminjoinform");
		}
		return mav;
	}
	
	private ModelAndView ajoinCtl(AuthBean ab, Model model) {
		System.out.println("ajoinCtl진입");
		System.out.println("JCode : "+ab.getJCode());
		System.out.println("HpCode : "+ab.getAHpCode());
		System.out.println("HpName : "+ab.getAHpName());
		System.out.println("HpAddr : "+ab.getAHpAddr());
		System.out.println("HpPhone : "+ab.getAHpPhone());
		System.out.println("HpPark : "+ab.getAHpPark());
		System.out.println("HpImg : "+ab.getAHpImg());
		
		System.out.println("AId : "+ab.getAId());
		System.out.println("APw : "+ab.getAPw());
		System.out.println("ARank : "+ab.getARank());
		System.out.println("APhone : "+ab.getAPhone());
		System.out.println("AName : "+ab.getAName());
		System.out.println("AHpHt1 : "+ab.getAHpHt1());
		System.out.println("AHpHt2 : "+ab.getAHpHt2());
		System.out.println("AHpHt3 : "+ab.getAHpHt3());
		
		mmIF.insHp(ab);
		mmIF.insStaff(ab);
		
		
		if(ab.getAHpHt1() != "") {
			System.out.println("ht1 있을때");
			mmIF.insHt1(ab);
		}
		if(ab.getAHpHt2() != "") {
			System.out.println("ht2 있을때");
			mmIF.insHt2(ab);
		}
		if(ab.getAHpHt3() != "") {
			System.out.println("ht3 있을때");
			mmIF.insHt3(ab);
		}
		
		model.addAttribute("HpCode", ab.getAHpCode());
		model.addAttribute("AId", ab.getAId());
		
		model.addAttribute("msg", "병원관리자  회원가입이 완료되었습니다.");
		mav.setViewName("admin2");
		return mav;
	}
	
	private ModelAndView joinCtl(AuthBean ab, Model model) {
		System.out.println("joinCtl진입");
		System.out.println(ab.getJCode());
		System.out.println("ab.getMId() : "+ab.getMId());
		System.out.println("ab.getMPw() : "+ab.getMPw());
		System.out.println("ab.getMName() : "+ab.getMName());
		System.out.println("ab.getMJumin() : "+ab.getMJumin());
		System.out.println("ab.getMPhone() : "+ab.getMPhone());
		System.out.println("ab.getMAddr() : "+ab.getMAddr());
		
		System.out.println("ab.getFName() : "+ab.getFName());
		System.out.println("ab.getFJumin() : "+ab.getFJumin());
		System.out.println("ab.getFPhone() : "+ab.getFPhone());
		System.out.println("ab.getFAddr() : "+ab.getFAddr());
		
		mmIF.insMember(ab); 
		mmIF.insFamily(ab);
		if(ab.getFName() == "") {
			System.out.println("세대원 네임 입력값 없을때");
		}else {
			System.out.println("세대원 네임 입력값 있을때");
			mmIF.insSedewon(ab); //세대원 추가 인서트 실행!
		}
		
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		mav.setViewName("main");
		return mav;
	}
	
	private ModelAndView googleCtl(AuthBean ab, Model model) {
		System.out.println("구글 이름 : "+ab.getMName());
		System.out.println("구글  eMail : "+ab.getMId());
		System.out.println("구글 회원번호 : "+ab.getMPw());
		
		model.addAttribute("mId", "google"+ab.getMId());
		
		if(mmIF.isGoogleUser(ab)==0) { // google계정으로 가입안되어 있을때
			mmIF.insGoogleMember(ab); // MM테이블 insert
			mmIF.insGoogleFamily(ab); // FA테이블 insert
		}
		
		mav.setViewName("start"); 
		return mav;
	}
	
	private ModelAndView naverLogInformCtl(AuthBean ab, Model model) {
		System.out.println("NAVER eMail : "+ab.getMId());
		System.out.println("NAVER 이름 : "+ab.getMName());
		System.out.println("NAVER 생일 : "+ab.getMJumin());
		System.out.println("NAVER 회원번호 : "+ab.getMPw());
		
		model.addAttribute("mId", "naver"+ab.getMId());
		
		if(mmIF.isNaverUser(ab)==0) { // naver계정으로 가입안되어 있을때
			mmIF.insNaverMember(ab); // MM테이블 insert
			mmIF.insNaverFamily(ab); // FA테이블 insert
		}
		
		mav.setViewName("start"); 
		return mav;
	}
	
	private ModelAndView naverCtl(AuthBean ab, Model model) {
		System.out.println("naverCtl 진입");
		mav.setViewName("test");
		return mav;
	}
	
	private ModelAndView kakaoCtl(AuthBean ab, Model model) {
		System.out.println("카카오계정 ID : " + ab.getMId());
		System.out.println("닉네임 : " + ab.getMName());
		System.out.println("생일 : " + ab.getMJumin());
		System.out.println("카카오 회원번호  : " + ab.getMPw());
		
		model.addAttribute("mId", "kakao"+ab.getMId());
		
		if(mmIF.isKakaoUser(ab)==0) { // 카카오계정으로 가입안되어 있을때
			mmIF.insKakaoMember(ab); // MM테이블 insert
			mmIF.insKakaoFamily(ab); // FA테이블 insert
		}
		
		mav.setViewName("start"); //카카오 로그인
		return mav;
	}
	
	private ModelAndView logInCtl(AuthBean ab, Model model) {

		if(ab.getLogCode().equals("U")) { 
			if(mmIF.isUser(ab)==1) {
				System.out.println("유저 아이디 비밀번호 일치!!");
				if(mmIF.isState(ab).equals("A")) {
					System.out.println("state : " + mmIF.isState(ab)+" // 활성화 계정입니다.");
					model.addAttribute("logCode", ab.getLogCode());
					model.addAttribute("idInfo", ab.getMId());
					String jsonData=gson.toJson(this.lsearchInfo(ab));
					mav.addObject("lsinfo", jsonData);

					//	System.out.println(jsonData2);
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
				System.out.println("관리자 아이디 비밀번호 일치!!");
				model.addAttribute("logCode", ab.getLogCode());
				model.addAttribute("aId", ab.getAId());
				model.addAttribute("aHpCode", ab.getAHpCode());
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
	private ArrayList<AuthBean> lsearchInfo(AuthBean ab){
		System.out.println("???");
		return mmIF.lsearchInfo(ab);
		
	}
	

}