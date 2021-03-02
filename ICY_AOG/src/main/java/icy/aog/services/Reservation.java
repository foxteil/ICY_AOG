package icy.aog.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
	case "RESFROM":
		mav=resFromCtl(res);
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

	return null;
}
private ModelAndView cancleCtl(ReservationBean res) {
	
	return null;
}
private ModelAndView resCheckCtl( ReservationBean res) {
	
	return null;
}
private ModelAndView finishCtl( ReservationBean res) {
	
	return null;
}
private ModelAndView dateCheckCtl( ReservationBean res2) {
	
	return null;
}
private ModelAndView resFromCtl( ReservationBean res2) {
	
	return null;
}
private ModelAndView mapCtl( ReservationBean res) {

	return null;
}
private ModelAndView hDetailCtl( ReservationBean res) {
	
	return null;
}
private ModelAndView orderCtl(ReservationBean res) {

	return null;
}
private ModelAndView partCtl( ReservationBean res) {
	res.setHpCode("병원코드");
	
	
	mav.addObject("TEST",res.getHpCode());
	 mav.setViewName("part");
	System.out.println("a11d1d");
	return mav;
}
private ModelAndView lsearchCtl(ReservationBean res) {
	
	
	return  null;
}

}
