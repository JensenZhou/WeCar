package com.wecar.model.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.wecar.model.BaseObject;

@Entity
@Table(name="`user`")
@Where(clause="deleted='0'")
public class User extends BaseObject{
	
	private String user_name;
	
	private String id_card;
	
	private String email;
	
	private String cellphone;
	
	private String password;
	
	private boolean id_verified;
	
	private boolean email_verified;
	
	private boolean cellphone_verified;
	
	@Enumerated(EnumType.STRING)
	@Column(name="user_type")
	private UserType type;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getId_card() {
		return id_card;
	}

	public void setId_card(String id_card) {
		this.id_card = id_card;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isId_verified() {
		return id_verified;
	}

	public void setId_verified(boolean id_verified) {
		this.id_verified = id_verified;
	}

	public boolean isEmail_verified() {
		return email_verified;
	}

	public void setEmail_verified(boolean email_verified) {
		this.email_verified = email_verified;
	}

	public boolean isCellphone_verified() {
		return cellphone_verified;
	}

	public void setCellphone_verified(boolean cellphone_verified) {
		this.cellphone_verified = cellphone_verified;
	}

	public UserType getType() {
		return type;
	}

	public void setType(UserType type) {
		this.type = type;
	}

	
}
