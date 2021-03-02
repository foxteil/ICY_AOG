package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icy.aog.bean.Hospital;
import icy.aog.mapper.HospitalIF;

@Service
public class Admin {
	ModelAndView mav;
	
	@Autowired
	private HospitalIF hpIf;
	@Autowired
	private Gson gson;
	
	public Admin() {
		
	}
	
	public ModelAndView entrance(Hospital hp) {
		mav = null;
		
		switch (hp.getSCode()) {
		case "DRINFOFORM":
			mav = drInfoForm(hp );
			break;
		case "DRINFO":
			mav = DRINFO(hp);
			break;
		case "DRINFOj":
			mav = DRINFOj(hp);
			break;
		case "HPINFOFORM":
			mav = HPINFOFORM(hp);
			break;
		case "HPINFO":
			mav = HPINFO(hp);
			break;
		case "RESCONFIRM":
			mav = RESCONFIRM(hp);
			break;
		case "ENROLLFORM":
			mav = ENROLLFORM(hp);
			break;
		case "INSENROLLFORM":
			mav = INSENROLLFORM(hp);
			break;
		case "DELENROLL":
			mav = DELENROLL(hp);
			break;
		case "ENROLL":
			mav = ENROLL(hp);
			break;
		case "RESAVAILABLE":
			mav = RESAVAILABLE(hp);
			break;
		
		}
		
		
		return mav;
	}

	private ModelAndView DRINFOj(Hospital hp) {
		
		String jsonData = gson.toJson(hpIf.getDr(hp));
		System.out.println(jsonData);
		 mav.addObject("jsont1",jsonData);


		
		return mav;
	}

	private ModelAndView RESAVAILABLE(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView ENROLL(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView DELENROLL(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView INSENROLLFORM(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView ENROLLFORM(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView RESCONFIRM(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView HPINFO(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView HPINFOFORM(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		return mav;
	}

	private ModelAndView DRINFO(Hospital hp) {
		if(hp.getDCode().equals("f1")) {
			hp.setDrCode("씨티엘 안에 닥터코드");
			mav.addObject("test",hp.getDrCode());
		}else if(hp.getDCode().equals("f2")) {
			
			String jsonData = gson.toJson(hpIf.getDr(hp));
			System.out.println(jsonData);
			mav.addObject("jsont1",jsonData);

		}
		return mav;
	}

	private ModelAndView drInfoForm(Hospital hp) {
		hp.setDrCode("씨티엘 안에 닥터코드");
		
		mav.addObject("test",hp.getDrCode());
		
		return mav;
	}
}
