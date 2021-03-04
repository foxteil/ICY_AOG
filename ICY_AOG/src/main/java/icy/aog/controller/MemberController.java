package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
	private MyPage mypage;
	
	ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/LSEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String LSEARCH(@ModelAttribute ReservationBean res) {
		res.setSCode("LSEARCH");
		mav = rv.entrance(res);
		return mav.getViewName();
	}

	@RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESCHECK(@ModelAttribute ReservationBean res) {
		res.setSCode("RESCHECK");
		mav = rv.entrance(res);
		return mav.getViewName();
	}

	@RequestMapping(value = "/PART", method = { RequestMethod.GET, RequestMethod.POST })
	public String PART(@ModelAttribute ReservationBean res) {
		res.setSCode("PART");
		mav = rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/ORDER", method = { RequestMethod.GET, RequestMethod.POST })
	public String ORDER(@ModelAttribute ReservationBean res) {
		System.out.println("ORDER");
		res.setSCode("ORDER");
		mav = rv.entrance(res);
		return mav.getViewName();
	}

	@RequestMapping(value = "/HDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String HDETAIL(@ModelAttribute ReservationBean res) {
		res.setSCode("HDETAIL");
		mav = rv.entrance(res);
		return mav.getViewName();
	}

	@RequestMapping(value = "/MAP", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView MAP(@ModelAttribute ReservationBean res) {

		return rv.entrance(res);

	}

	@RequestMapping(value = "/RESFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESFORM(@ModelAttribute ReservationBean res) {
		res.setSCode("RESFORM");
		mav = rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/DATECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String DATECHECK(@ModelAttribute ReservationBean res) {
		res.setSCode("DATECHECK");
		mav = rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/FINISH", method = { RequestMethod.GET, RequestMethod.POST })
	public String FINISH(@ModelAttribute ReservationBean res) {
		res.setSCode("FINISH");
		mav = rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/CANCLE", method = { RequestMethod.GET, RequestMethod.POST })
	public String CANCLE(@ModelAttribute ReservationBean res) {
		res.setSCode("CANCLE");
		mav = rv.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/SEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String SEARCH(@ModelAttribute ReservationBean res) {
		res.setSCode("SEARCH");
		mav = rv.entrance(res);

		return mav.getViewName();
	}

	@RequestMapping(value = "/UPMINFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFORM(@ModelAttribute ReservationBean res) {

		res.setSCode("UPMINFORM");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(@ModelAttribute ReservationBean res) {

		res.setSCode("REVIEW");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(@ModelAttribute ReservationBean res) {
		res.setSCode("BOOKMARKFORM");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(@ModelAttribute ReservationBean res) {
		res.setSCode("BOOKMARK");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(@ModelAttribute ReservationBean res) {
		System.out.println("");
		res.setSCode("MYPAGEFORM");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(@ModelAttribute ReservationBean res) {
		res.setSCode("UPMINFO");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/UPFAFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAFORM(@ModelAttribute ReservationBean res) {
		res.setSCode("UPFAFORM");
		mav = mypage.entrance(res);
		return mav.getViewName();
	}

	@RequestMapping(value = "/UPFAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAMILY(@ModelAttribute ReservationBean res) {
		res.setSCode("UPFAMILY");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

	@RequestMapping(value = "/RDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String RDETAIL(@ModelAttribute ReservationBean res) {
		res.setSCode("RDETAIL");
		mav = mypage.entrance(res);
		return mav.getViewName();
	}

	/* 임시 */
	@RequestMapping(value = "/FAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String family(@ModelAttribute ReservationBean res) {
		res.setSCode("FAMILY");
		mav = mypage.entrance(res);
		return mav.getViewName();

	}

}