package icy.aog.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icy.aog.beans.Addr;
import icy.aog.beans.AuthBean;
import icy.aog.beans.Hospital;
import icy.aog.mapper.HospitalIF;

@Service
public class Admin {
	ModelAndView page = new ModelAndView();
	
	@Autowired
	private HospitalIF hpIF;
	@Autowired
	private Gson gson;
	
	public Admin() {}
	
	public ModelAndView entrance(Hospital hp,Model model) {
		System.out.println("entrance진입전");
		switch(hp.getSCode()){
		
			case "RESERVELIST": 
				page = resListCtl(hp,model);
				break;
			case "HPREVIEW":
				page = hpReview(hp,model);
				break;
			case "SETTINGFORM":
				page = settingCtl(hp,model);
				break;
			case "DRTIME":
				page = drtimeCtl(hp);
				break;
			case "SCHEDULEFORM":
				page = scheduleformCtl(hp,model);
				break;
			case "BREAK":
				page = breakCtl(hp);
				break;
			case "RELIST":
				page = relistCtl(hp);
				break;
			case "TEST":
				page = testCtl(hp);
				break;
			case "RESERVECHECK":
				page = reserveCtl(hp,model);
				break;
			case "DRINFO" : 
				page =DrInfoCtl(hp);
				break;
			case "HPINFO" : 
				page =hpInfoCtl(hp);
				break;
			case "RESCONFIRM": 
				page = confirmCtl(hp);	
				break;
			case "INSENROLLFORM":
			page=enrollCtl(hp);
			 	break;
			case "DELSTF":
			page=delstfCtl(hp);
				break;
			case "ROLL":
			page=rollCtl(hp);
				break;
			case "UPDATEDR":
				page=updatedrCtl(hp);
					break;
			case "UPDATEHP":
				page=updatehpCtl(hp);
				break;
			case "UPDATESTF":
				page=updatestfCtl(hp);
				break;
			case "SELDRIMG":
				page=seldrimgCtl(hp);
				break;
			case"HPINFOFORM":
				page=hpparkinfoCtl(hp);
				break;
			case"STFCHECK":
				page=stfcheckCtl(hp);
				break;
			case"REJECTU":
				page=cancleCtl(hp,model);
				break;
			case"HPSCCHANGE":
				page=hpscChangeCtl(hp,model);
				break;
			case "HPBREAK":
				page = hpBreakCtl(hp,model);
				break;
			case "SHOWDOC": 
				page = showdocCtl(hp,model);
				break;
			case "SHOWDOCTIME": 
				page = showdocTimeCtl(hp,model);
				break;
				
				
		}
		
		return page;
	}

	private ModelAndView showdocTimeCtl(Hospital hp, Model model) {
		System.out.println(hp.getDRSdrCode());
		String jsonData = gson.toJson(hpIF.docSchInfo(hp));
		String jData = gson.toJson(hpIF.getdrsDay(hp));
		System.out.println(jsonData);
		
//		model.addAttribute("getDrsDay", jData);
		page.addObject("aa",jData);
		page.addObject("drsInfo", jsonData);
		
		return page;
	}

	private ModelAndView showdocCtl(Hospital hp, Model model) {
		String jsonData = gson.toJson(hpIF.showDoc(hp));
		
		System.out.println(jsonData);
		page.addObject("DInfo",jsonData);
		return page;
	}

	private ModelAndView hpBreakCtl(Hospital hp, Model model) {
		
		for(int i=0;i<hp.getHpBrDay().length;i++) {
			System.out.println("hp.getHpBrDay["+i+"] : "+hp.getHpBrDay()[i]);
			hp.setHpBDay(hp.getHpBrDay()[i]);
			
			hpIF.upHpBreak(hp);
		}
		
		String a =hpIF.selHpBreak(hp);
		System.out.println(a);
		if(a.equals("B")) {
			page.addObject("msg","휴진 설정 완료");
		}else {
			page.addObject("msg","휴진 설정 실패~");
		}
		return page;
	}

	private ModelAndView hpscChangeCtl(Hospital hp, Model model) {
		String jData = gson.toJson(hpIF.getDrs(hp));
		page.addObject("scChange",jData);
		model.addAttribute("scchage",jData);
		page.setViewName("hpscchangeT");
		return page;
	}

