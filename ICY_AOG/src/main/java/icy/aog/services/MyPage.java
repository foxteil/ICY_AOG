package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.ReservationBean;

@Service
public class MyPage {
	ModelAndView mav = new ModelAndView();

	public MyPage() {}
	
	@Autowired
	private PlatformTransactionManager tran;

	public ModelAndView entrance(ReservationBean rv) {

		System.out.println("스위치진입전");
		switch (rv.getSCode()) {
		case "UPMINFORM":
			mav = upMInformCtl(rv);
			break;
		case "REVIEW":
			mav = reviewCtl(rv);
			break;
		case "BOOKMARKFORM":
			mav = bookFormCtl(rv);
			break;
		case "BOOKMARK":
			mav = bookMarkCtl(rv);
			break;
		case "MYPAGEFORM":
			System.out.println("마이페이지");
			mav = myPageCtl(rv);
			break;
		case "UPMINF":
			mav = upMInfoCtl(rv);
			break;
		case "UPFAFORM":
			mav = upfaFormCtl(rv);
			break;
		case "UPFAMILY":
			mav = upFamilyCtl(rv);
			break;
		case "RDETAIL":
			mav = RDetailCtl(rv);
			break;

		}
		return mav;
	}

	private ModelAndView upMInformCtl(ReservationBean rv) {
		System.out.println("확인");
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView reviewCtl(ReservationBean rv) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView bookFormCtl(ReservationBean rv) {
		mav.setViewName("bookmarkform");
		return mav;
	}

	private ModelAndView bookMarkCtl(ReservationBean rv) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView myPageCtl(ReservationBean rv) {
		System.out.println("진입");
		mav.setViewName("mypageform");
		mav.addObject("Info", "제발");
		return mav;
	}

	private ModelAndView upMInfoCtl(ReservationBean rv) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upfaFormCtl(ReservationBean rv) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upFamilyCtl(ReservationBean rv) {
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView RDetailCtl(ReservationBean rv) {
		mav.setViewName("mypageform");
		return mav;
	}

}