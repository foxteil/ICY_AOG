package icy.aog.mapper;

import icy.aog.beans.AuthBean;

public interface MemberIF {
	public int isUser(AuthBean ab);
	public int isAdmin(AuthBean ab);
}
