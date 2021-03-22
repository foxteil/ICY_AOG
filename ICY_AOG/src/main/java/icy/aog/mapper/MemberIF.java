package icy.aog.mapper;


import java.util.ArrayList;

import icy.aog.beans.AuthBean;

public interface MemberIF {
	public int isUser(AuthBean ab);
	public int isAdmin(AuthBean ab);
	public String isState(AuthBean ab);
	public AuthBean insMember(AuthBean ab);
	public AuthBean insFamily(AuthBean ab);
	public AuthBean insStaff(AuthBean ab);
	public AuthBean insHp(AuthBean ab);
	public AuthBean insSedewon(AuthBean ab);
	public AuthBean insHt1(AuthBean ab);
	public AuthBean insHt2(AuthBean ab);
	public AuthBean insHt3(AuthBean ab);
	
	public int isKakaoUser(AuthBean ab);
	public AuthBean insKakaoMember(AuthBean ab);
	public AuthBean insKakaoFamily(AuthBean ab);
	
	public int isNaverUser(AuthBean ab);
	public AuthBean insNaverMember(AuthBean ab);
	public AuthBean insNaverFamily(AuthBean ab);
	
	public int isGoogleUser(AuthBean ab);
	public AuthBean insGoogleMember(AuthBean ab);
	public AuthBean insGoogleFamily(AuthBean ab);
	
	public ArrayList<AuthBean> lsearchInfo(AuthBean ab);
	
	public ArrayList<AuthBean> seachHospital(AuthBean ab);
	public ArrayList<AuthBean> seachHospital2(AuthBean ab);
	
	public AuthBean upHp(AuthBean ab);
	public AuthBean upHS(AuthBean ab);
	public AuthBean insSC(AuthBean ab);
	
	
	
	
	
	
	//public ArrayList<AuthBean> getMb(AuthBean ab);
}
