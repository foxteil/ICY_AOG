package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.ReservationBean;

@Service
public class MyPage {
	ModelAndView mav = new ModelAndView();

	public MyPage() {}
	
	@Autowired
	private PlatformTransactionManager tran;

	public ModelAndView entrance(ReservationBean rv,Model model) {

		System.out.println("스위치진입전");
		switch (rv.getSCode()) {
		case "UPMINFORM":
			mav = upMInformCtl(rv,model);
			break;
		case "REVIEW":
			mav = reviewCtl(rv,model);
			break;
		case "BOOKMARKFORM":
			mav = bookFormCtl(rv,model);
			break;
		case "BOOKMARK":
			mav = bookMarkCtl(rv,model);
			break;
		case "MYPAGEFORM":
			System.out.println("마이페이지");
			mav = myPageCtl(rv,model);
			break;
		case "UPMINF":
			mav = upMInfoCtl(rv,model);
			break;
		case "UPFAFORM":
			mav = upfaFormCtl(rv,model);
			break;
		case "UPFAMILY":
			mav = upFamilyCtl(rv,model);
			break;
		case "RDETAIL":
			mav = RDetailCtl(rv,model);
			break;

		}
		return mav;
	}

	private ModelAndView upMInformCtl(ReservationBean rv,Model model) {
		System.out.println("확인");
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView reviewCtl(ReservationBean rv,Model model) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView bookFormCtl(ReservationBean rv,Model model) {
		mav.setViewName("bookmarkform");
		return mav;
	}

	private ModelAndView bookMarkCtl(ReservationBean rv,Model model) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView myPageCtl(ReservationBean rv,Model model) {
		System.out.println("진입");
		mav.setViewName("mypageform");
		mav.addObject("Info", "제발");
		return mav;
	}

	private ModelAndView upMInfoCtl(ReservationBean rv,Model model) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upfaFormCtl(ReservationBean rv,Model model) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upFamilyCtl(ReservationBean rv,Model model) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView RDetailCtl(ReservationBean rv,Model model) {
		mav.setViewName("mypageform");
		return mav;
	}

}