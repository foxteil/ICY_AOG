package icy.aog.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.glassfish.external.statistics.annotations.Reset;

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



	@ResponseBody
	@RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESCHECK(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		System.out.println("RESCHECK 컨트롤: "+res.getId());
		res.setSCode("RESCHECK");
		mav = rv.entrance(res, model);
		return URLEncoder.encode(mav.getModel().get("rCheckInfo").toString(), "UTF-8");

	}

	@ResponseBody
	@RequestMapping(value = "/PART", method = { RequestMethod.GET, RequestMethod.POST })
	public String PART(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav = new ModelAndView();
		mav = rv.entrance(res, model);
		mav.setViewName("PART");
		return mav.getViewName();

	}

	/* 가연 */
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
		
		model.addAttribute("fInfo",mav.getModel().get("fInfos").toString());
		model.addAttribute("hInfo", mav.getModel().get("rfInfo").toString());
		model.addAttribute("tInfo", mav.getModel().get("dInfo").toString());
		model.addAttribute("pInfo", mav.getModel().get("dpInfo").toString());
		
		model.addAttribute("ddInfo", mav.getModel().get("dtInfo").toString());
		
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

	@RequestMapping(value = "/BOOKMARK", method = {RequestMethod.POST })
	@ResponseBody
	public String BOOKMARK(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		res.setSCode("BOOKMARK");
		mav = mypage.entrance(res,model);
		System.out.println(URLEncoder.encode(mav.getModel().get("bkList").toString(), "UTF-8"));
		return URLEncoder.encode(mav.getModel().get("bkList").toString(), "UTF-8");

	}


	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(@ModelAttribute ReservationBean res,Model model) {
		System.out.println("ㅎ");
		res.setSCode("MYPAGEFORM");
		mav = mypage.entrance(res,model);
		mav.addObject("Info","출력완료");
		return mav.getViewName();

	}
	@RequestMapping(value = "/LIST", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(@ModelAttribute ReservationBean res,Model model) {
		System.out.println("ㅎ");
		res.setSCode("LIST");
		mav = mypage.entrance(res,model);
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
	@RequestMapping(value = "/DELFAMILY", method = {RequestMethod.POST })
	@ResponseBody
	public String DELFAMILY(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		res.setSCode("DELFAMILY");
		mav = mypage.entrance(res,model);
		System.out.println(mav.getModel().get("delfaInfo").toString());
		return URLEncoder.encode(mav.getModel().get("delfaInfo").toString(), "UTF-8");
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
	@RequestMapping(value = "/GETTIME", method = { RequestMethod.GET, RequestMethod.POST })
	public String GETTIME(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException  {
		res.setSCode("GETTIME");
		mav = rv.entrance(res, model);
		//model.addAttribute("drTime", mav.getModel().get("dTime").toString());
		
		return mav.getViewName();

	}
	/* 임시   */
	@RequestMapping(value = "/SETDATE", method = { RequestMethod.GET, RequestMethod.POST })
	public String SETDATE(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("SETDATE");
		mav = rv.entrance(res, model);
		return mav.getViewName();
		
	}
	
	@RequestMapping(value = "/resTime", method = { RequestMethod.GET, RequestMethod.POST })
	public String resTime(@ModelAttribute ReservationBean res, Model model) {
		
		mav = rv.entrance(res, model);
		return mav.getViewName();

	}
	@RequestMapping(value = "/giveTMCODE", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String giveTMCODE(@ModelAttribute ReservationBean res, Model model) {
		
		model.addAttribute("tmCode",res.getTmCode());
		mav.setViewName("resform");
		return mav.getViewName();

	}
	@RequestMapping(value = "/PWFORM2", method = {RequestMethod.POST })
	@ResponseBody
	public String PWFORM(@ModelAttribute ReservationBean res,Model model) throws UnsupportedEncodingException {
		res.setSCode("PWFORM");
		mav = mypage.entrance(res,model);
		System.out.println(mav.getModel().get("pwInfo").toString());
		return URLEncoder.encode(mav.getModel().get("pwInfo").toString(), "UTF-8");
	}

}
