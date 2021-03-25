package icy.aog.mapper;

import java.util.ArrayList;

import icy.aog.beans.ReservationBean;
import icy.aog.services.Reservation;

public interface MypageIF {
	public ReservationBean isMInfo(ReservationBean rv);
	public ArrayList<ReservationBean> isFaInfo(ReservationBean rv);
	public ReservationBean isPassword(ReservationBean rv);
	public ReservationBean upMember(ReservationBean rv);
	public ReservationBean upFamily(ReservationBean rv);
	public ReservationBean delFamily(ReservationBean rv);
	public int countFaInfo(ReservationBean rv);
	public ReservationBean adUpFamily(ReservationBean rv);
	public ReservationBean pwSelect(ReservationBean rv);
	public int countFa(ReservationBean rv);
	public ReservationBean updFamily(ReservationBean rv);
	public ArrayList<ReservationBean> isNull(ReservationBean rv); 
	public ArrayList<ReservationBean> isPart(ReservationBean rv); 
	public int countBk(ReservationBean rv);
	public int countBkt(ReservationBean rv);
	public ReservationBean insBk(ReservationBean rv);
	public ReservationBean delBk(ReservationBean rv);
	public ArrayList<ReservationBean> reInfo(ReservationBean rv);
	public ArrayList<ReservationBean> rvInfo(ReservationBean rv);
	public ArrayList<ReservationBean> myReview(ReservationBean rv); //추가
	public ReservationBean insReview(ReservationBean rv);
	public ReservationBean infoReview (ReservationBean rv);
	public ReservationBean updStCode (ReservationBean rv);
	public ArrayList<ReservationBean> isBkList(ReservationBean rv);
	//추가
	public ArrayList<ReservationBean> isTdList(ReservationBean rv);
	public ArrayList<ReservationBean> islTime(ReservationBean rv);
	
	
	
}
