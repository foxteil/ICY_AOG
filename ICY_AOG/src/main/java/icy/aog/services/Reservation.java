package icy.aog.services;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.ReservationBean;

@Service
public class Reservation {
public Reservation() {

}
ModelAndView mav =new ModelAndView() ;


public ModelAndView entrance (ReservationBean res) {
	ModelAndView mav=null;
	switch (res.getSCode()) {
	case "LSEARCH":
		mav= lsearchCtl(res);
		break;
	case "PART":
		mav=partCtl(res);
		break;
	case "ORDER":
		mav=orderCtl(res);
		break;
	case "HDETAIL":
		mav=hDetailCtl(res);
		break;
	case "MAP":
		mav=mapCtl(res);
		break;
	case "RESFORM":
		mav=resFormCtl(res);
		break;
	case "DATECHECK":
		mav=dateCheckCtl(res);
		break;
	case "FINISH":
		mav=finishCtl(res);
		break;
	case "RESCHECK":
		mav=resCheckCtl(res);
		break;
	case "CANCLE":
		mav=cancleCtl(res);
		break;
	case "SEARCH":
		mav=searchCtl(res);
		break;
		
	}
	
	return   mav;
	
}
private ModelAndView searchCtl( ReservationBean res) {
	res.setSCode("SEARCH");
	mav.setViewName("order");
	return mav;
}
private ModelAndView cancleCtl(ReservationBean res) {
	res.setSCode("CANCLE");
	mav.setViewName("rescheck");
	return mav;
}
private ModelAndView resCheckCtl( ReservationBean res) {
	res.setSCode("RESCHECK");
	mav.setViewName("rescheck");
	return mav;
}
private ModelAndView finishCtl( ReservationBean res) {
	res.setSCode("FINISH");
	mav.setViewName("finish");
	return mav;
}
private ModelAndView dateCheckCtl( ReservationBean res) {
	res.setSCode("DATECHECK");
	mav.setViewName("resform");
	return mav;
}
private ModelAndView resFormCtl( ReservationBean res) {
	res.setSCode("RESFORM");
	mav.setViewName("resform");
	return mav;
}
private ModelAndView mapCtl( ReservationBean res) {
	res.setSCode("MAP");
	mav.setViewName("map");
	return mav;
}
private ModelAndView hDetailCtl( ReservationBean res) {
	res.setSCode("HDETAIL");
	mav.setViewName("hdetail");
	return mav;
}
private ModelAndView orderCtl(ReservationBean res) {
	System.out.println("ORDER");
	res.setSCode("ORDER");
	mav.setViewName("order");
	return mav;
}
private ModelAndView partCtl( ReservationBean res) {
	res.setSCode("PART");
	mav.setViewName("start");
	return mav;
}
private ModelAndView lsearchCtl(ReservationBean res) {
	res.setSCode("PART");
	mav.setViewName("start");
	return mav;
}

}
