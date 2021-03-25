package icy.aog.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.utils.Encryption;
import icy.aog.beans.AuthBean;
import icy.aog.services.Authentication;


@Controller
public class HomeController {

	@Autowired
	private Authentication auth;
	ModelAndView mav = null;

	@Resource(name="uploadPath") //servlet-context에 정의한 uploadPath를 path에 저장하겠다
	private String Path;
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		//이름을 유니크하게 만드는 함수
		UUID uid = UUID.randomUUID();
		//랜덤이름 진짜긴이름+'-진짜파일이름'
		String savedName = uid.toString()+"-"+ originalName;
		//받는 경로,랜덤이름-진짜파일이름
		File target = new File(Path,savedName);
		//fileData를 target에 저장
		FileCopyUtils.copy(fileData, target);
	
		return savedName;
	}
   
    @RequestMapping(value="/uploadA",method=RequestMethod.POST)
    public ModelAndView upload (@ModelAttribute AuthBean ab, MultipartFile file, ModelAndView mv) throws IOException, Exception {
    	System.out.println("업로드 액션 진입");
    	
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
		String savedName = uploadFile(file.getOriginalFilename(),file.getBytes());
		
		System.out.println("savedFile:"+savedName);
		mv.addObject("aHpImg", savedName);
		
		System.out.println("ab.getAHpPhone() : "+ ab.getAHpPhone());
    	mv.addObject("aHpPhone", ab.getAHpPhone());
		
		mv.setViewName("adminjoinform");
		return	mv;
    }
	
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String logInForm(@ModelAttribute AuthBean ab, Model model) {
		return "main";
	}
	@RequestMapping(value = "/LOGIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String logIn(@ModelAttribute AuthBean ab, Model model) {
		mav = new ModelAndView();
		ab.setSCode("LOGIN");
		mav = auth.entrance(ab, model);
		if(ab.getLogCode().equals("U")) {
			model.addAttribute("sInfo", mav.getModel().get("lsinfo").toString());
		}
		
		
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/KAKAOLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLog(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("KAKAOLOG");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/NAVERLOGINFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String naverLogInform(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("NAVERLOGINFORM");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/NAVERLOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String naverLog(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("NAVERLOG");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/GOOGLELOG", method = {RequestMethod.GET,RequestMethod.POST})
	public String googleLog(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("GOOGLELOG");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	
	@RequestMapping(value = "/FINDFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String findForm(@ModelAttribute AuthBean ab, Model model) {
		if(ab.getFCode().equals("user")) {
			mav.setViewName("find");
		}else if(ab.getFCode().equals("admin")){
			mav.setViewName("find");
		}
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOINFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinform(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("JOINFORM");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOINFORM2", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinform2(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("JOINFORM2");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/JOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String join(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("JOIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/AJOIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String aJoin(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("AJOIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/POPUPHPSEARCHFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String popUpHpSearchForm(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("POPUPHPSEARCHFORM");
		mav = auth.entrance(ab, model);
		
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/POPUPHPSEARCH", method = {RequestMethod.GET,RequestMethod.POST})
	public String popUpHpSearch(@ModelAttribute AuthBean ab, Model model) {
		ModelAndView mav = new ModelAndView();
		ab.setSCode("POPUPHPSEARCH");
		mav = auth.entrance(ab, model);
		
		model.addAttribute("hpList", mav.getModel().get("hpList").toString());
		return mav.getViewName();
	}
	
	
	
	@RequestMapping(value = "/FIND", method = {RequestMethod.GET,RequestMethod.POST})
	public String find(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("FIND");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/PWFORM", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwForm(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("PWFORM");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	//임시
	@RequestMapping(value = "/ADMIN", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("ADMIN");
		mav = auth.entrance(ab, model);
		return mav.getViewName();
	}
	@RequestMapping(value = "/TEST", method = {RequestMethod.GET,RequestMethod.POST})
	public String test(@ModelAttribute AuthBean ab, Model model) {
		ab.setSCode("TEST");
		mav = auth.entrance(ab, model);
		
		System.out.println(mav.getViewName());
		System.out.println(ab.getMId());
		System.out.println(mav.getModel().get("test1"));
		System.out.println(mav.getModel().get("test2"));
		
		return mav.getViewName();
	}
	
	@RequestMapping(value = "/TEST2", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String test2(@ModelAttribute AuthBean ab, Model model) {
		//ab.setSCode("TEST");
		mav = auth.entrance(ab, model);
		
		System.out.println(mav.getViewName());
		
		
		return mav.getViewName();
	}
}