package icy.aog.beans;

import lombok.Data;

@Data
public class AuthBean {
	private String sCode;
	private String mWord;
	
	private String mId;
	private String mPw;
	private String mPhone;
	private String mName;
	private String mJumin;
	private String mAddr;
	//세대원 추가
	private String fName;
	private String fJumin;
	private String fPhone;
	private String fAddr;
	//관리자 회원가입시 HP테이블 INSERT 부분
	private String aHpCode;
	private String aHpName;
	private String aHpAddr;
	private String aHpPhone;
	private String aHpPark;
	private String aHpImg;
	private String aHpHt1;
	private String aHpHt2;
	private String aHpHt3;
	//관리자 회원가입시 HP테이블 STF 부분
	private String aId;
	private String aPw;
	private String aRank;
	private String aPhone;
	private String aName;
	
	private String logCode;
	private String jCode;
	private String fCode;
	private String pwCode;
	private String siName;
	private String guName;
	private String siNumber;

}
