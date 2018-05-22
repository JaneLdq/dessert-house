package edu.nju.dessert.dao;

import java.util.List;

import edu.nju.dessert.model.Member;
import edu.nju.dessert.vo.MemberVO;

public interface MemberDao {

	public Member getMemberByMid(String memberId);
	
	public Member getMember(int uid);

	public int getMemberLevel(int uid); 
	
	public int getMaxId();

	public boolean activate(int uid, String password, int value);

	public boolean exchangePoint(int uid, int point);

	public boolean charge(int uid, String password, int value);
	
	public int updateLevel(int uid);

	public void updateAccount(int uid, double total, double discount);

	public boolean addMember(int uid, String bankcard, String paypassword);
	
	public boolean checkBalance(int uid, double total);

    public List<MemberVO> getAllMember();

    public Double getMemberTotalCharge(int uid);

    public Double getMemberTotalConsumption(int uid);
	
}
