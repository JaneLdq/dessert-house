package edu.nju.dessert.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.dessert.dao.MemberDao;
import edu.nju.dessert.model.Member;
import edu.nju.dessert.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public Member getMemberByMid(String memberId) {
		return memberDao.getMemberByMid(memberId);
	}

	@Override
	public Member getMember(int uid) {
		return memberDao.getMember(uid);
	}

	@Override
	public boolean addMember(int id, String bankcard, String paypassword) {
		return memberDao.addMember(id, bankcard, paypassword);
	}

	@Override
	public boolean charge(int uid, String password, int value) {
		return memberDao.charge(uid, password, value);
	}

	@Override
	public int updateLevel(int uid) {
		return memberDao.updateLevel(uid);
	}

	@Override
	public boolean activate(int uid, String password, int value) {
		return memberDao.activate(uid, password, value);
	}

	@Override
	@Transactional
	public boolean exchangePoint(int uid, int point) {
		return memberDao.exchangePoint(uid, point);
	}

    @Override
    public List<MemberVO> getAllMember() {
        List<MemberVO> list =  memberDao.getAllMember();
        for(MemberVO vo: list){
            Double charge = memberDao.getMemberTotalCharge(vo.getUid());
            Double consumption = memberDao.getMemberTotalConsumption(vo.getUid());
            vo.setCharge(charge);
            vo.setConsumption(consumption);
        }
        return list;
    }

}
