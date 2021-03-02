package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.ReservationBean;
import icy.aog.services.Reservation;


@Controller
public class MemberController {
@Autowired
private Reservation res ;

	@RequestMapping(value = "/LSEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String LSEARCH(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("LSEARCH");
		mav =res.entrance(rb);
		mav.setViewName("LSEARCH");
		return mav.getViewName();

	}

	@RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESCHECK(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("RESCHECK");
		mav.setViewName("rescheck");
		mav =res.entrance(rb);
		return mav.getViewName();

	}
	
	@RequestMapping(value = "/PART", method = { RequestMethod.GET, RequestMethod.POST })
	public String PART(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("PART");
		mav.setViewName("part");
		mav =res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/ORDER", method = { RequestMethod.GET, RequestMethod.POST })
	public String  ORDER(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("ORDER");
		mav.setViewName("order");
		mav =res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/HDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String HDETAIL(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("HDETAIL");
		mav.setViewName("hdetail");
		mav =res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/MAP", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView  MAP(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
	
		return res.entrance(rb);

	}

	@RequestMapping(value = "/RESFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String  RESFORM(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("RESFORM");
		mav.setViewName("resform");
		mav=res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/DATECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String  DATECHECK(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("DATECHECK");
		mav.setViewName("datecheck");
		mav=res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/FINISH", method = { RequestMethod.GET, RequestMethod.POST })
	public String FINISH(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("FINISH");
		mav.setViewName("finish");
		mav=res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/CANCLE", method = { RequestMethod.GET, RequestMethod.POST })
	public String  CANCLE(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("CANCLE");
		mav.setViewName("cancle");
		mav=res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/SEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String SEARCH(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		rb.setSCode("SEARCH");
		mav.setViewName("search");
		mav=res.entrance(rb);
		
		return mav.getViewName();
	}

	@RequestMapping(value = "/UPMINFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFORM(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("UPMINFORM");
		mav.setViewName("upminform");
		mav = res.entrance(rb);
		return mav.getViewName();

	}

	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("REVIEW");
		mav.setViewName("rescheck");
		mav = res.entrance(rb);
		
		return mav.getViewName();

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(@ModelAttribute ReservationBean rb) {
		
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("BOOKMARKFORM");
		mav.setViewName("bookmarkform");
		mav = res.entrance(rb);
		
		return mav.getViewName();


	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("BOOKMARK");
		mav.setViewName("bookmarkform");
		mav = res.entrance(rb);
		
		return mav.getViewName();

	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("MYPAGEFORM");
		mav.setViewName("mypageform");
		mav = res.entrance(rb);
		
		return mav.getViewName();
	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("UPMINFO");
		mav.setViewName("upminfo");
		mav = res.entrance(rb);
		
		return mav.getViewName();
		

	}

	@RequestMapping(value = "/UPFAFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAFORM(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("UPFAFORM");
		mav.setViewName("upfaform");
		mav = res.entrance(rb);
		
		return mav.getViewName();
		

	}

	@RequestMapping(value = "/UPFAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAMILY(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("UPFAMILY");
		mav.setViewName("upfamily");
		mav = res.entrance(rb);
		
		return mav.getViewName();
		
	}

	@RequestMapping(value = "/RDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String RDETAIL(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("RDETAIL");
		mav.setViewName("rdetail");
		mav = res.entrance(rb);
		
		return mav.getViewName();
		
	}
	
	/*임시*/
	@RequestMapping(value = "/FAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String family(@ModelAttribute ReservationBean rb) {
		ModelAndView mav=new ModelAndView();
		
		rb.setSCode("FAMILY");
		mav.setViewName("family");
		mav = res.entrance(rb);
		
		return mav.getViewName();
		

	}

}