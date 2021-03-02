package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import icy.aog.beans.ReservationBean;



@Service
public class MyPage {
	Model model = null;
	String page;
//	@Autowired
//	private  MapperIf mapper;
//	@Autowired
//	private Gson gson;
//	@Autowired
//	private platformTransactionManager tran;
//	

	
	public MyPage() {}

	public String entrance(ReservationBean rv, Model model) {
		
		
		System.out.println("스위치진입전");
		switch(rv.getSCode()) {
		case "UPMINFORM":
			page = upMInformCtl(rv, model);
			break;
		case "REVIEW":
			page = reviewCtl(rv, model);
			break;
		case "BOOKMARKFORM":
			page = bookFormCtl(rv, model);
			break;
		case "BOOKMARK":
			page = bookMarkCtl(rv, model);
			break;
		case "MYPAGEFORM":
			System.out.println("마이페이지");
			page = myPageCtl(rv, model);
			break;
		case "UPMINF":
			page = upMInfoCtl(rv, model);
			break;
		case "UPFAFORM":
			page = upfaFormCtl(rv, model);
			break;
		case "UPFAMILY":
			page = upFamilyCtl(rv, model);
			break;
		case "RDETAIL":
			page = RDetailCtl(rv, model);
			break;
					
		}
		return page;
	}

	private String upMInformCtl(ReservationBean rv, Model model2) {
		System.out.println("확인");
		// TODO Auto-generated method stub
		page = "info";
		model.addAttribute("Info", "upinfo");
		return page;
	}

	private String reviewCtl(ReservationBean rv, Model model2) {
		/*
		 * if(rv.getResCode().equals("r")) { //getReview; }else { //insReview; }
		 */
		return null;
	}

	private String bookFormCtl(ReservationBean rv, Model model2) {
		// TODO Auto-generated method stub
		return null;
	}

	private String bookMarkCtl(ReservationBean rv, Model model2) {
		// TODO Auto-generated method stub
		return null;
	}

	private String myPageCtl(ReservationBean rv, Model model2) {
		System.out.println( "마이페이지");
		page = "mypageform";
		model2.addAttribute("Info", "upinfo");
		return page;
	}

	private String upMInfoCtl(ReservationBean rv, Model model2) {
		// TODO Auto-generated method stub
		return null;
	}

	private String upfaFormCtl(ReservationBean rv, Model model2) {
		// TODO Auto-generated method stub
		return null;
	}

	private String upFamilyCtl(ReservationBean rv, Model model2) {
		// TODO Auto-generated method stub
		return null;
	}

	private String RDetailCtl(ReservationBean rv, Model model2) {
		// TODO Auto-generated method stub
		return null;
	}


	

	
}