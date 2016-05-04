package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import edu.nju.dessert.vo.PlanItemVO;
import edu.nju.dessert.vo.PlanUpdatorVO;
import edu.nju.dessert.vo.PlanVO;

public interface PlanDao {

	public boolean updateDessertRemain(int dessertId, int storeId, int quantity, Date date);
	
	public List<PlanVO> getPlanByStoreId(int sid);
	
	public List<PlanVO> getAllPlan();

	public Date getLatestDate(int sid);

	public int addPlan(int sid, String date);
	
	public boolean addPlanItem(int plan_id, int store_id, List<PlanItemVO> items);

    public PlanVO getPlanById(int pid);

    public List<PlanItemVO> getPlanItemByPlanId(int pid);

    public boolean updatePlan(PlanUpdatorVO plan);

    public boolean passPlan(int id);

    public boolean rejectPlan(int id);
    
    public Long getTotalNum();
	
}
