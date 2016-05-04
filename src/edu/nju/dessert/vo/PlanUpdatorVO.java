package edu.nju.dessert.vo;

import java.util.List;

public class PlanUpdatorVO {

    private int pid;
    
    private List<PlanItemVO> items;
    
    public PlanUpdatorVO() {}

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public List<PlanItemVO> getItems() {
        return items;
    }

    public void setItems(List<PlanItemVO> items) {
        this.items = items;
    }
    
    
}
