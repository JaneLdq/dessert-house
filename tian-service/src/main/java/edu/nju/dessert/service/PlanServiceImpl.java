package edu.nju.dessert.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.dessert.dao.PlanDao;
import edu.nju.dessert.vo.PlanCreatorVO;
import edu.nju.dessert.vo.PlanItemVO;
import edu.nju.dessert.vo.PlanUpdatorVO;
import edu.nju.dessert.vo.PlanVO;

@Service
public class PlanServiceImpl implements PlanService {

	private PlanDao planDao;
	
	public void setPlanDao(PlanDao planDao) {
		this.planDao = planDao;
	}
	
	@Override
	public List<PlanVO> getPlanByStore(int sid) {
		return planDao.getPlanByStoreId(sid);
	}

	@Override
	public List<PlanVO> getAllPlan() {
		return planDao.getAllPlan();
	}

	@Override
	public Date getLatestDate(int sid) {
		return planDao.getLatestDate(sid);
	}

	@Override
	@Transactional
	public boolean addPlans(List<PlanCreatorVO> planList) {
		boolean result = true;
		for(int i=0; i<planList.size(); i++){
			PlanCreatorVO vo = planList.get(i);
			int planId = planDao.addPlan(vo.getSid(), vo.getDate());
			System.out.println(planId + vo.getSid() + vo.getDate());
			if(planId > 0){
				result = planDao.addPlanItem(planId, vo.getSid(), vo.getItems());
			}
		}
		return result;
	}

    @Override
    public PlanVO getPlanById(int pid) {
        return planDao.getPlanById(pid);
    }

    @Override
    public List<PlanItemVO> getPlanItemByPlanId(int pid) {
        return planDao.getPlanItemByPlanId(pid);
    }

    @Override
    @Transactional
    public boolean updatePlan(PlanUpdatorVO plan) {
        return planDao.updatePlan(plan);
    }

    @Override
    public boolean passPlan(int id) {
        return planDao.passPlan(id);
    }

    @Override
    public boolean rejectPlan(int id) {
        return planDao.rejectPlan(id);
    }

    @Override
    public Long getTotalNum() {
        return planDao.getTotalNum();
    }
    
    

}
