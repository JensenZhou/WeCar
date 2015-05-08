package com.wecar.dao.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.wecar.dao.BaseDao;
import com.wecar.dao.user.IUserDao;
import com.wecar.model.user.User;
import com.wecar.model.user.UserType;

@Repository("userDao")
public class UserDao extends BaseDao<User> implements IUserDao {
	
	@Override
	public User getUserByLoginId(String userName, UserType type) {
		Map<String, String> aliasParams = new HashMap<String, String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_name", userName);
		params.put("type", type);
		List<User> userList = getObjectsByParam(User.class, aliasParams, params);
		if (userList != null && userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}
	
	@Override
	public User getUserByEmail(String email, UserType type) {
		Map<String, String> aliasParams = new HashMap<String, String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		params.put("type", type);
		List<User> userList = getObjectsByParam(User.class, aliasParams, params);
		if (userList != null && userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}
	
	@Override
	public User getUserByCellphone(String cellphone, UserType type) {
		Map<String, String> aliasParams = new HashMap<String, String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cellphone", cellphone);
		params.put("type", type);
		List<User> userList = getObjectsByParam(User.class, aliasParams, params);
		if (userList != null && userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}

	@Override
	public User getUserByLoginIdAndPassword(String userName, String password, 
			UserType type) {
		Map<String, String> aliasParams = new HashMap<String, String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_name", userName);
		params.put("password", password);
		params.put("type", type);
		List<User> userList = getObjectsByParam(User.class, aliasParams, params);
		if (userList != null && userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}

	@Override
	public void saveUser(User user) {
		insertObject(user);
	}

	@Override
	public User getUserById(int userId) {
		return getObjectById(User.class, userId);
	}

	@Override
	public void updateUser(User user) {
		update(user);
	}
	
	@Override
	public void deleteUser(User user) {
		delete(user);
	}

}
