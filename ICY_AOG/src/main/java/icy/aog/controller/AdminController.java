package icy.aog.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import icy.aog.beans.Addr;
import icy.aog.beans.Hospital;
import icy.aog.mapper.HospitalIF;
import icy.aog.services.Admin;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {

	@Autowired
	private Admin admin;
	@Autowired
	private HospitalIF mapper;
	@Resource(name="uploadPath") //servlet-context에 정의한 uploadPath를 path에 저장하겠다
	private String Path;
	ModelAndView mav;
	
	
	private String uploadFile(String originalName, byte[] fileData) 
			throws Exception{
//이름을 유니크하게 만드는 함수
 UUID uid=UUID.randomUUID();

String savedName=uid.toString()+"-"+ originalName;
//랜덤이름 진짜긴이름+'-진짜파일이름'

File target=new File(Path,savedName);
//받는 경로,랜덤이름-진짜파일이름

FileCopyUtils.copy(fileData, target);
//fileData를 target에 저장

return savedName;
	}
	
	   //병원이미지 변경
	 @RequestMapping(value="/upload",method=RequestMethod.POST)
	    public ModelAndView upload (@ModelAttribute Hospital hp, MultipartFile file,ModelAndView mv) throws IOException, Exception {
	    	
	    	System.out.println("upload post..............................");
	        //여기로 오는지 확인한다.
			System.out.println("file name:" + file.getOriginalFilename());
	        //파일이름을 콘솔에 출력
			System.out.println("file size:" + file.getSize());
	        //파일사이즈
			System.out.println("file type:" + file.getContentType());
	        //파일 타입
			System.out.println("path:"+ Path);
	        //패쓰를 찍는다
			String savedName=uploadFile(file.getOriginalFilename(),file.getBytes());
			System.out.println("savedFile:"+savedName);
			
			
			System.out.println(hp.getUhpCode());
			hp.setImgData(savedName);

			
			System.out.println(this.uphpimg(hp));
			
			if(this.uphpimg(hp)==1) {
				System.out.println("전송완료");
			}
			

			mv.setViewName("adminstart");
			return	mv;
			
	    }
	 
	//병원이미지 변경 	
	    private int uphpimg(Hospital hp){
			return mapper.uphpimg(hp);
		 
	    }
	
		//직원 등록
		@RequestMapping(value = "/ROLL", method = { RequestMethod.GET, RequestMethod.POST })
	    
		public String roll(@ModelAttribute Hospital hp, Model model) {
			hp.setSCode("ROLL");
			System.out.println(hp.getStfName());
			System.out.println(hp.getStfRank());
			mav = admin.entrance(hp, model);		
			return mav.getViewName();
			
			
		}
		//의사이미지 불러오기
		@RequestMapping(value = "/SELDRIMG", method = { RequestMethod.GET, RequestMethod.POST })
	    @ResponseBody
		public String seldrimg(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {
			hp.setSCode("SELDRIMG");
			
			mav = admin.entrance(hp, model);
			System.out.println(mav.getModel().get("selstf"));
			return URLEncoder.encode(mav.getModel().get("selimg").toString(), "UTF-8");
			
			
			
		}
		
	@RequestMapping(value = "/UPDATEDR", method = { RequestMethod.GET, RequestMethod.POST })
	    
		public ModelAndView updatedr(@ModelAttribute Hospital hp, Model model) {
			hp.setSCode("UPDATEDR");
			
			mav = admin.entrance(hp, model);
			
			return mav;
			
			
		}

	@RequestMapping(value = "/UPDATEHP", method = { RequestMethod.GET, RequestMethod.POST })

	public String updatehp(@ModelAttribute Hospital hp, Model model) {
		hp.setSCode("UPDATEHR");
		
		mav = admin.entrance(hp, model);
		
		return mav.getViewName() ;
		
		
	}
	@RequestMapping(value = "/UPDATESTF", method = { RequestMethod.GET, RequestMethod.POST })

	public String updatestf(@ModelAttribute Hospital hp, Model model) {
		hp.setSCode("UPDATESTF");
		
		mav = admin.entrance(hp, model);
		
		return mav.getViewName() ;
		
		
	}


	@RequestMapping(value = "/HPINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String hpInfoForm(@ModelAttribute Hospital hp, Model model) {

		hp.setSCode("HPINFOFORM");

		mav = admin.entrance(hp, model);


		return mav.getViewName();

	}

	@RequestMapping(value = "/STFCHECK", method = { RequestMethod.GET, RequestMethod.POST })
	public String stfcheck(@ModelAttribute Hospital hp, Model model) {

		hp.setSCode("STFCHECK");

		mav = admin.entrance(hp, model);


		return mav.getViewName();

	}
	@RequestMapping(value = "/DELSTF", method = { RequestMethod.GET, RequestMethod.POST })
	public String delstf(@ModelAttribute Hospital hp, Model model) {

		hp.setSCode("DELSTF");
		mav = admin.entrance(hp, model);
		return mav.getViewName();

	}
	 
	// 관리자 정보 불러오기 	
	@RequestMapping(value = "/INSENROLLFORM", method = { RequestMethod.POST })
	@ResponseBody
	public String insenrollForm(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {
		hp.setSCode("INSENROLLFORM");
		mav = admin.entrance(hp, model);

		System.out.println(mav.getModel().get("selstf"));
		return URLEncoder.encode(mav.getModel().get("selstf").toString(), "UTF-8");
	}
	 
	//닥터 정보 불러오기 	
	@RequestMapping(value = "/DRINFO", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String drInfo(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {

		hp.setSCode("DRINFO");
		mav = admin.entrance(hp, model);
		System.out.println(mav.getModel().get("seldr"));


		return URLEncoder.encode(mav.getModel().get("seldr").toString(), "UTF-8");
	}

	@RequestMapping(value = "/DRINFOSFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String DRINFOSFORM(@ModelAttribute Hospital hp, Model model) {

		hp.setSCode("DRINFOSFORM");
		mav = admin.entrance(hp, model);
		return mav.getViewName();

	}
	
	
	
//	@RequestMapping(value = "/RESERVELIST", method = { RequestMethod.GET, RequestMethod.POST })
//	public String reserveList(@ModelAttribute Hospital HB, Model model) {
//		HB.setSCode("RESERVELIST");
//		mav = new ModelAndView();
//		mav = admin.entrance(HB);
//		return mav.getViewName();
//
//	}
//	

	// 병원정보 불러오기 	
	@RequestMapping(value = "/HPINFO", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String hpInfo(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {

		hp.setSCode("HPINFO");
		mav = admin.entrance(hp, model);
		System.out.println(mav.getModel().get("selhp"));

		return URLEncoder.encode(mav.getModel().get("selhp").toString(), "UTF-8");
	}
	 
	@RequestMapping(value= "/RELIST", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String RELIST(@ModelAttribute Hospital HB, Model model) throws UnsupportedEncodingException {
		
		mav = admin.entrance(HB,model);
		System.out.println("컨트롤러에는 들어옴");
		return URLEncoder.encode(mav.getModel().get("data").toString(),"UTF-8");
	}
	
	
	
	@RequestMapping(value= "/testajax", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String testajax(@ModelAttribute Hospital HB, Model model) throws UnsupportedEncodingException {
		
		HB.setSCode("TEST");
		mav = admin.entrance(HB,model);
		System.out.println("컨트롤러에는 들어옴");
		return mav.getModel().get("testajax").toString();
	}

	
	@RequestMapping(value= "/testapi", method= {RequestMethod.GET, RequestMethod.POST})
	public String testapi(@ModelAttribute Hospital HB, Model model) {
		
		return "testapi";
	}
	
	@RequestMapping(value= "/testapi2", method= {RequestMethod.GET, RequestMethod.POST})
	public String testapi2(@ModelAttribute Hospital HB, Model model) {
		
		return "testapi2";
	}
	
	
	
	@RequestMapping(value = "/RESERVELIST", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String reserveList(@ModelAttribute Hospital HB, Model model) throws UnsupportedEncodingException {
		
		mav = new ModelAndView();
		
		
		mav = admin.entrance(HB,model);
		
		model.addAttribute("rlist",mav.getModel().get("rList").toString());
		System.out.println(mav.getModel().get("rList"));
		
		return URLEncoder.encode(mav.getModel().get("rList").toString(),"UTF-8");

	}

	@RequestMapping(value = "/SETTINGFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String settingForm(@ModelAttribute Hospital HB, Model model) {
		System.out.println("SETTINGFORM 진입");
		HB.setSCode("SETTINGFORM");
		mav = new ModelAndView();
		mav = admin.entrance(HB, model);
		return mav.getViewName();
	}

	@RequestMapping(value = "/HPREVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String hpReview(@ModelAttribute Hospital HB, Model model) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = admin.entrance(HB, model);
		
		return mav.getViewName();
	}

	@RequestMapping(value = "/SCHEDULEFORM", method = { RequestMethod.GET, RequestMethod.POST })
	public String scheduleForm(@ModelAttribute Hospital HB, Model model) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		mav = admin.entrance(HB, model);
		 return mav.getViewName();
	}

	@RequestMapping(value = "/DRTIME", method = { RequestMethod.GET, RequestMethod.POST })

	public String drTime(@ModelAttribute Hospital HB, Model model) {

		HB.setSCode("DRTIME");
		mav = new ModelAndView();
		mav = admin.entrance(HB, model);
		return mav.getViewName();
	}

	@RequestMapping(value = "/BREAK", method = { RequestMethod.GET, RequestMethod.POST })

	public String Break(@ModelAttribute Hospital HB, Model model) {

		HB.setSCode("BREAK");
		mav = new ModelAndView();
		mav = admin.entrance(HB, model);
		return mav.getViewName();
	}
	// 윤정
	
	   //							me
	   @RequestMapping(value = "/DRINFOFORM", method = { RequestMethod.GET, RequestMethod.POST })
	   public String drinfoForm(@ModelAttribute Hospital hp, Model model) {
		   mav = new ModelAndView();
		   hp.setSCode("DRINFOFORM");
		   
		   mav = admin.entrance(hp, model);
		   
	      String page =  "drinfoForm";
	   

	      return page;

	   }
	   
	   
	   @RequestMapping(value = "/DRINFOj", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String drInfoj(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {

		   hp.setSCode("DRINFOj");
		   mav = admin.entrance(hp, model);
	      String page =  "drInfo";
	   
	     
	      return null;

	   }
	   //							me
	   @RequestMapping(value = "/ENROLLFORM", method = { RequestMethod.GET, RequestMethod.POST })

	   public String enrollForm(@ModelAttribute Hospital hp, Model model) {

		   
		   hp.setSCode("ENROLLFORM");
		   mav = admin.entrance(hp, model);
	      String page =  "enrollForm";
	   

	      return page;

	   }
	   //							me  직원삭제
	   @RequestMapping(value = "/DELENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String delEnroll(@ModelAttribute Hospital hp, Model model) {

		   
		   hp.setSCode("DELENROLL");
		   mav = admin.entrance(hp, model);
	      String page =  "delEnroll";
	   

	      return page;

	   }
	   //							me
	   @RequestMapping(value = "/ENROLL", method = { RequestMethod.GET, RequestMethod.POST })

	   public String Enroll(@ModelAttribute Hospital hp, Model model) {

		   
		   hp.setSCode("ENROLL");
		   mav = admin.entrance(hp, model);
	      String page =  "Enroll";
	   

	      return page;

	   }
	   
	   //							me
	   @RequestMapping(value = "/RESAVAILABLE", method = { RequestMethod.GET, RequestMethod.POST })

	   public String resAvailable(@ModelAttribute Hospital hp, Model model) {
		   
		   hp.setSCode("RESAVAILABLE");
		   mav = admin.entrance(hp, model);
	      String page =  "resAvailable";

	      return page;

	   }
	   
	   @RequestMapping(value = "/CAL", method = { RequestMethod.GET, RequestMethod.POST })
	   public String cal(@ModelAttribute Hospital hp, Model model) {

	      String page =  "cal";
	      hp.setSCode("TEST");
	      mav=admin.entrance(hp, model);
	      return  page;

	   }
	   
	   @RequestMapping(value = "/RESERVECHECK", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String RESERVECHECK(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {
		   	System.out.println(hp.getFAJUMIN());
		   	System.out.println(hp.getDrCode());
		   	System.out.println(hp.getHpCode());
		   	System.out.println(hp.getTMCODE());
	      
	      mav=admin.entrance(hp, model);
	      return  URLEncoder.encode(mav.getModel().get("msg2").toString(),"UTF-8");

	   }
	   
	   @RequestMapping(value = "/REJECTU", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String REJECTU(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {
		   	System.out.println(hp.getFAJUMIN());
		   	System.out.println(hp.getDrCode());
		   	System.out.println(hp.getHpCode());
		   	System.out.println(hp.getTMCODE());
	      
	      mav=admin.entrance(hp, model);
	      return  URLEncoder.encode(mav.getModel().get("msg2").toString(),"UTF-8");

	   }
	   @RequestMapping(value = "/HPSCCHANGE", method = { RequestMethod.GET, RequestMethod.POST })
	   public String HPSCCHANGE(@ModelAttribute Hospital hp, Model model) {

	      mav=admin.entrance(hp, model);
	      return  mav.getViewName();

	   }
	   @RequestMapping(value = "/HPBREAK", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String HPBREAK(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {

	      mav=admin.entrance(hp, model);
	      return  URLEncoder.encode(mav.getModel().get("msg").toString(),"UTF-8");

	   }
	   @RequestMapping(value = "/SHOWDOC", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String SHOWDOC(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {

	      mav=admin.entrance(hp, model);
	      return  URLEncoder.encode(mav.getModel().get("DInfo").toString(),"UTF-8");

	   }
	   @RequestMapping(value = "/SHOWDOCTIME", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public String SHOWDOCTIME(@ModelAttribute Hospital hp, Model model) throws UnsupportedEncodingException {

	      mav=admin.entrance(hp, model);
	      model.addAttribute("getDrsDay",mav.getModel().get("aa"));
	      mav.addObject("getDrsDay2",mav.getModel().get("aa"));
	      return  URLEncoder.encode(mav.getModel().get("drsInfo").toString(),"UTF-8");

	   }
	   @RequestMapping(value = "/DRINFOS", method = { RequestMethod.GET, RequestMethod.POST })
	   public String DRINFOS(@ModelAttribute Hospital hp, Model model) {
	      
	      mav=admin.entrance(hp, model);
	      return  mav.getViewName();

	   }
	   

}
