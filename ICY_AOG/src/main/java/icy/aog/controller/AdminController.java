package icy.aog.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.bean.Hospital;
import icy.aog.services.Admin;

@Controller
public class AdminController {
	ModelAndView mav;
	@Autowired
	private Admin am;
	
	
	  @RequestMapping(value = "/RESERVELIST", method = { RequestMethod.GET, RequestMethod.POST })

	   public String reserveList(Model mode) {

	      String page =  "reserveList";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/SETTINGFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String settingForm(Model mode) {

	      String page =  "settingForm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/HPREVIEW", method = { RequestMethod.GET, RequestMethod.POST })

	   public String hpReview(Model mode) {

	      String page =  "hpReview";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/SCHEDULEFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String scheduleForm(Model mode) {

	      String page =  "scheduleForm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/DRTIME", method = { RequestMethod.GET, RequestMethod.POST })

	   public String drTime(Model mode) {

	      String page =  "drTime";
	   

	      return page;

	   }
	   @RequestMapping(value = "/DOCTORFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String doctorForm(Model mode) {

	      String page =  "doctorForm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/HOSPITALFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String hospitalform(Model mode) {

	      String page =  "hospitalform";
	   

	      return page;

	   }
	   @RequestMapping(value = "/BREAK", method = { RequestMethod.GET, RequestMethod.POST })

	   public String Break(Model mode) {

	      String page =  "Break";
	   

	      return page;

	   }
	   
	   
	   
	   //							me
	   @RequestMapping(value = "/DRINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })
	   public String drinfoForm(@ModelAttribute Hospital hp) {
		   mav = new ModelAndView();
		   hp.setSCode("DRINFOFORM");
		   
		   mav = am.entrance(hp);
		   
	      String page =  "drinfoForm";
	   

	      return page;

	   }
	   
	   //							me
	   @RequestMapping(value = "/DRINFO", method = { RequestMethod.GET, RequestMethod.POST })
	   public String drInfo(@ModelAttribute Hospital hp) {

		   hp.setSCode("DRINFO");
		   mav = am.entrance(hp);
	      String page =  "drInfo";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/DRINFOj", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String drInfoj(@ModelAttribute Hospital hp) throws UnsupportedEncodingException {

		   hp.setSCode("DRINFOj");
		   mav = am.entrance(hp );
	      String page =  "drInfo";
	   
	     
	      return null;

	   }
	   
	   //							me
	   @RequestMapping(value = "/HPINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })
	   public String hpInfoForm(@ModelAttribute Hospital hp) {

		   hp.setSCode("HPINFOFORM");
		   
		   mav = am.entrance(hp );
		   
		   
	      String page =  "hpInfoForm";
	   

	      return page;

	   }
	   
	   //							me
	   @RequestMapping(value = "/HPINFO", method = { RequestMethod.GET, RequestMethod.POST })

	   public String hpInfo(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("HPINFO");
		   mav = am.entrance(hp );
	      String page =  "hpInfo";
	   

	      return page;

	   }
	   
	   //							me
	   @RequestMapping(value = "/RESCONFIRM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resConfirm(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("RESCONFIRM");
		   mav = am.entrance(hp );
	      String page =  "resConfirm";
	   

	      return page;

	   }
	   
	   //							me
	   @RequestMapping(value = "/ENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String enrollForm(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("ENROLLFORM");
		   mav = am.entrance(hp );
	      String page =  "enrollForm";
	   

	      return page;

	   }
	   //							me  직원등록
	   @RequestMapping(value = "/INSENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String insenrollForm(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("INSENROLLFORM");
		   mav = am.entrance(hp );
	      String page =  "insenrollForm";
	   

	      return page;

	   }
	   //							me  직원삭제
	   @RequestMapping(value = "/DELENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String delEnroll(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("DELENROLL");
		   mav = am.entrance(hp );
	      String page =  "delEnroll";
	   

	      return page;

	   }
	   //							me
	   @RequestMapping(value = "/ENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String Enroll(@ModelAttribute Hospital hp) {

		   
		   hp.setSCode("ENROLL");
		   mav = am.entrance(hp );
	      String page =  "Enroll";
	   

	      return page;

	   }
	   
	   //							me
	   @RequestMapping(value = "/RESAVAILABLE", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resAvailable(@ModelAttribute Hospital hp) {

		   
		   
		   hp.setSCode("RESAVAILABLE");
		   mav = am.entrance(hp );
	      String page =  "resAvailable";
	   

	      return page;

	   }



}
