package edu.nju.dessert.vo;

public class StaffVO {

    private int id;
    
	private String sid;
	
	private String name;
	
	private String tel;
	
	private String password;
	
	private Integer store_id;
	
	private Integer position;
	
	private String storeName;
	
	public StaffVO(){}
	
	public StaffVO(int id, String sid, String name, String tel, String password, Integer store_id, Integer position, String storeName){
		this.id = id;
	    this.sid = sid;
		this.name = name;
		this.tel = tel;
		this.password = password;
		this.store_id = store_id;
		this.position = position;
		this.storeName = storeName;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Integer getStore_id() {
		return store_id;
	}

	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	
	
}
