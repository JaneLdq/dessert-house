package edu.nju.dessert.service;

import java.util.Date;
import java.util.List;

import edu.nju.dessert.vo.PlanCreatorVO;
import edu.nju.dessert.vo.PlanItemVO;
import edu.nju.dessert.vo.PlanUpdatorVO;
import edu.nju.dessert.vo.PlanVO;

public interface PlanService {

	public List<PlanVO> getPlanByStore(int sid);

	public List<PlanVO> getAllPlan();
	
	public Date getLatestDate(int sid);

	public boolean addPlans(List<PlanCreatorVO> planList);

    public PlanVO getPlanById(int pid);
    
    public List<PlanItemVO> getPlanItemByPlanId(int pid);

    public boolean updatePlan(PlanUpdatorVO plan);

    public boolean passPlan(int id);

    public boolean rejectPlan(int id);
    
    public Long getTotalNum();
	
}
