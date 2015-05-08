package com.wecar.service.user.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wecar.common.Constant;
import com.wecar.common.SystemUtils;
import com.wecar.dao.user.IUserDao;
import com.wecar.model.user.User;
import com.wecar.model.user.UserType;
import com.wecar.service.user.IUserService;

@Service("userService")
public class UserService implements IUserService {
	@Autowired
	private IUserDao userDao;

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	@Transactional
	public String registerUser(User user) {
		try {
			User userByName = userDao.getUserByLoginId(user.getUser_name(), UserType.M);
			if (userByName != null) {
				return Constant.USERNAME_EXISTED;
			}
			User userByEmail = userDao.getUserByEmail(user.getEmail(), UserType.M);
			if (userByEmail != null) {
				return Constant.EMAIL_EXISTED;
			}
			user.setCreated_dt(new Date());
			user.setUpdated_dt(new Date());
			user.setDeleted(false);
			userDao.saveUser(user);
			return Constant.SUCCESS;
		} catch (Exception e) {
			e.fillInStackTrace();
			return Constant.FAILED;
		}
	}
	
	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> login(String userName, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userDao.getUserByLoginId(userName, UserType.M);
		if (user == null) {
			map.put("loginCode", Constant.LOGIN_USER_NOT_EXIST);
		} else {
			String encryptPWD = SystemUtils.encryptPWD(password);
			if (encryptPWD.equals(user.getPassword())) {
				map.put("loginUser", user);
			} else {
				map.put("loginCode", Constant.LOGIN_PASSWORD_INVALID);
			}
		}
		return map;
	}
}
