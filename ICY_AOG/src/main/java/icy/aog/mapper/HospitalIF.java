package icy.aog.mapper;

import java.util.ArrayList;

import icy.aog.beans.AuthBean;
import icy.aog.beans.Hospital;

public interface HospitalIF {
	
	public ArrayList<Hospital> getDr(Hospital hp);
	public int upDr(Hospital hp);	
	public int insDr(Hospital hp);
	public int insStaff(Hospital hp);
	public ArrayList<Hospital>selstf(Hospital hp);
	public ArrayList<Hospital>selhp(Hospital hp);
	public ArrayList<Hospital>seldr(Hospital hp);
	public ArrayList<Hospital>selimg(Hospital hp);
	public int uppark(Hospital hp);
	public int uphpimg(Hospital hp);
	public int upstf(Hospital hp);
	public int idcheck(Hospital hp);
	public int delstf(Hospital hp);
	public int dravil(Hospital hp);
	public ArrayList<Hospital>selpa(Hospital hp);
	public ArrayList<AuthBean> getMb(AuthBean ab);
	public ArrayList<AuthBean> getReserver(Hospital hp);
	public ArrayList<Hospital> getReview(Hospital hp);
	public ArrayList<Hospital> getDrs(Hospital hp);
	public ArrayList<Hospital> getDate(Hospital hp);
	public ArrayList<Hospital> getReList(Hospital hp);
	public ArrayList<Hospital>upHp(Hospital hp);
	public ArrayList<Hospital>delDr(Hospital hp);
	public int upReserve(Hospital hp);
	public int upReserveC(Hospital hp);
	public int upHpBreak(Hospital hp);
	public String selHpBreak(Hospital hp);
	public ArrayList<Hospital>showDoc(Hospital hp);
	public ArrayList<Hospital>docSchInfo(Hospital hp);
	public ArrayList<Hospital>getdrsDay(Hospital hp);
	public ArrayList<Hospital>data(Hospital hp);
	public ArrayList<Hospital>tmcode(Hospital hp);
	
	
	
	
 }
