package edu.nju.dessert.vo;

import java.util.Date;

import edu.nju.dessert.util.DateTranslator;

public class MemberVO {

    private int id;
    
    private int uid;
    
    private int level;
    
    private String mid;
    
    private String name;
    
    private Date birth;
    
    private int sex;
    
    private String address;
    
    private Double charge;
    
    private Double consumption;
    
    private int point;
    
    private int state;
    
    public MemberVO(){}
    
    public MemberVO(int id, int uid, int level, String mid, String name, Date birth, int sex, String address, int point, int state){
        this.id = id;
        this.uid = uid;
        this.level = level;
        this.mid = mid;
        this.name = name;
        this.birth = birth;
        this.sex = sex;
        this.address = address;
        this.point = point;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirth() {
        return DateTranslator.dateToStr(birth);
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getCharge() {
        return charge;
    }

    public void setCharge(Double charge) {
        this.charge = charge;
    }

    public Double getConsumption() {
        return consumption;
    }

    public void setConsumption(Double consumption) {
        this.consumption = consumption;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    
    
}
