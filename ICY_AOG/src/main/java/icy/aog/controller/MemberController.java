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



import icy.aog.beans.ReservationBean;
import icy.aog.services.MyPage;

import icy.aog.services.Reservation;

@Controller
public class MemberController {
	@Autowired
	private Reservation rv;
	@Autowired
	private MyPage mypage;

	
	ModelAndView mav = new ModelAndView();
	@RequestMapping(value="/START", method = { RequestMethod.GET, RequestMethod.POST })
	public String START(@ModelAttribute Model model, ReservationBean res) {
		//System.out.println("와?");
		ModelAndView mav = new ModelAndView();
	
	res.setSCode("START");
	mav= rv.entrance(res, model);	
	
	return mav.getViewName();
	}


	@ResponseBody
	@RequestMapping(value = "/GU", method = { RequestMethod.GET, RequestMethod.POST })
	public String GU(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		res.setSCode("GU");
		mav = rv.entrance(res, model);
		//System.out.println(res.getGuName());
		return URLEncoder.encode(mav.getModel().get("guInfo").toString(), "UTF-8");

	}
	@ResponseBody
	@RequestMapping(value = "/GU2", method = { RequestMethod.GET, RequestMethod.POST })
	public String GU2(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		res.setSCode("GU2");
		mav = rv.entrance(res, model);
		//System.out.println(res.getGuName());
		return URLEncoder.encode(mav.getModel().get("poInfo").toString(), "UTF-8");

	}



	
	 @RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	   public String RESCHECK(@ModelAttribute ReservationBean rv,Model model) {
	      rv.setSCode("RESCHECK");
	      mav = mypage.entrance(rv,model);
	      return mav.getViewName();
	   }

	@RequestMapping(value = "/ORDER", method = { RequestMethod.GET, RequestMethod.POST })
	public String ORDER(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("ORDER");
	
		mav = rv.entrance(res, model);
		model.addAttribute("hpInfo", mav.getModel().get("oInfo").toString());
		model.addAttribute("bkInfo", mav.getModel().get("bInfo").toString());
		return mav.getViewName();

	}

	@RequestMapping(value = "/HDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String HDETAIL(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("HDETAIL");
		
		mav = rv.entrance(res, model);
		//System.out.println(res.getHpImg());
		model.addAttribute("dInfo", mav.getModel().get("hdInfo").toString());
		
	
		return mav.getViewName();

	}

	
	@RequestMapping(value = "/MAP", method = { RequestMethod.GET, RequestMethod.POST })
	public String MAP(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
			res.setSCode("MAP");
			mav =rv.entrance(res, model);
			
		return mav.getViewName();

	}

	@RequestMapping(value = "/RESFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESFORM(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("RESFORM");
		mav = rv.entrance(res, model);
	//	System.out.println(mav.getModel().get("rfInfo").toString());
		model.addAttribute("fInfo",mav.getModel().get("fInfos").toString());
		model.addAttribute("hInfo", mav.getModel().get("rfInfo").toString());
		model.addAttribute("tInfo", mav.getModel().get("dInfo").toString());
		model.addAttribute("pInfo", mav.getModel().get("dpInfo").toString());
		
		model.addAttribute("ddInfo", mav.getModel().get("dtInfo").toString());
		
		return mav.getViewName();

	}
	

	@RequestMapping(value = "/GETTIME", method = { RequestMethod.GET, RequestMethod.POST })
	public String GETTIME(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException  {
		res.setSCode("GETTIME");
		mav = rv.entrance(res, model);
		//model.addAttribute("drTime", mav.getModel().get("dTime").toString());
		
		return mav.getViewName();

	}

	@ResponseBody
	@RequestMapping(value = "/DATECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String DATECHECK(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("DATECHECK");
		mav = rv.entrance(res, model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/FINISH", method = { RequestMethod.GET, RequestMethod.POST })
	public String FINISH(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("FINISH");
		mav = rv.entrance(res, model);

		model.addAttribute("gInfo", mav.getModel().get("getRes").toString());

		return mav.getViewName();

	}

	@ResponseBody
	@RequestMapping(value = "/CANCLE", method = { RequestMethod.GET, RequestMethod.POST })
	public String CANCLE(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("CANCLE");
		mav = rv.entrance(res, model);
		return mav.getViewName();

	}

	
	@RequestMapping(value = "/SEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String SEARCH(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		res.setSCode("SEARCH");
		mav = rv.entrance(res, model);

		return mav.getViewName();
	}
	@ResponseBody
	@RequestMapping(value = "/UPMINFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFORM(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException {
		res.setSCode("UPMINFORM");
		mav = mypage.entrance(res, model);
		return URLEncoder.encode(mav.getModel().get("Info").toString(),"UTF-8");
	}

	@ResponseBody
	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("REVIEW");
		mav = mypage.entrance(res, model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(@ModelAttribute ReservationBean res, Model model) {
		System.out.println(res.getId());
		res.setSCode("BOOKMARKFORM");
		mav = mypage.entrance(res, model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("BOOKMARK");
		mav = mypage.entrance(res, model);
		return mav.getViewName();
	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(@ModelAttribute ReservationBean res, Model model) {
		System.out.println(res.getId());
		res.setSCode("MYPAGEFORM");
		mav = mypage.entrance(res, model);
		return mav.getViewName();

	}
	@RequestMapping(value = "/PWCONFIRM", method = { RequestMethod.POST })
	@ResponseBody
	public String PWCONFIRM(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		System.out.println(res.getId());
		res.setSCode("PWCONFIRM");
		mav = mypage.entrance(res,model);
		System.out.println(mav.getModel().get("Pw"));
		return URLEncoder.encode(mav.getModel().get("Pw").toString(), "UTF-8");

	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("UPMINFO");
		mav = mypage.entrance(res, model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/UPFAFORM", method = {RequestMethod.POST })
	@ResponseBody
	public String UPFAFORM(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		res.setSCode("UPFAFORM");
		mav = mypage.entrance(res,model);
		System.out.println(mav.getModel().get("faInfo").toString());
		return URLEncoder.encode(mav.getModel().get("faInfo").toString(), "UTF-8");
	}

	@RequestMapping(value = "/UPFAMILY", method = { RequestMethod.POST })
	@ResponseBody
	public String UPFAMILY(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		res.setSCode("UPFAMILY");
		mav = mypage.entrance(res,model);
		System.out.println(mav.getModel().get("insfaInfo").toString());
		return URLEncoder.encode(mav.getModel().get("insfaInfo").toString(), "UTF-8");
	}
	@RequestMapping(value = "/MPWFORM", method = {RequestMethod.POST })
	@ResponseBody
	public String MPWFORM(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		System.out.println("PWFORM 진입");
		System.out.println(res.getId());
		res.setSCode("PWFORM");
		mav = mypage.entrance(res,model);
		System.out.println(mav.getModel().get("pwInfo").toString());
		return URLEncoder.encode(mav.getModel().get("pwInfo").toString(), "UTF-8");
	}
	

	@RequestMapping(value = "/RDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String RDETAIL(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("RDETAIL");
		mav = mypage.entrance(res, model);
		return mav.getViewName();

	}
	
	@RequestMapping(value = "/DAUM", method = { RequestMethod.GET, RequestMethod.POST })
	public String daum(@ModelAttribute ReservationBean res,Model model) {
		res.setSCode("LSEARCH");
		mav = rv.entrance(res, model);
		return "daumAPI";
	}

	/* 임시 */
	@RequestMapping(value = "/FAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String family(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("FAMILY");
		mav = mypage.entrance(res, model);
		return mav.getViewName();

	}

}
