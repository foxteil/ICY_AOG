package icy.aog.services;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icy.aog.beans.ReservationBean;
import icy.aog.mapper.MypageIF;

@Service
public class MyPage {
	ModelAndView mav = new ModelAndView();

	public MyPage() {
	}

	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private MypageIF mypage;
	@Autowired
	private Gson gson;

	public ModelAndView entrance(ReservationBean rv, Model model) {

		switch (rv.getSCode()) {
		case "UPMINFORM":
			mav = upMInformCtl(rv, model);
			break;
		case "REVIEW":
			mav = reviewCtl(rv, model);
			break;
		case "BOOKMARKFORM":
			mav = bookFormCtl(rv, model);
			break;
		case "BOOKMARK":
			mav = bookMarkCtl(rv, model);
			break;
		case "MYPAGEFORM":
			mav = myPageCtl(rv, model);
			break;
		case "UPMINFO":
			mav = upMInfoCtl(rv, model);
			break;
		case "UPFAFORM":
			mav = upfaFormCtl(rv, model);
			break;
		case "UPFAMILY":
			mav = upFamilyCtl(rv, model);
			break;
		case "RDETAIL":
			mav = RDetailCtl(rv, model);
			break;
		case "PWCONFIRM":
			mav = pwConfirmCtl(rv, model);
			break;
		case "FAMILY":
			mav = familyCtl(rv, model);
			break;
		case "DELFAMILY":
			mav = delfamilyCtl(rv, model);
			break;
		case "PWFORM":
			mav = pwFormtCtl(rv, model);
			break;
		case "LIST":
			mav = listCtl(rv, model);
			break;
			/*임시로추가*/
		case "RESCHECK":
			mav=resCheckCtl(rv,model);
			break;

		}
		return mav;
	}

	private ModelAndView resCheckCtl(ReservationBean rv, Model model) {
		String reList = new String();
		System.out.println("reList");
		reList = makeHtml7(this.ReList(rv));
		model.addAttribute("reList", reList);
		System.out.println(reList);
		mav.setViewName("rescheck");
		
		return mav;
	}

	private String makeHtml7(ArrayList<ReservationBean> reList) {
		StringBuffer sb = new StringBuffer();
		System.out.println("makeHtml진입");
		int i = 0;
		sb.append("<div class=\"reserve-title\">");
   	    sb.append("<h1 class=\"finish_title\" >");
		sb.append("<label style=\"position: relative; bottom: 17px;\">예약리스트</label>");
		sb.append("</h1>");
		sb.append("</div>");
		for(i=0;i<reList.size();i++) {
		sb.append("<div class=\"hp-reserve\">");
		sb.append("<div class=\"check\">");
		sb.append("<label class=\"check_info\">진행상황</label>"); 
		sb.append("<label class=\"check_content\">"+reList.get(i).getStName()+"</label>");
		sb.append("</div>");
		sb.append("<div class=\"check\">");
		sb.append("<label class=\"check_info\">병 원</label>"); 
		sb.append("<label class=\"check_content\">"+reList.get(i).getHpName()+"</label>");
		sb.append("</div>");
		sb.append("<div class=\"check\">");
		sb.append("<label class=\"check_info\">예약일</label>"); 
		sb.append("<label class=\"check_content\">"+reList.get(i).getDrsDate()+"</label>");
		sb.append("</div>");
		sb.append("<div class=\"check\">");
		sb.append("<label class=\"check_info\">예약시간</label>"); 
		sb.append("<label class=\"check_content\">"+reList.get(i).getTStart()+"~"+reList.get(i).getTEnd()+"</label>");
		sb.append("</div>");
		if(reList.get(i).getDrName()!=null) {
		sb.append("<div class=\"check\">");
		sb.append("<label class=\"check_info\">선생님(진료과목)</label>"); 
		sb.append("<label class=\"check_content\">"+reList.get(i).getDrName()+"("+reList.get(i).getPaName()+")"+"</label>");
		sb.append("</div>");
		}
		sb.append("<div class=\"check\">");
		sb.append("<label class=\"check_info\">대상</label>"); 
		sb.append("<label class=\"check_content\">"+reList.get(i).getName()+"</label>");
		sb.append("</div>");
		if(reList.get(i).getStcode().equals("T")) {
		sb.append("<button class=\"res_btn\" id=\"REVIEW\" onclick=\"review('"+reList.get(i).getReCode()+"')\">후기작성</button>");
		}if(reList.get(i).getStcode().equals("G")) {
		sb.append("<button class=\"res_btn\">작성완료</button>");
		}if(reList.get(i).getStcode().equals("R")){
		sb.append("<button class=\"res_btn\" id=\"REINFO\" onclick=\"del('"+reList.get(i).getReCode()+"')\">예약 취소</button>");
		}if(reList.get(i).getStcode().equals("C")){
		sb.append("<button class=\"res_btn\" id=\"REINFO\" onclick=\"del('"+reList.get(i).getReCode()+"')\">예약 취소</button>");
		}else {
			
		}
		sb.append("</div>");
		}
		return sb.toString();
	}

