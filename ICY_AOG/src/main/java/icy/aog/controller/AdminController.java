package icy.aog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

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
	   @RequestMapping(value = "/DRINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String drinfoForm(Model mode) {

	      String page =  "drinfoForm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/DRINFO", method = { RequestMethod.GET, RequestMethod.POST })

	   public String drInfo(Model mode) {

	      String page =  "drInfo";
	   

	      return page;

	   }
	   @RequestMapping(value = "/HPINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String hpInfoForm(Model mode) {

	      String page =  "hpInfoForm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/HPINFO", method = { RequestMethod.GET, RequestMethod.POST })

	   public String hpInfo(Model mode) {

	      String page =  "hpInfo";
	   

	      return page;

	   }
	   @RequestMapping(value = "/RESCONFIRM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resConfirm(Model mode) {

	      String page =  "resConfirm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/ENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String enrollForm(Model mode) {

	      String page =  "enrollForm";
	   

	      return page;

	   }
	   
	   @RequestMapping(value = "/INSENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String insenrollForm(Model mode) {

	      String page =  "insenrollForm";
	   

	      return page;

	   }
	   @RequestMapping(value = "/DELENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String delEnroll(Model mode) {

	      String page =  "delEnroll";
	   

	      return page;

	   }
	   @RequestMapping(value = "/ENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String Enroll(Model mode) {

	      String page =  "Enroll";
	   

	      return page;

	   }
	   @RequestMapping(value = "/RESAVAILABLE", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resAvailable(Model mode) {

	      String page =  "resAvailable";
	   

	      return page;

	   }



}
