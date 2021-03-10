package icy.aog.mapper;

import java.util.ArrayList;

import icy.aog.beans.ReservationBean;

public interface ReservationIF {

	
	public ArrayList<ReservationBean> getSearchInfo(ReservationBean rb);
	public int insReserve(ReservationBean rb);
	public ArrayList<ReservationBean> selhpInfo(ReservationBean rb);
	public ArrayList<ReservationBean> lsearchInfo(ReservationBean rb);
	public ArrayList<ReservationBean> lguInfo(ReservationBean rb);
}