	private ModelAndView cancleCtl(Hospital hp, Model model) {
		System.out.println("hp.getFAJUMIN :"+hp.getFAJUMIN());
	   	System.out.println("hp.getDrCode :"+hp.getDrCode());
	   	System.out.println("hp.getHpCode :"+hp.getHpCode());
	   	System.out.println("hp.getTMCODE :"+hp.getTMCODE());
	   	
		
	   if(hpIF.upReserveC(hp)==1) {
		   model.addAttribute("msg","진료 예약을 승인하셨습니다.");
		   page.addObject("msg2","예약 거절 완료");
	   }
	   	
	   	return page;
	}

	private ModelAndView reserveCtl(Hospital hp, Model model) {
		System.out.println("hp.getFAJUMIN :"+hp.getFAJUMIN());
	   	System.out.println("hp.getDrCode :"+hp.getDrCode());
	   	System.out.println("hp.getHpCode :"+hp.getHpCode());
	   	System.out.println("hp.getTMCODE :"+hp.getTMCODE());
	   	
		
	   if(hpIF.upReserve(hp)==1) {
		   model.addAttribute("msg","진료 예약을 승인하셨습니다.");
		   page.addObject("msg2","예약 승인 완료");
	   }
	   	
	   	return page;
	}

	private ModelAndView delstfCtl(Hospital hB) {
		System.out.println("직원지우기진입");
		if(this.delstf(hB)==1) {
			System.out.println("지우기 성공");
		}
		return null;
	}
private ModelAndView stfcheckCtl(Hospital hB) {
		System.out.println("체크");
		if(this.idcheck(hB)==1) {
		System.out.println("체크성공");
		}else {
			System.out.println("실패");
		}
		page.setViewName("adminstart");
		return page;
	}
private ModelAndView updatestfCtl(Hospital hB) {
		System.out.println("스태프정보 변경");
	   System.out.println(hB.getHpCode());
	   System.out.println(hB.getStfCode());
	   System.out.println(hB.getStfRank());
		if(this.upstf(hB)==1) {
			System.out.println("업데이트 완료");
		}
		page.setViewName("adminstart");		
		return page;
	}
private ModelAndView updatehpCtl(Hospital hB) {
		
	System.out.println("asdasdasd");
	 if(this.uphpimg(hB)==1) {
		 System.out.println("updete업로드");
	 }
		page.setViewName("adminstart");
		return page;
	}
private ModelAndView hpparkinfoCtl(Hospital hB) {
		System.out.println("주차 확인");	
		System.out.println(hB.getHpCode());
		System.out.println(hB.getHpPark());
		System.out.println(this.uppark(hB));
		if(this.uppark(hB)==1) {
		System.out.println("update성공");
		}
		
		page.setViewName("adminstart");
		return page;
	}
private ModelAndView seldrimgCtl(Hospital hB) {
		System.out.println("의사이미지");
		page.addObject("selimg",gson.toJson(this.selimg(hB)));
		page.setViewName("adminstart");
		
		return null;
	}

private ModelAndView updatedrCtl(Hospital hB) {
		System.out.println("의사 사진변경");
		page.setViewName("adminstart");
		return page;
	}
//직원등록
private ModelAndView rollCtl(Hospital hB) {
		System.out.println("직원등록  진입");	
		System.out.println(this.insStaff(hB));
		page.setViewName("adminstart");
		return page;
	}



//직원등록
	private ModelAndView enrollCtl(Hospital hB) {					
		page.addObject("selstf",gson.toJson(this.selstf(hB)));		
		page.setViewName("adminstart");		
		return page;
	}
//예약 확인 거절
	private ModelAndView checkCtl(Hospital hB) {
		
		return page;
	}
//예약승인 접수 거절 
	private ModelAndView confirmCtl(Hospital hB) {
		
		return page;
	}
// 병원사진등록 
	private ModelAndView hpInfoCtl(Hospital hB) {
		System.out.println("병원변경 진입");
		page.addObject("selhp",gson.toJson(this.selhp(hB)));
		page.setViewName("adminstart");
		return page;
	}
	//의사정보 추가 변경 삭제 
	private ModelAndView DrInfoCtl(Hospital hB) {
	System.out.println("의사정보진입");
		page.addObject("seldr",gson.toJson(this.seldr(hB)));
		page.setViewName("adminstart");
		return page;
	}	
	//의사이미지 정보
	private ArrayList<Hospital>selimg(Hospital hp){
		return hpIF.upHp(hp);
	}
	//병원사진 변경
	private ArrayList<Hospital>upHp(Hospital hp){
		return hpIF.upHp(hp);
	}
	//의사 정보 변경
	private ArrayList<Hospital>upDr(Hospital hp){
		return hpIF.upDr(hp);
	}
	//의사정보 삭제
	private ArrayList<Hospital>delDr(Hospital hp){
		return hpIF.delDr(hp);
	}
	//의사정보 추가
	private ArrayList<Hospital>insDr(Hospital hp){
		return hpIF.insDr(hp);
	}
	//직원등록
	private int insStaff(Hospital hp){		
		return hpIF.insStaff(hp);
	}
	//병원 주차변경
	private int uppark(Hospital hp) {
		return hpIF.uppark(hp);
	}
	// 직원정보 변경
	private int upstf(Hospital hp) {
		return hpIF.upstf(hp);
	}
	//병원 사진변경
	private int uphpimg(Hospital hp) {
		return hpIF.uphpimg(hp);
	}
	//직원정보 
	private ArrayList<Hospital>selstf(Hospital hp){
		return hpIF.selstf(hp);
	}
	//병원정보
	private ArrayList<Hospital>selhp(Hospital hp){
		return hpIF.selhp(hp);
	}
	//닥터정보
	private ArrayList<Hospital>seldr(Hospital hp){
		return hpIF.seldr(hp);
	}
	// 직원지우기 
	private  int delstf(Hospital hp) {
		return hpIF.delstf(hp);
	}
	private int idcheck(Hospital hp) {
		return hpIF.idcheck(hp);
	}

