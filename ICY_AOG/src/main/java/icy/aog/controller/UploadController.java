
package icy.aog.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import icy.aog.beans.Hospital;
import icy.aog.mapper.HospitalIF;
import icy.aog.services.Admin;
import lombok.extern.log4j.Log4j;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import icy.aog.beans.Hospital;
import icy.aog.services.Admin;

@Controller
@Log4j
public class UploadController {
	@Autowired
	private Admin admin;
	@Autowired
	private HospitalIF mapper;
	ModelAndView mav;
	   
	@Resource(name="uploadPath1") //servlet-context에 정의한 uploadPath를 path에 저장하겠다
	private String Path1;

private String uploadFile1(String originalName1, byte[] fileData1) 
		throws Exception{
//이름을 유니크하게 만드는 함수
UUID uid1=UUID.randomUUID();

String savedName1=uid1.toString()+"-"+ originalName1;
//랜덤이름 진짜긴이름+'-진짜파일이름'

File target1=new File(Path1,savedName1);
//받는 경로,랜덤이름-진짜파일이름

FileCopyUtils.copy(fileData1, target1);
//fileData를 target에 저장

return savedName1;
}

@RequestMapping(value="/drupload",method=RequestMethod.POST)
public ModelAndView drupload (@ModelAttribute Hospital hp, MultipartFile file1,ModelAndView mv) throws IOException, Exception {


	System.out.println("drupload post..............................");
    //여기로 오는지 확인한다.
	System.out.println("file1 name1:" + file1.getOriginalFilename());
    //파일이름을 콘솔에 출력
	System.out.println("file1 size1:" + file1.getSize());
    //파일사이즈
	System.out.println("file1 type1:" + file1.getContentType());
    //파일 타입
	System.out.println("path1:"+ Path1);
    //패쓰를 찍는다
	String savedName1=uploadFile1(file1.getOriginalFilename(),file1.getBytes());
	System.out.println("savedFile1:"+savedName1);
	
	
	
	

	hp.setDrImg(savedName1);
	System.out.println(hp.getHpCode());
	System.out.println(hp.getDrCode());
	System.out.println(hp.getDrName());

	System.out.println(this.upDr(hp));

		
		if(this.upDr(hp)==1) {
			
	}
	

	mv.setViewName("adminstart_upload");
	return	mv;
	
}
private int upDr(Hospital hp){
	return mapper.upDr(hp);

 
}
}
