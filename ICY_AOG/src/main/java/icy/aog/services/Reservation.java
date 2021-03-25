package icy.aog.services;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import icy.aog.beans.ReservationBean;
import icy.aog.mapper.ReservationIF;

<<<<<<< HEAD
@Service
public class Reservation {
public Reservation() {

}
ModelAndView mav =new ModelAndView() ;


public ModelAndView entrance (ReservationBean rb) {
	ModelAndView mav=null;
	switch (rb.getSCode()) {
	case "LSEARCH":
		mav= lsearchCtl(rb);
		break;
	case "PART":
		mav=partCtl(rb);
		break;
	case "ORDER":
		mav=orderCtl(rb);
		break;
	case "HDETAIL":
		mav=hDetailCtl(rb);
		break;
	case "MAP":
		mav=mapCtl(rb);
		break;
	case "RESFROM":
		mav=resFromCtl(rb);
		break;
	case "DATECHECK":
		mav=dateCheckCtl(rb);
		break;
	case "FINISH":
		mav=finishCtl(rb);
		break;
	case "RESCHECK":
		mav=resCheckCtl(rb);
		break;
	case "CANCLE":
		mav=cancleCtl(rb);
		break;
	case "SEARCH":
		mav=searchCtl(rb);
		break;
		
	}
	
	return   mav;
	
}
private ModelAndView searchCtl(ReservationBean rb) {

	return null;
}
private ModelAndView cancleCtl(ReservationBean rb) {
	
	return null;
}
private ModelAndView resCheckCtl( ReservationBean rb) {
	
	return null;
}
private ModelAndView finishCtl( ReservationBean rb) {
	
	return null;
}
private ModelAndView dateCheckCtl( ReservationBean rb) {
	
	return null;
}
private ModelAndView resFromCtl( ReservationBean rb) {
	
	return null;
}
private ModelAndView mapCtl(ReservationBean rb) {

	return null;
}
private ModelAndView hDetailCtl(ReservationBean rb) {
	
	return null;
}
private ModelAndView orderCtl(ReservationBean rb) {

	return null;
}
private ModelAndView partCtl(ReservationBean rb) {
	rb.setHpCode("병원코드");
	
	
	mav.addObject("TEST",rb.getHpCode());
	 mav.setViewName("part");
	System.out.println("a11d1d");
	return mav;
}
private ModelAndView lsearchCtl(ReservationBean rb) {
=======


@Service
public class Reservation {
public Reservation() {

}
@Autowired
private Gson gson;
@Autowired
private ReservationIF ResIF;
@Autowired
private PlatformTransactionManager tran;
ModelAndView mav =new ModelAndView() ;


public ModelAndView entrance (ReservationBean res,Model model) {
	ModelAndView mav=null;
	switch (res.getSCode()) {

	case "ORDER":		
		mav=orderCtl(res,model);
		break;
	case "HDETAIL":
		mav=hDetailCtl(res,model);
		break;
	case "MAP":
		mav=mapCtl(res,model);
		break;
	case "RESFORM":
		mav=resFormCtl(res,model);
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
	case "START":
		mav = startCtl(res,model);
		break;
	case "GU":
		mav=guCtl(res,model);
		break;
	case "GU2":
		mav=guCtl2(res,model);
		break;
	case "GETTIME":
		mav=getTimeCtl(res,model);
		break;
	}
	
	return mav;
	
}


private ModelAndView startCtl(ReservationBean res, Model model) {
	
	res.setSCode("START");
	System.out.println("진입??");
	//System.out.println(res.getSiNum());
	//mav.addObject("Isinfo", this.lsearchInfo(res));

	String jsonData=gson.toJson(mav.getModel().get("lsinfo"));
	mav.addObject("lsinfo", jsonData);
	//System.out.println(jsonData);
	mav.setViewName("start");
	return mav;
	

}

private ModelAndView guCtl(ReservationBean res, Model model) {

	res.setSCode("GU");
	String jsonData=gson.toJson(this.gSearchInfo(res));
	mav.addObject("guInfo", jsonData);
	//System.out.println(jsonData);
	mav.setViewName("start");

	return mav;
	
	
}

private ModelAndView guCtl2(ReservationBean res, Model model) {

	res.setSCode("GU2");
	String jsonData= gson.toJson(this.getPostInfo(res));
	mav.addObject("poInfo", jsonData);
//System.out.println(jsonData);
	mav.setViewName("start");

	return mav;
	
	
}


private ModelAndView searchCtl( ReservationBean res,Model model) {
	res.setSCode("SEARCH");
	mav.setViewName("order");
	
	return mav;
}
<<<<<<< HEAD
private ModelAndView cancleCtl(ReservationBean res,Model model) {
	res.setSCode("CANCLE");
	mav.setViewName("rescheck");
	return mav;
}
private ModelAndView resCheckCtl( ReservationBean res,Model model) {
	model.addAttribute("IdInfo",res.getId());
	res.setSCode("RESCHECK");
	mav.setViewName("rescheck");
	return mav;
}
private ModelAndView finishCtl( ReservationBean res,Model model) {
=======
private ModelAndView lsearchCtl(ReservationBean res) {
>>>>>>> branch 'master' of https://github.com/foxteil/ICY_AOG
>>>>>>> refs/remotes/origin/yeoni
	
	
	res.setSCode("FINISH");
	  this.insReserve(res);
	
	
	 String jsonData = gson.toJson(this.selReserve(res));
	 
	 model.addAttribute("IdInfo",res.getId());
	 model.addAttribute("reCode", res.getResCode());
	 
	mav.addObject("getRes", jsonData);
	  
	mav.setViewName("finish");
	return mav;
	
}

private ModelAndView dateCheckCtl( ReservationBean res,Model model) {
	res.setSCode("DATECHECK");
	mav.setViewName("resform");
	return mav;
}
private ModelAndView resFormCtl( ReservationBean res,Model model) {
	System.out.println("resFormCtl 안으로 진입");
	System.out.println(res.getHpCode());


	model.addAttribute("idInfo", res.getId());
	model.addAttribute("hpCode", res.getHpCode());
	model.addAttribute("tmCode", res.getTmCode());
	model.addAttribute("paCode", res.getPaCode());

	//mav.addObject("timeInfo", this.resTimeInfo(res));
	String jsonData = gson.toJson(this.resformInfo(res));
	String jsonData2 = gson.toJson(this.getFamily(res));
	String jsonData3 = gson.toJson(this.getDrsInfo(res));
	String jsonData4 = gson.toJson(this.getDrsTime(res));
	String jsonData5 = gson.toJson(this.getDrPAInfo(res));



	//String json = gson.toJson(mav.getModel().get("timeInfo"));
	
	mav.addObject("dpInfo", jsonData5);
	mav.addObject("dtInfo",jsonData4);
	System.out.println(jsonData4);
	mav.addObject("dInfo",jsonData3);
	mav.addObject("fInfos",jsonData2);
	mav.addObject("rfInfo", jsonData);
	//mav.addObject("timeInfo",json);
	mav.setViewName("resform");
	
	System.out.println("hpCode: "+res.getHpCode());

	

	return mav;
}
private ModelAndView getTimeCtl(ReservationBean res, Model model) {
	res.setSCode("GETTIME");
	System.out.println("????????와?");
	System.out.println(res.getDrsDate());


	String jsonData6 = gson.toJson(this.getTimecheck(res));
	
	model.addAttribute("dTime", jsonData6);
	
	mav.setViewName("restime");

	return mav;
}




private ArrayList<ReservationBean> getDrsInfo(ReservationBean rb) {
	 
	return ResIF.getDrsInfo(rb);
}

private ModelAndView mapCtl( ReservationBean res,Model model) {
	res.setSCode("MAP");
	mav.addObject("mapInfo",this.mapInfo(res));
	String jsonData =gson.toJson(mav.getModel().get("mapInfo"));
	model.addAttribute("mapInfo", jsonData);
	mav.setViewName("map");
	
	return mav;
}
private ModelAndView hDetailCtl( ReservationBean res,Model model) {
	
	
	String jsonData =gson.toJson(this.selhpInfo(res));

	model.addAttribute("idInfo", res.getId());
	mav.addObject("hdInfo", jsonData);
	mav.setViewName("hdetail");
	System.out.println(jsonData);
	
	return mav;
}

private ModelAndView orderCtl(ReservationBean res,Model model) {
	
	
	String jsonData =gson.toJson( this.getSearchInfo(res));
	String jsonData2 =gson.toJson(this.getbookmark(res));
	
	
	model.addAttribute("idInfo", res.getId());
	mav.addObject("oInfo",jsonData);
	mav.addObject("bInfo", jsonData2);

	mav.setViewName("order");

	return mav;
}



private ArrayList<ReservationBean> getSearchInfo(ReservationBean rb) {
	System.out.println(rb.getGuName());
	
	return ResIF.getSearchInfo(rb);
}

private int insReserve(ReservationBean rb) {
	
	return ResIF.insReserve(rb);
}

private ArrayList<ReservationBean> selhpInfo(ReservationBean rb) {
//System.out.println(rb.getId());
	return ResIF.selhpInfo(rb);
}



private ArrayList<ReservationBean> mapInfo(ReservationBean rb){
	return ResIF.mapInfo(rb);
}
private  ArrayList<ReservationBean> resformInfo(ReservationBean rb){
	//System.out.println("첫");
	// System.out.println(rb.getId());
	 return ResIF.resformInfo(rb);

}
private ArrayList<ReservationBean> getFamily(ReservationBean rb) {
//	System.out.println("둘");
//	System.out.println(rb.getId());
	
	return ResIF.getFamily(rb);
	
}
private ArrayList<ReservationBean> getDrsTime(ReservationBean rb){
	
	
	return ResIF.getDrsTime(rb);
}
private ArrayList<ReservationBean> gSearchInfo(ReservationBean rb) {
	// TODO Auto-generated method stub
	return ResIF.gSearchInfo(rb);
}
private ArrayList<ReservationBean> getPostInfo(ReservationBean rb){
	
	//System.out.println(rb.getGuName());
	return ResIF.getPostInfo(rb);
}
private ArrayList<ReservationBean> getbookmark(ReservationBean rb){
	
	return ResIF.getbookmark(rb);
}
private ArrayList<ReservationBean>getDrPAInfo(ReservationBean rb){
	return ResIF.getDrPAInfo(rb);
}

private ArrayList<ReservationBean> getTimecheck(ReservationBean rb){

	return ResIF.getTimecheck(rb);
}
private ArrayList<ReservationBean> selReserve(ReservationBean rb){
	return ResIF.selReserve(rb);
}
}
