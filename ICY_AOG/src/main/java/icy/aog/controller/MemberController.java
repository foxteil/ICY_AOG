package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.ReservationBean;
import icy.aog.services.MyPage;
import icy.aog.services.Reservation;

@Controller
public class MemberController {
	@Autowired
	private Reservation rv;
	@Autowired
	private MyPage mp;
	
	@RequestMapping(value = "/LSEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String LSEARCH(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("LSEARCH");
		mav =rv.entrance(res);
		mav.setViewName("LSEARCH");
		return mav.getViewName();

	}

	@RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESCHECK(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("RESCHECK");
		mav.setViewName("rescheck");
		mav=rv.entrance(res);
		return mav.getViewName();

	}
	
	@RequestMapping(value = "/PART", method = { RequestMethod.GET, RequestMethod.POST })
	public String PART(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("PART");
		mav.setViewName("part");
		mav =rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/ORDER", method = { RequestMethod.GET, RequestMethod.POST })
	public String  ORDER(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("ORDER");
		mav.setViewName("order");
		mav =rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/HDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String HDETAIL(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("HDETAIL");
		mav.setViewName("hdetail");
		mav =rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/MAP", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView  MAP(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
	
		return rv.entrance(res);

	}

	@RequestMapping(value = "/RESFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String  RESFORM(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("RESFORM");
		mav.setViewName("resform");
		mav=rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/DATECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String  DATECHECK(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("DATECHECK");
		mav.setViewName("datecheck");
		mav=rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/FINISH", method = { RequestMethod.GET, RequestMethod.POST })
	public String FINISH(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("FINISH");
		mav.setViewName("finish");
		mav=rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/CANCLE", method = { RequestMethod.GET, RequestMethod.POST })
	public String  CANCLE(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("CANCLE");
		mav.setViewName("cancle");
		mav=rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/SEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String SEARCH(@ModelAttribute ReservationBean res) {
		ModelAndView mav=new ModelAndView();
		res.setSCode("SEARCH");
		mav.setViewName("search");
		mav=rv.entrance(res);
		
		return mav.getViewName();
	}

	@RequestMapping(value = "/UPMINFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFORM(Model model, ReservationBean rv) {
		rv.setSCode("UPMINFORM");
		System.out.println("확인");
		return mp.entrance(rv, model);

	}

	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(Model model, ReservationBean rv) {
		return mp.entrance(rv, model);

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(Model model, ReservationBean rv) {
		return mp.entrance(rv, model);

	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(Model model, ReservationBean rv) {
		return mp.entrance(rv, model);
	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(Model model, ReservationBean rv) {
		rv.setSCode("MYPAGEFORM");
		return mp.entrance(rv, model);

	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(Model model, ReservationBean rv) {
		return mp.entrance(rv, model);

	}

	@RequestMapping(value = "/UPFAFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAFORM(Model model, ReservationBean rv) {
		String page = "upfaform";
		return page;

	}

	@RequestMapping(value = "/UPFAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAMILY(Model model, ReservationBean rv) {
		String page = "upfamily";
		return page;

	}

	@RequestMapping(value = "/RDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String RDETAIL(Model model, ReservationBean rv) {
		String page = "rdetail";
		return page;

	}
	
	/*임시*/
	@RequestMapping(value = "/FAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String family(Model model, ReservationBean rv) {
		String page = "family";
		return page;

	}


}
