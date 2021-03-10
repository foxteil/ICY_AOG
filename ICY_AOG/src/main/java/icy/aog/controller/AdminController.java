package icy.aog.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
								
	   @RequestMapping(value = "/DRINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })
	   public String drinfoForm(@ModelAttribute Hospital hp) {
		   mav = new ModelAndView();
		   hp.setSCode("DRINFOFORM");
		   
		   mav = admin.entrance(hp);
		   
	      String page =  "drinfoForm";
	   

	      return page;

	   }
	   							
	   @RequestMapping(value = "/DRINFO", method = { RequestMethod.GET, RequestMethod.POST })
	   public String drInfo(@ModelAttribute Hospital hp) {

		   hp.setSCode("DRINFO");
		   mav = admin.entrance(hp);
	      String page =  "drInfo";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/DRINFOj", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String drInfoj(@ModelAttribute Hospital hp) throws UnsupportedEncodingException {

		   hp.setSCode("DRINFOj");
		   mav = admin.entrance(hp );
	      String page =  "drInfo";
	   
	     
	      return null;

	   }
	   
	   
	   @RequestMapping(value = "/HPINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })
	   public String hpInfoForm(@ModelAttribute Hospital hp) {

		   hp.setSCode("HPINFOFORM");
		   
		   mav = admin.entrance(hp );
		   
		   
	      String page =  "hpInfoForm";
	   

	      return page;

	   }
	   
	   
	   @RequestMapping(value = "/HPINFO", method = { RequestMethod.GET, RequestMethod.POST })

	   public String hpInfo(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("HPINFO");
		   mav = admin.entrance(hp );
	      String page =  "hpInfo";
	   

	      return page;

	   }
	   
	   							
	   @RequestMapping(value = "/RESCONFIRM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resConfirm(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("RESCONFIRM");
		   mav = admin.entrance(hp );
	      String page =  "resConfirm";
	   

	      return page;

	   }
	   
	   
	   @RequestMapping(value = "/ENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String enrollForm(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("ENROLLFORM");
		   mav = admin.entrance(hp );
	      String page =  "enrollForm";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/INSENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String insenrollForm(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("INSENROLLFORM");
		   mav = admin.entrance(hp );
	      String page =  "insenrollForm";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/DELENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String delEnroll(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("DELENROLL");
		   mav = admin.entrance(hp );
	      String page =  "delEnroll";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/ENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String Enroll(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("ENROLL");
		   mav = admin.entrance(hp );
	      String page =  "Enroll";
	   

	      return page;

	   }
	   
	   
	   @RequestMapping(value = "/RESAVAILABLE", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resAvailable(@ModelAttribute Hospital hp) {

		   
		   
		   hp.setSCode("RESAVAILABLE");
		   mav = admin.entrance(hp );
	      String page =  "resAvailable";
	   

	      return page;

	   }



}
