package icy.aog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import icy.aog.beans.ReservationBean;
import icy.aog.services.MyPage;

@Controller
public class MemberController {
	@Autowired 
	private MyPage MyPage;
	
	@RequestMapping(value = "/LSEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String LSEARCH(Model model) {
		String page = "start";
		return page;

	}

	@RequestMapping(value = "/RESCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESCHECK(Model model) {
		String page = "rescheck";
		return page;

	}
	
	@RequestMapping(value = "/PART", method = { RequestMethod.GET, RequestMethod.POST })
	public String PART(Model model) {
		String page = "start";
		return page;

	}

	@RequestMapping(value = "/ORDER", method = { RequestMethod.GET, RequestMethod.POST })
	public String ORDER(Model model) {
		String page = "order";
		return page;

	}

	@RequestMapping(value = "/HDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String HDETAIL(Model model) {
		String page = "hdetail";
		return page;

	}

	@RequestMapping(value = "/MAP", method = { RequestMethod.GET, RequestMethod.POST })
	public String MAP(Model model) {
		String page = "map";
		return page;

	}

	@RequestMapping(value = "/RESFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String RESFORM(Model model) {
		String page = "resform";
		return page;

	}

	@RequestMapping(value = "/DATECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String DATECHECK(Model model) {
		String page = "datecheck";
		return page;

	}

	@RequestMapping(value = "/FINISH", method = { RequestMethod.GET, RequestMethod.POST })
	public String FINISH(Model model) {
		String page = "finish";
		return page;

	}

	@RequestMapping(value = "/CANCLE", method = { RequestMethod.GET, RequestMethod.POST })
	public String CANCLE(Model model) {
		String page = "rescheck";
		return page;

	}

	@RequestMapping(value = "/SEARCH", method = { RequestMethod.GET, RequestMethod.POST })
	public String SEARCH(Model model) {
		String page = "search";
		return page;

	}

	@RequestMapping(value = "/UPMINFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFORM(Model model, ReservationBean rv) {
		rv.setSCode("UPMINFORM");
		System.out.println("확인");
		return MyPage.entrance(rv, model);

	}

	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(Model model, ReservationBean rv) {
		return MyPage.entrance(rv, model);

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(Model model, ReservationBean rv) {
		return MyPage.entrance(rv, model);

	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(Model model, ReservationBean rv) {
		return MyPage.entrance(rv, model);
	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(Model model, ReservationBean rv) {
		rv.setSCode("MYPAGEFORM");
		return MyPage.entrance(rv, model);

	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(Model model, ReservationBean rv) {
		return MyPage.entrance(rv, model);

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
