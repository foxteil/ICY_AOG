package icy.aog.mapper;

import java.util.ArrayList;

import icy.aog.beans.AuthBean;
import icy.aog.beans.ReservationBean;

public interface ReservationIF {

	
	public ArrayList<ReservationBean> getSearchInfo(ReservationBean rb);
	public int insReserve(ReservationBean rb);
	public ArrayList<ReservationBean> selhpInfo(ReservationBean rb);
	public ArrayList<ReservationBean> lsearchInfo(AuthBean ab);
	public ArrayList<ReservationBean> mapInfo(ReservationBean rb);
	public ArrayList<ReservationBean> resformInfo(ReservationBean rb);
	public ArrayList<ReservationBean> getFamily(ReservationBean rb);
	public ArrayList<ReservationBean> getDrsInfo(ReservationBean rb);
	public ArrayList<ReservationBean> getDrsTime(ReservationBean rb);
	public ArrayList<ReservationBean> gSearchInfo(ReservationBean rb);
	public ArrayList<ReservationBean> getPostInfo(ReservationBean rb);
	public ArrayList<ReservationBean> getbookmark(ReservationBean rb);	
	public ArrayList<ReservationBean> getDrPAInfo(ReservationBean rb);
	public ArrayList<ReservationBean> getTimecheck(ReservationBean rb);
	public ArrayList<ReservationBean> selReserve(ReservationBean rb);
}

