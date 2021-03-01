package icy.aog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

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
	public String UPMINFORM(Model model) {
		String page = "upminform";
		return page;

	}

	@RequestMapping(value = "/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String REVIEW(Model model) {
		String page = "rescheck";
		return page;

	}

	@RequestMapping(value = "/BOOKMARKFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARKFORM(Model model) {
		String page = "bookmarkform";
		return page;

	}

	@RequestMapping(value = "/BOOKMARK", method = { RequestMethod.GET, RequestMethod.POST })
	public String BOOKMARK(Model model) {
		String page = "order.jsp";
		return page;

	}

	@RequestMapping(value = "/MYPAGEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String MYPAGEFORM(Model model) {
		String page = "mypageform";
		return page;

	}

	@RequestMapping(value = "/UPMINFO", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPMINFO(Model model) {
		String page = "upminfo";
		return page;

	}

	@RequestMapping(value = "/UPFAFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAFORM(Model model) {
		String page = "upfaform";
		return page;

	}

	@RequestMapping(value = "/UPFAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String UPFAMILY(Model model) {
		String page = "upfamily";
		return page;

	}

	@RequestMapping(value = "/RDETAIL", method = { RequestMethod.GET, RequestMethod.POST })
	public String RDETAIL(Model model) {
		String page = "rdetail";
		return page;

	}
	
	/*임시*/
	@RequestMapping(value = "/FAMILY", method = { RequestMethod.GET, RequestMethod.POST })
	public String family(Model model) {
		String page = "family";
		return page;

	}

}
