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

import icy.aog.beans.ReservationBean;
import icy.aog.services.MyPage;

import icy.aog.services.Reservation;

@Controller
public class MemberController {
	@Autowired
	private Reservation rv;
	@Autowired
	private MyPage mypage;
	
	
	ModelAndView mav=new ModelAndView();

	
	@RequestMapping(value="/sample/getAddrApi.do")
	public void start(Model model, HttpServletRequest req,
	 HttpServletResponse response) throws UnsupportedEncodingException, IOException{
	 // 요청변수 설정
		model.addAttribute("form_name",mav.getModel().get("form_name").toString() );
		model.addAttribute("set_addr", mav.getModel().get("set_addr").toString());
		model.addAttribute("set_detail", mav.getModel().get("set_detail").toString());
		model.addAttribute("set_zipno", mav.getModel().get("set_zipno").toString());
		String cp= (req.getParameter("currentPage")!=null|| !"".equals(req.getParameter("currentPage")))? req.getParameter("currentPage"): "1";
		model.addAttribute("currentPage", cp);
		
	 String currentPage = req.getParameter("currentPage");
	 String countPerPage = req.getParameter("countPerPage");
	 String resultType = req.getParameter("json");
	 String confmKey = req.getParameter("devU01TX0FVVEgyMDIxMDMxMDE4MjcwNDExMDg5ODA=");
	 String keyword = req.getParameter("keyword");
	// API 호출 URL 정보 설정
	 String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+ "&countPerPage="+countPerPage+ "&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey+"&resultType="+resultType;
	URL url = new URL(apiUrl); 
	 BufferedReader br = new BufferedReader(
	 new InputStreamReader(
	 url.openStream(),"UTF-8"));
	 StringBuffer sb = new StringBuffer();
	 String tempStr = null;
	 while(true){
	 tempStr = br.readLine();
	 if(tempStr == null) break;
	 sb.append(tempStr); // 응답결과 JSON 저장
	 }
	 br.close();
	 response.setCharacterEncoding("UTF-8");
	 response.setContentType("text/xml");
	 response.getWriter().write(sb.toString()); // 응답결과 반홖
	}

	 
	@ResponseBody
	@RequestMapping(value = "/GU", method = { RequestMethod.GET, RequestMethod.POST })
	public String DONG(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException  {
		ModelAndView mav=new ModelAndView();
		res.setSCode("GU");
		mav =rv.entrance(res,model);
		mav.setViewName("GU");
		return URLEncoder.encode(mav.getModel().get("guInfo").toString(),"UTF-8");

	}
	
	@ResponseBody
	@RequestMapping(value = "/LSEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String LSEARCH(@ModelAttribute ReservationBean res, Model model) throws UnsupportedEncodingException  {
		ModelAndView mav=new ModelAndView();
		res.setSCode("LSEARCH");
		mav =rv.entrance(res,model);
		mav.setViewName("LSEARCH");
		return URLEncoder.encode(mav.getModel().get("lsearchinfo").toString(),"UTF-8");

	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESCHECK(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("RESCHECK");
		mav=rv.entrance(res,model);
		return mav.getViewName();

	}
	@ResponseBody	
	@RequestMapping(value = "/PART", method = { RequestMethod.GET, RequestMethod.POST })
	public String PART(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav=new ModelAndView();	
		mav =rv.entrance(res,model);
		mav.setViewName("PART");
		return mav.getViewName();
                             
	}
	
	@RequestMapping(value = "/ORDER", method = { RequestMethod.GET, RequestMethod.POST })
	public String  ORDER(@ModelAttribute ReservationBean res, Model model){
		ModelAndView mav=new ModelAndView();
		res.setSCode("ORDER");
		mav =rv.entrance(res,model);	
		model.addAttribute("hpInfo",mav.getModel().get("oInfo").toString());
		
		return mav.getViewName();

	}

	@RequestMapping(value = "/HDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String HDETAIL(@ModelAttribute ReservationBean res, Model model){
		ModelAndView mav=new ModelAndView();
		res.setSCode("HDETAIL"); 
		mav =rv.entrance(res,model);
		model.addAttribute("dInfo", mav.getModel().get("hdInfo").toString());
		return mav.getViewName();

	}
	@ResponseBody
	@RequestMapping(value = "/MAP", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView  MAP(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav=new ModelAndView();
	
		return rv.entrance(res,model);

	}
	
	@RequestMapping(value = "/RESFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String  RESFORM(@ModelAttribute ReservationBean res, Model model)  {
		ModelAndView mav=new ModelAndView();
		res.setSCode("RESFORM");
		mav=rv.entrance(res,model);
		model.addAttribute("hInfo", mav.getModel().get("rfInfo").toString());
		return mav.getViewName();

	}
	@ResponseBody
	@RequestMapping(value = "/DATECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String  DATECHECK(@ModelAttribute ReservationBean res, Model model){
		ModelAndView mav=new ModelAndView();
		res.setSCode("DATECHECK");
		mav=rv.entrance(res,model);
		return mav.getViewName();

	}
	
	@RequestMapping(value = "/FINISH", method = { RequestMethod.GET, RequestMethod.POST })
	public String FINISH(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("FINISH");
		mav=rv.entrance(res,model);	

		
		model.addAttribute("fInfo",mav.getModel().get("rInfo").toString());
		
		return mav.getViewName();

	}
	@ResponseBody
	@RequestMapping(value = "/CANCLE", method = { RequestMethod.GET, RequestMethod.POST })
	public String  CANCLE(@ModelAttribute ReservationBean res, Model model) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("CANCLE");
		mav=rv.entrance(res,model);
		return mav.getViewName();

	}
	@ResponseBody
	@RequestMapping(value = "/SEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String SEARCH(@ModelAttribute ReservationBean res, Model model){
		ModelAndView mav=new ModelAndView();
		res.setSCode("SEARCH");
		mav=rv.entrance(res,model);
		
		return mav.getViewName();
	}
	@ResponseBody
	@RequestMapping(value = "/UPMINFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFORM(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("UPMINFORM");
		mav = mypage.entrance(res,model);
		return mav.getViewName();
	}
	@ResponseBody
	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(@ModelAttribute ReservationBean res,Model model) {
		res.setSCode("REVIEW");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("BOOKMARKFORM");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("BOOKMARK");
		mav = mypage.entrance(res,model);
		return mav.getViewName();
	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("MYPAGEFORM");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("UPMINFO");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/UPFAFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAFORM(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("UPFAFORM");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/UPFAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAMILY(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("UPFAMILY");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}

	@RequestMapping(value = "/RDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String RDETAIL(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("RDETAIL");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}
	
	/*임시*/
	@RequestMapping(value = "/FAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String family(@ModelAttribute ReservationBean res, Model model) {
		res.setSCode("FAMILY");
		mav = mypage.entrance(res,model);
		return mav.getViewName();

	}
	



}
