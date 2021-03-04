package icy.aog.services;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.Hospital;

@Service
public class Admin {
	ModelAndView page = new ModelAndView();
	
	public Admin() {}
	
	public ModelAndView entrance(Hospital HB) {
		System.out.println("entrance진입전");
		switch(HB.getSCode()){
			case "RESERVELIST": 
				page = resListCtl(HB);
				break;
			case "HPREVIEW":
				page = hpReview(HB);
				break;
			case "SETTINGFORM":
				page = settingCtl(HB);
				break;
			case "DRTIME":
				page = drtimeCtl(HB);
				break;
			case "SCHEDULEFORM":
				page = scheduleformCtl(HB);
				break;
			case "BREAK":
				page = breakCtl(HB);
				break;
		}
		
		return page;
	}

	private ModelAndView breakCtl(Hospital HB) {
		
		page.addObject("Info", "휴진");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView scheduleformCtl(Hospital hB) {
		page.addObject("Info", "일정표");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView drtimeCtl(Hospital hB) {
		page.addObject("Info", "의사시간");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView settingCtl(Hospital hB) {
		page.addObject("Info", "기본설정");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView hpReview(Hospital hB) {
		page.addObject("Info", "리뷰");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView resListCtl(Hospital hB) {
		System.out.println("entrance진입");
		page.addObject("Info", "예약리스트");
		page.setViewName("adminstart");
		return page;
	}
}
