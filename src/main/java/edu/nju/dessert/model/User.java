package edu.nju.dessert.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import edu.nju.dessert.util.DateTranslator;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	
	private String nickname;
	
	private String password;
	
	private String tel;
	
	private Date birth;
	
	private Integer sex;
	
	private String avatar;
	
	private String vip_id;
	
	private Integer default_store;
	
	private Integer default_addr;

	public User(){
		super();
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirth() {
		return DateTranslator.dateToStr(birth);
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAvatar() {
		if(avatar == null || avatar.length() == 0){
			return "/Tian/img/avatar.jpg";
		}
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getVip_id() {
		return vip_id;
	}

	public void setVip_id(String vip_id) {
		this.vip_id = vip_id;
	}

	public Integer getDefault_store() {
		return default_store;
	}

	public void setDefault_store(Integer default_store) {
		this.default_store = default_store;
	}

	public Integer getDefault_addr() {
		return default_addr;
	}

	public void setDefault_addr(Integer default_addr) {
		this.default_addr = default_addr;
	}

	
}
