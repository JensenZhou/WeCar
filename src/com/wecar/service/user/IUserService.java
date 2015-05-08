package com.wecar.service.user;

import java.util.Map;

import com.wecar.model.user.User;


public interface IUserService {
	public String registerUser(User user);
	public Map<String, Object> login(String userName, String password);
}
