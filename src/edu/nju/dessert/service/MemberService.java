package edu.nju.dessert.service;

import java.util.List;

import edu.nju.dessert.model.Member;
import edu.nju.dessert.vo.MemberVO;

public interface MemberService {

	public Member getMemberByMid(String memberId);
	
	public Member getMember(int uid);

	public boolean addMember(int id, String bankcard, String paypassword);

	public boolean charge(int uid, String password, int value);
	
	public int updateLevel(int uid);

	public boolean activate(int uid, String password, int value);

	public boolean exchangePoint(int uid, int point);

    public List<MemberVO> getAllMember();
	
}