	private ModelAndView listCtl(ReservationBean rv, Model model) {
		String bkHpList = new String();
		
		System.out.println(this.isNull(rv));
		rv.setHpName(rv.getHpName());
		rv.setHpPhone(rv.getHpPhone());
		rv.setPaName(rv.getPaName());
		rv.setHpCode(rv.getHpCode());
		rv.setHpName(rv.getHpName());
		System.out.println(this.isNull(rv).get(0).getHpName());
		System.out.println(this.isNull(rv).get(0).getHpCode());
		System.out.println(this.isNull(rv).get(0).getHpAddr());
		System.out.println(this.isNull(rv).get(0).getHpPhone());
		System.out.println(this.isNull(rv).get(0).getPaName());
		

		bkHpList = makeHtml2(this.isNull(rv));
		model.addAttribute("hpList", bkHpList);

		mav.setViewName("test");
		return mav;
	}

	private String makeHtml2(ArrayList<ReservationBean> hpList) {
		StringBuffer sb = new StringBuffer();
		System.out.println("makeHtml진입");
		int i = 0;
		for (i = 0; i < hpList.size(); i++) {
			sb.append("<div class=\"span-hplist\" id=\"info" + i + "\">");
			sb.append("<div id=\"RESFORM\" class=\"info" + i + "\" onclick=\"order(this)\">");
			if (hpList.get(i).getBkList() != null) {
				sb.append("<div>북마크O</div>");
				}else {
					sb.append("<div>북마크x</div>");
				}
			if (hpList.get(i).getHpCode() != null) {
				sb.append("<div>가입O</div>");
				sb.append("<div class=\"hppart\">" + hpList.get(i).getPaName() + "</div>");
				}
			else {
				sb.append("<div>가입X</div>");
			}
			sb.append("<div class=\"hpname\">" + hpList.get(i).getHpName() + "</div>");
			sb.append("<div class=\"hpphone\">" + hpList.get(i).getHpPhone() + "</div>");
			sb.append("<div class=\"hpphone\">" + hpList.get(i).getHpAddr() + "</div>");
			sb.append("</div>");
			sb.append("</div>");
		}
		return sb.toString();
	}

	private ModelAndView pwFormtCtl(ReservationBean rv, Model model) {
		mav.addObject("pwInfo", this.pwSelect(rv));
		String jsonData = gson.toJson(mav.getModel().get("pwInfo"));
		mav.addObject("pwInfo", jsonData);
		System.out.println(jsonData);
		return mav;
	}

	private ModelAndView delfamilyCtl(ReservationBean rv, Model model) {
		this.delFamily(rv);
		rv.setJumin(rv.getJumin());
		mav.addObject("delfaInfo", this.isFamily(rv));
		String jsonData = gson.toJson(mav.getModel().get("delfaInfo"));
		mav.addObject("delfaInfo", jsonData);
		System.out.println(jsonData);
		return mav;
	}