	private ModelAndView relistCtl(Hospital hp) {
		
		page.addObject("data",gson.toJson(this.getReList(hp)));
		System.out.println(gson.toJson(this.getReList(hp)));
		return page;
	}


	private ModelAndView testCtl(Hospital hp) {
		page.addObject("testajax",gson.toJson(hpIF.getDr(hp)));
		System.out.println(gson.toJson(hpIF.getDr(hp)));
		
		return page;
	}

	private ModelAndView breakCtl(Hospital hp) {
		
		page.addObject("Info", "휴진");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView scheduleformCtl(Hospital hp,Model model) {
		
		String rList = gson.toJson(this.getDrs(hp));
		
		model.addAttribute("aHpCode",hp.getHpCode());
		model.addAttribute("rList",rList);
		
		page.setViewName("adminstart_hpschedule");
		System.out.println(rList);
		return page;
	}

	private ModelAndView drtimeCtl(Hospital hp) {
		page.addObject("Info", "의사시간");
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView settingCtl(Hospital hp,Model model) {
		page.addObject("Info", "기본설정");
		
		model.addAttribute("aHpCode",hp.getHpCode());
		
		
		page.setViewName("adminstart");
		return page;
	}

	private ModelAndView hpReview(Hospital hp,Model model) {
		
		String rlist ;
		rlist= gson.toJson(this.getReview(hp));
		

		model.addAttribute("rList",rlist);
		model.addAttribute("aHpCode",hp.getHpCode());
		page.setViewName("adminstart_review");
		
		return page;
	}

	private ModelAndView resListCtl(Hospital hp,Model model) {
		
		System.out.println(hp.getHpCode());
		page.addObject("rList",gson.toJson(this.getDate(hp)));
		
		return page;
	}
	
	
	
	private ArrayList<Hospital> getDate(Hospital hp) {
		System.out.println(hp.getDrCode());
		return hpIF.getDate(hp);
	}
	
	private ArrayList<AuthBean> getReserver(Hospital hp) {
		System.out.println(hp.getDrCode());
		return hpIF.getReserver(hp);
	}
	private ArrayList<Hospital> getReview(Hospital hp) {
		
		return hpIF.getReview(hp);
	}
	private ArrayList<Hospital> getDrs(Hospital hp){
		return hpIF.getDrs(hp);
	}
	private ArrayList<Hospital> getReList(Hospital hp){
		System.out.println(hp.getHpCode());
		System.out.println(hp.getTMCODE());
		return hpIF.getReList(hp);
	}
	
}
