package icy.aog.services;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;


import icy.aog.beans.ReservationBean;
import icy.aog.mapper.ReservationIF;



@Service
public class Reservation {
public Reservation() {

}
@Autowired
private Gson gson;
@Autowired
private ReservationIF ResIF;
ModelAndView mav =new ModelAndView() ;


public ModelAndView entrance (ReservationBean res,Model model) {
	ModelAndView mav=null;
	switch (res.getSCode()) {
	case "LSEARCH":
		mav= lsearchCtl(res,model);
		break;
	case "GU":
		mav= guCtl(res,model);
		break;
	case "DONG":
		mav=dongCtl(res,model);
	case "PART":
		mav=partCtl(res,model);
		break;
	case "ORDER":		
		mav=orderCtl(res,model);
		break;
	case "HDETAIL":
		mav=hDetailCtl(res,model);
		break;
	case "MAP":
		mav=mapCtl(res,model);
		break;
	case "RESFROM":
		mav=resFromCtl(res,model);
		break;
	case "DATECHECK":
		mav=dateCheckCtl(res,model);
		break;
	case "FINISH":
		mav=finishCtl(res,model);
		break;
	case "RESCHECK":
		mav=resCheckCtl(res,model);
		break;
	case "CANCLE":
		mav=cancleCtl(res,model);
		break;
	case "SEARCH":
		mav=searchCtl(res,model);
		break;

	}
	
	return   mav;
	
}

private ModelAndView guCtl(ReservationBean res, Model model) {
	String local= "%";
	local+=res.getAddr();
	local +=" %";
	res.setAddr(local);
	
	res.setSCode("GU");
	mav.addObject("guInfo",this.lsearchInfo(res));
	String jsonData=gson.toJson(mav.getModel().get("guInfo"));
	mav.addObject("guInfo", jsonData);
	System.out.println(jsonData);
	mav.setViewName("start");
	return mav;
	
	
}




private ModelAndView dongCtl(ReservationBean res, Model model) {
	// TODO Auto-generated method stub
	return null;
}


private ModelAndView searchCtl( ReservationBean res,Model model) {
	res.setSCode("SEARCH");
	mav.setViewName("order");
	
	return mav;
}
private ModelAndView cancleCtl(ReservationBean res,Model model) {
	res.setSCode("CANCLE");
	mav.setViewName("rescheck");
	return mav;
}
private ModelAndView resCheckCtl( ReservationBean res,Model model) {
	res.setSCode("RESCHECK");
	mav.setViewName("rescheck");
	return mav;
}
private ModelAndView finishCtl( ReservationBean res,Model model) {
	res.setSCode("FINISH");
	mav.addObject("rInfo", this.insReserve(res));
	String jsonData =gson.toJson(mav.getModel().get("rInfo"));
	model.addAttribute("rInfo", jsonData);
	
	mav.setViewName("finish");
	return mav;
	
}

private ModelAndView dateCheckCtl( ReservationBean res,Model model) {
	res.setSCode("DATECHECK");
	mav.setViewName("resform");
	return mav;
}
private ModelAndView resFromCtl( ReservationBean res,Model model) {
	res.setSCode("RESFORM");
	mav.addObject("rfInfo",this );
	mav.setViewName("resform");
	return mav;
}
private ModelAndView mapCtl( ReservationBean res,Model model) {
	res.setSCode("MAP");
	mav.setViewName("map");
	return mav;
}
private ModelAndView hDetailCtl( ReservationBean res,Model model) {
	
	res.setSCode("HDETAIL");
	mav.addObject("hdInfo",this.selhpInfo(res));
	String jsonData =gson.toJson(mav.getModel().get("hdInfo"));
	model.addAttribute("hdInfo", jsonData);
	mav.setViewName("hdetail");
	System.out.println(jsonData);
	
	return mav;
}

private ModelAndView orderCtl(ReservationBean res,Model model) {
	res.setSCode("ORDER");
	mav.addObject("oInfo", this.getSearchInfo(res));
	String jsonData =gson.toJson(mav.getModel().get("oInfo"));
	model.addAttribute("oInfo",jsonData);
	mav.setViewName("order");
	System.out.println(jsonData);
	
	return mav;
}


private ModelAndView partCtl( ReservationBean res,Model model) {
	res.setSCode("PART");
	mav.setViewName("start");
	
	return mav;
}
private ModelAndView lsearchCtl(ReservationBean res,Model model) {
	String local= "%";
	local+=res.getAddr();
	local +="%";
	res.setAddr(local);
	
	res.setSCode("PART");
	mav.addObject("lsinfo",this.lsearchInfo(res));
	String jsonData=gson.toJson(mav.getModel().get("lsinfo"));
	mav.addObject("lsinfo", jsonData);
	System.out.println(jsonData);
	mav.setViewName("start");
	return mav;
}

private ArrayList<ReservationBean> getSearchInfo(ReservationBean rb) {

	
	
	System.out.println(rb.getAddr());
	System.out.println(rb.getPaCode());
	
	
	return ResIF.getSearchInfo(rb);
}
private int insReserve(ReservationBean rb) {
	
	return ResIF.insReserve(rb);
}

private ArrayList<ReservationBean> selhpInfo(ReservationBean rb) {
	System.out.println(rb.getHpCode());
	System.out.println(rb.getHpName());
	
	return ResIF.selhpInfo(rb);
}


private ArrayList<ReservationBean> lsearchInfo(ReservationBean rb){
	return ResIF.lsearchInfo(rb);
	
}

}