	private ModelAndView familyCtl(ReservationBean rv, Model model) {
		

		mav.setViewName("family");
		return mav;
	}

	private ModelAndView pwConfirmCtl(ReservationBean rv, Model model) {
		System.out.println("비밀번호");
		
		System.out.println(rv.getId());
		mav.addObject("Pw", this.isPassword(rv));
		String jsonData = gson.toJson(mav.getModel().get("Pw"));
		System.out.println(jsonData);
		// mav.addObject("Info",jsonData);
		mav.addObject("Pw", jsonData);
		// model.addAttribute("Info",jsonData);
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upMInformCtl(ReservationBean rv, Model model) {
		System.out.println("확인");
	
		mav.addObject("Info", this.isMember(rv));
		String jsonData = gson.toJson(mav.getModel().get("Info"));
		System.out.println("upMinformCtl jsonData: "+jsonData);
		mav.addObject("Info", jsonData);
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView reviewCtl(ReservationBean rv, Model model) {
		if(rv.getRCode().equals("getReview")) {
		System.out.println(rv.getRCode());	
			String rvList = new String();
			System.out.println("제대로");
			System.out.println(this.rvInfo(rv));
			rvList = makeHtml3(this.rvInfo(rv));
			model.addAttribute("rvList", rvList);
			mav.setViewName("hpreview");
		}if(rv.getRCode().equals("insReview")){
			System.out.println(rv.getRCode());
			System.out.println(rv.getRComment());
			System.out.println(rv.getGrade());
			
			
			rv.setReCode(rv.getReCode());
			System.out.println(rv.getReCode());
			System.out.println(rv.getId());
			this.insReview(rv);
			this.updStCode(rv);
			mav.setViewName("start");
		}if(rv.getRCode().equals("rvForm")){
			String rvForm = new String();
			System.out.println("웩");
			
			rv.setReCode(rv.getReCode());
			System.out.println(rv.getReCode());
			System.out.println(rv.getId());
			rvForm = makeHtml4(this.mrvInfo(rv));
			model.addAttribute("rvForm", rvForm);
			mav.setViewName("reviewForm");
		}if(rv.getRCode().equals("myReview")) {
			String myReview = new String();
			System.out.println("내가쓴리뷰모아보기");
			
			rv.setReCode(rv.getReCode());
			System.out.println(rv.getReCode());
			System.out.println(rv.getId());
			myReview = makeHtml6(this.myReview(rv));
			model.addAttribute("rvList", myReview);
			mav.setViewName("hpreview");
		}
		return mav;
	}
//추가
	private String makeHtml6(ArrayList<ReservationBean> myReview) {
		StringBuffer sb = new StringBuffer();
		System.out.println("makeHtml진입");
		int i = 0;
		System.out.println(myReview);
		if(!myReview.equals("")) {
		sb.append("<div class=\"title-hpreview\">");
		sb.append("<div class=\"rv_title\">"+myReview.get(i).getId()+"후기</div>");
		sb.append("</div>");
		for (i = 0; i < myReview.size(); i++) {
			sb.append("<div class=\"span-hplist\" id=\"info" + i + "\" >");
			sb.append("<div class=\"rv_review\">");
			sb.append("<div class=\"rv_content\" onClick=\"doDisplay('"+i+"')\">");
			sb.append("<div class=\"rv_content3\">"+myReview.get(i).getHpName()+"</div>");
			sb.append("<div class=\"rv_content1\">" + myReview.get(i).getRvDate() + "</div>");
			sb.append("</div>");
			sb.append("<div  id = \"point"+i+"\" class=\"point\" style=\"display: none\">");
			sb.append("<div class=\"rv_content\" style=\" position: relative;top: -47px;left: -14px;\">");
			sb.append("<div class=\"rv_content2\">" + myReview.get(i).getDrName() + "선생님 ["+myReview.get(i).getPaName()+"]</div>");
			sb.append("</div>");
			if(myReview.get(i).getGrade().equals("1")) {sb.append("<a><img src=\"/resources/img/1star.png\">1</a>");}
			else if(myReview.get(i).getGrade().equals("2")){sb.append("<a><img src=\"/resources/img/2star.png\">2</a>");}
			else if(myReview.get(i).getGrade().equals("3")){sb.append("<a><img src=\"/resources/img/3star.png\">3</a>");}
			else if(myReview.get(i).getGrade().equals("4")){sb.append("<a><img src=\"/resources/img/4star.png\">4</a>");}
			else {sb.append("<a><img src=\"/resources/img/5star.png\">5</a>");}
			sb.append("<div class=\"review\">" + myReview.get(i).getRComment() + "</div>");
			sb.append("</div>");
			sb.append("</div>");
			sb.append("</div>");
		}}else{
			sb.append("<div>");
			sb.append("작성한 리뷰가 없습니다.");
			sb.append("</div>");
		}
		
		return sb.toString();
	}

	private String makeHtml4(ReservationBean rv) {
		StringBuffer sb = new StringBuffer();
		System.out.println("makeHtml진입");
		sb.append("<div class=\"span-hplist\" id=\"info\">");
		sb.append("<div class=\"hpReview_mm\" id=\"info\">");
		sb.append("<div class=\"hpReview_title\">후기작성</div>");
		sb.append("<div class=\"hpReview_content\">"+rv.getHpName() +"</div>");
		sb.append("<div class=\"hpReview_content\">"+rv.getDrName() +"["+rv.getPaName()+"]</div>");
		int i;
		sb.append("<div class=\"startRadio\">");
		sb.append("<div class=\"rate\">");
		for(i=5;i>0;i--) {
		sb.append("<input type=\"radio\" id=\"star"+i+"\" name=\"rate\" value="+i+" />");
		sb.append("<label for=\"star"+i+"\" title=\"text\" onClick=\"starcheck("+i+")\">"+i+" stars</label>");
		}
		sb.append("</div>");
		sb.append("<div><textarea type=text id=\"getReview\" maxlength=\"200\"></textarea></div>");
		sb.append("<div class=\"submit\"><input type=\"button\" id=\"insRvbtn\" onClick=\"submit('"+rv.getReCode()+"')\" value=\"후기작성\"></div>");
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
	}

	private String makeHtml3(ArrayList<ReservationBean> rvInfo) {
		StringBuffer sb = new StringBuffer();
		System.out.println("makeHtml진입");
		int i = 0;
		sb.append("<div class=\"title-hpreview\">");
		sb.append("<div class=\"rv_title\">"+rvInfo.get(i).getHpName()+"후기</div>");
		sb.append("</div>");
		for (i = 0; i < rvInfo.size(); i++) {
			sb.append("<div class=\"span-hplist\" id=\"info" + i + "\" >");
			sb.append("<div class=\"rv_content\">");
			sb.append("<div class=\"rv_content1\">" + rvInfo.get(i).getRvDate() + "</div>");
			sb.append("<div class=\"rv_content2\">" + rvInfo.get(i).getId()+ "</div>");
			sb.append("<div class=\"rv_content3\">" + rvInfo.get(i).getDrName() + "선생님 ["+rvInfo.get(i).getPaName()+"]</div>");
			sb.append("</div>");
			sb.append("<div class = \"point\">");
			if(rvInfo.get(i).getGrade().equals("1")) {sb.append("<a><img src=\"/resources/img/1star.png\">1</a>");}
			else if(rvInfo.get(i).getGrade().equals("2")){sb.append("<a><img src=\"/resources/img/2star.png\">2</a>");}
			else if(rvInfo.get(i).getGrade().equals("3")){sb.append("<a><img src=\"/resources/img/3star.png\">3</a>");}
			else if(rvInfo.get(i).getGrade().equals("4")){sb.append("<a><img src=\"/resources/img/4star.png\">4</a>");}
			else {sb.append("<a><img src=\"/resources/img/5star.png\">5</a>");}
			sb.append("<div class=\"review\">" + rvInfo.get(i).getRComment() + "</div>");
			sb.append("</div>");
		}

		return sb.toString();
	}

	private ModelAndView bookFormCtl(ReservationBean rv, Model model) {
		String bkHpList = new String();
		
		System.out.println(this.countBkt(rv));
		if (this.countBkt(rv)) {
			rv.setHpName(rv.getHpName());
			rv.setHpPhone(rv.getHpPhone());
			rv.setPaName(rv.getPaName());
			rv.setHpCode(rv.getHpCode());
			

			System.out.println(this.isTdList(rv));
			bkHpList = makeHtml(this.isBkList(rv),this.isTdList(rv),this.isLTime(rv));
			model.addAttribute("hpList", bkHpList);
		} else {
			model.addAttribute("hobby", "관심병원리스트에 병원이 없습니다.");
		}
		mav.setViewName("bookmarkform");
		return mav;
	}
/*수정 */
	private String makeHtml(ArrayList<ReservationBean> bkList,ArrayList<ReservationBean> tdList,ArrayList<ReservationBean> isLtime) {
		StringBuffer sb = new StringBuffer();
		System.out.println("makeHtml진입");
		int i = 0;
		sb.append("<div class=\"hpReview_title\" >");
		sb.append("<div>관심병원 리스트</div>");
		sb.append("</div>");
		for (i = 0; i < bkList.size(); i++) {
			sb.append("<div id=\"info" +i+"\" class=\"bk_list\">");
			sb.append("<a id=\"BOOKMARK\" class=\"info" + i + "\" onclick=\"bk('" + bkList.get(i).getId() + ":"
					+ bkList.get(i).getHpCode() + ":" + i + "')\">");
			sb.append("<img src=\"/resources/img/bookmark.png\"/>");
			sb.append("</a>");
			sb.append("<div  id=\"info" + i + "\" onclick=\"order('"+bkList.get(i).getId()
					+":"+bkList.get(i).getHpCode()+"')\" >");
			sb.append("<div class=\"hpname\">" + bkList.get(i).getHpName() + "</div>");
			if(bkList.get(i).getPaName() != null) {
			sb.append("<div class=\"hppart\">" + bkList.get(i).getPaName() + "</div>");
			}else {
			}
			
			 int j=0; for(j=0;j<tdList.size();j++) {
			  if(tdList.get(j).getHpCode().equals(bkList.get(i).getHpCode()))
			  {
				  System.out.println(tdList.get(j).getTStart());
				  System.out.println(tdList.get(j).getHpCode());
				  System.out.println(bkList.get(i).getHpCode());
			  sb.append("<div class=\"hptime\">" + "오늘의 진료 시간 : "+tdList.get(j).getTStart()+"~"+tdList.get(j).getTEnd()+ "</div>"); }
			  }
			int k=0;
			System.out.println(isLtime);
			for(k=0;k<isLtime.size()-1;k++) {
				if(isLtime.get(k).getHpCode().equals(bkList.get(i).getHpCode())) {
					//시작 시간 ~ 마지막 시간
					if(isLtime.get(k).getTEnd().compareTo(isLtime.get(k+1).getTStart())<0) {
					}
					//점심시간 출력 성공
					if(!isLtime.get(k).getTEnd().equals(isLtime.get(k+1).getTStart())) {
						if(isLtime.get(k).getTEnd().compareTo(isLtime.get(k+1).getTStart())<0) {
						System.out.println(isLtime.get(k).getTEnd());
						System.out.println(isLtime.get(k+1).getTStart());
						sb.append("<div class=\"ltime\">" + "(점심 : "+ isLtime.get(k).getTEnd()+"~"+isLtime.get(k+1).getTStart()+ ")"+"</div>");
						}
				}
			}
			}
			sb.append("</div>");
			sb.append("<button id=\"HDETAIL\" onclick=\"hdetail('"+bkList.get(i).getHpCode()+":"
			+bkList.get(i).getHpCode()+"')\">>>자세히</button>");
			sb.append("</div>");
			}
		return sb.toString();
	}
/*여기까지*/
	private ModelAndView bookMarkCtl(ReservationBean rv, Model model) {
		rv.setHpCode(rv.getHpCode());
		rv.setId(rv.getId());
		System.out.println(rv.getId());
		System.out.println(rv.getHpCode());
		System.out.println(this.countBk(rv));
		if (this.countBk(rv)) {
			this.delBk(rv);
		} else {
			this.insBk(rv);
		}

		mav.addObject("bkList", this.isBkList(rv));
		String jsonData = gson.toJson(mav.getModel().get("bkList"));
		mav.setViewName("bookmarkform");
		return mav;
	}

	private ModelAndView myPageCtl(ReservationBean rv, Model model) {
		
		
		System.out.println(rv.getId());
		
		mav.setViewName("mypageform");
		
		model.addAttribute("idInfo",rv.getId());

		return mav;
	}

	private ModelAndView upMInfoCtl(ReservationBean rv, Model model) {
		rv.setName(rv.getName());
		rv.setPhone(rv.getPhone());
		rv.setAddr(rv.getAddr());

		System.out.println(rv.getName());
		System.out.println(rv.getAddr());
		System.out.println(rv.getPhone());
		this.upMember(rv);
		this.adUpFamily(rv);
		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upfaFormCtl(ReservationBean rv, Model model) {
		
		System.out.println(rv.getId());
		mav.addObject("faInfo", this.isFamily(rv));
		String jsonData = gson.toJson(mav.getModel().get("faInfo"));
		mav.addObject("faInfo", jsonData);
		System.out.println(jsonData);

		mav.setViewName("mypageform");
		return mav;
	}

	private ModelAndView upFamilyCtl(ReservationBean rv, Model model) {
		System.out.println("진입");
		rv.setFCode(rv.getFCode());
		System.out.println(rv.getFCode());
		String msg = "성공";
		if (rv.getFCode().equals("insert")) {
			
			rv.setName(rv.getName());
			rv.setPhone(rv.getPhone());
			rv.setJumin(rv.getJumin());
			System.out.println(rv.getJumin());
			System.out.println(rv.getPhone());
			System.out.println(rv.getName());
			if (this.countFa(rv) < 6) {
				this.upFamily(rv);
				System.out.println(this.countFa(rv));

			} else {
				System.out.println("5개넘음");
				mav.addObject("msg", "세대원은 5명까지만 등록이 가능합니다.");
			}

		} else {
			
			rv.setName(rv.getName());
			rv.setPhone(rv.getPhone());
			rv.setJumin(rv.getJumin());
			System.out.println(rv.getJumin());
			System.out.println(rv.getPhone());
			System.out.println(rv.getName());

			this.updfamily(rv);
		}
		mav.addObject("insfaInfo", this.isFamily(rv));
		String jsonData = gson.toJson(mav.getModel().get("insfaInfo"));
		mav.addObject("insfaInfo", jsonData);
		System.out.println(jsonData);

		mav.setViewName("mypageform");

		return mav;
	}

	private ModelAndView RDetailCtl(ReservationBean rv, Model model) {
		System.out.println("1단계");
		String reInfo = new String();
		System.out.println(this.reInfo(rv));
		
		reInfo = makeHtml5(this.reInfo(rv));
		model.addAttribute("reInfo", reInfo);

		
		mav.setViewName("rdetail");
		return mav;
	}

	
     private String makeHtml5(ArrayList<ReservationBean> reInfo) {
    		StringBuffer sb = new StringBuffer();
    		System.out.println("makeHtml진입");
    		int i = 0;
    		for (i = 0; i < reInfo.size(); i++) {
    			sb.append("<div class=\"span-hplist\" id=\"info" + i + "\">");
    			sb.append("<div id=\"RESFORM\" class=\"info" + i + "\" onclick=\"order(this)\">");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getId()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getName()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getDrsDate()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getTStart()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getDrName()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getHpName()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getPaName()+ "</div>");
    			sb.append("<div class=\"hpname\">" + reInfo.get(i).getReCode()+ "</div>");
    			sb.append("</div>");
    			sb.append("</div>");
    		}
    		return sb.toString();
	}

     private ArrayList<ReservationBean> ReList(ReservationBean rv) {
    	 
      	  return (mypage.reInfo(rv)); }
     
	private ArrayList<ReservationBean> isNull(ReservationBean rv) {
	 
	  return (mypage.isNull(rv)); }
	
     private ArrayList<ReservationBean> isPart(ReservationBean rv) {
    	 
   	  return (mypage.isPart(rv)); }
     private ReservationBean  updStCode(ReservationBean rv) {

 		return (mypage. updStCode(rv));
 	}
	 private ReservationBean isMember(ReservationBean rv) {

		return (mypage.isMInfo(rv));
	}

	private ArrayList<ReservationBean> isFamily(ReservationBean rv) {

		return (mypage.isFaInfo(rv));
	}

	private ArrayList<ReservationBean> isBkList(ReservationBean rv) {

		return (mypage.isBkList(rv));
	}

	private ArrayList<ReservationBean> isTdList(ReservationBean rv) {

		return (mypage.isTdList(rv));
	}
	private ArrayList<ReservationBean> isLTime(ReservationBean rv) {

		return (mypage.islTime(rv));
	}
	private ReservationBean isPassword(ReservationBean rv) {
		return (mypage.isPassword(rv));
	}

	private ReservationBean upMember(ReservationBean rv) {
		return (mypage.upMember(rv));
	}

	private ReservationBean upFamily(ReservationBean rv) {
		return (mypage.upFamily(rv));
	}

	private ReservationBean delFamily(ReservationBean rv) {
		return (mypage.delFamily(rv));
	}

	private boolean countFamily(ReservationBean rv) {
		return convert(mypage.countFaInfo(rv));
	}

	private int countFa(ReservationBean rv) {
		return (mypage.countFa(rv));
	}

	private ReservationBean adUpFamily(ReservationBean rv) {

		return (mypage.adUpFamily(rv));
	}

	private ReservationBean pwSelect(ReservationBean rv) {

		return (mypage.pwSelect(rv));
	}

	private ReservationBean updfamily(ReservationBean rv) {
		return (mypage.updFamily(rv));
	}

	private boolean countBk(ReservationBean rv) {
		return convert(mypage.countBk(rv));
	}

	private boolean countBkt(ReservationBean rv) {
		return convert(mypage.countBkt(rv));
	}

	private ReservationBean insBk(ReservationBean rv) {
		return (mypage.insBk(rv));
	}

	private ReservationBean delBk(ReservationBean rv) {
		return (mypage.delBk(rv));
	}
	private ReservationBean insReview(ReservationBean rv) {
		return (mypage.insReview(rv));
	}

	private ArrayList<ReservationBean> reInfo(ReservationBean rv) {
		return (mypage.reInfo(rv));
	}
	private ArrayList<ReservationBean> rvInfo(ReservationBean rv) {
		return (mypage.rvInfo(rv));
	}
	
	private ArrayList<ReservationBean> myReview(ReservationBean rv) {
		return (mypage.myReview(rv));
	}
	private ReservationBean mrvInfo(ReservationBean rv) {
		return (mypage.infoReview(rv));
	}

	private boolean convert(int i) {

		return (i != 0) ? true : false;
	}

}