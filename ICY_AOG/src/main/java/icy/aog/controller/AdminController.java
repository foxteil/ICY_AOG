package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.Hospital;
import icy.aog.services.Admin;

@Controller
public class AdminController {
	@Autowired
	private Admin admin;
	ModelAndView mav;

	@RequestMapping(value = "/RESERVELIST", method = { RequestMethod.GET, RequestMethod.POST })
	public String reserveList(@ModelAttribute Hospital HB) {
		HB.setSCode("RESERVELIST");
		mav = new ModelAndView();
		mav = admin.entrance(HB);
		return mav.getViewName();

	}

	@RequestMapping(value = "/SETTINGFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String settingForm(@ModelAttribute Hospital HB) {
		HB.setSCode("SETTINGFORM");
		mav = new ModelAndView();
		mav = admin.entrance(HB);
		return mav.getViewName();
	}

	@RequestMapping(value = "/HPREVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String hpReview(@ModelAttribute Hospital HB) {
		HB.setSCode("HPREVIEW");
		mav = new ModelAndView();
		mav = admin.entrance(HB);
		return mav.getViewName();
	}

	@RequestMapping(value = "/SCHEDULEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String scheduleForm(@ModelAttribute Hospital HB) {
		HB.setSCode("SCHEDULEFORM");
		mav = new ModelAndView();
		mav = admin.entrance(HB);
		return mav.getViewName();
	}

	@RequestMapping(value = "/DRTIME", method = { RequestMethod.GET, RequestMethod.POST })

	public String drTime(@ModelAttribute Hospital HB) {

		HB.setSCode("DRTIME");
		mav = new ModelAndView();
		mav = admin.entrance(HB);
		return mav.getViewName();
	}

	@RequestMapping(value = "/BREAK", method = { RequestMethod.GET, RequestMethod.POST })

	public String Break(@ModelAttribute Hospital HB) {

		HB.setSCode("BREAK");
		mav = new ModelAndView();
		mav = admin.entrance(HB);
		return mav.getViewName();
	}
	// 윤정

	@RequestMapping(value = "/DOCTORFORM", method = { RequestMethod.GET, RequestMethod.POST })

	public String doctorForm(Model mode) {

		String page = "doctorForm";

		return page;

	}

	@RequestMapping(value = "/HOSPITALFORM", method = { RequestMethod.GET, RequestMethod.POST })

	public String hospitalform(Model mode) {

		String page = "hospitalform";

		return page;

	}

	@RequestMapping(value = "/DRINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })

	public String drinfoForm(Model mode) {

		String page = "drinfoForm";

		return page;

	}

	@RequestMapping(value = "/DRINFO", method = { RequestMethod.GET, RequestMethod.POST })

	public String drInfo(Model mode) {

		String page = "drInfo";

		return page;

	}

	@RequestMapping(value = "/HPINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })

	public String hpInfoForm(Model mode) {

		String page = "hpInfoForm";

		return page;

	}

	@RequestMapping(value = "/HPINFO", method = { RequestMethod.GET, RequestMethod.POST })

	public String hpInfo(Model mode) {

		String page = "hpInfo";

		return page;

	}

	@RequestMapping(value = "/RESCONFIRM", method = { RequestMethod.GET, RequestMethod.POST })

	public String resConfirm(Model mode) {

		String page = "resConfirm";

		return page;

	}

	@RequestMapping(value = "/ENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	public String enrollForm(Model mode) {

		String page = "enrollForm";

		return page;

	}

	@RequestMapping(value = "/INSENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	public String insenrollForm(Model mode) {

		String page = "insenrollForm";

		return page;

	}

	@RequestMapping(value = "/DELENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	public String delEnroll(Model mode) {

		String page = "delEnroll";

		return page;

	}

	@RequestMapping(value = "/ENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	public String Enroll(Model mode) {

		String page = "Enroll";

		return page;

	}

	@RequestMapping(value = "/RESAVAILABLE", method = { RequestMethod.GET, RequestMethod.POST })

	public String resAvailable(Model mode) {

		String page = "resAvailable";

		return page;

	}

}
