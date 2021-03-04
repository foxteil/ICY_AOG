package icy.aog.mapper;


import icy.aog.beans.AuthBean;

public interface MemberIF {
	public int isUser(AuthBean ab);
	public int isAdmin(AuthBean ab);
	public String isState(AuthBean ab);
	public AuthBean insMember(AuthBean ab);
	public AuthBean insFamily(AuthBean ab);
	public AuthBean insStaff(AuthBean ab);
	//public ArrayList<AuthBean> getMb(AuthBean ab);
	
}
