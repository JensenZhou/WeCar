package com.wecar.model.user;

public enum UserType {
	M("Member"), A("Admin");
	
	private String desc;

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	private UserType(String desc) {
		this.desc=desc;
	}
}
