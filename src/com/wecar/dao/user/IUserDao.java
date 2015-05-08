package com.wecar.dao.user;

import com.wecar.model.user.User;
import com.wecar.model.user.UserType;

public interface IUserDao {
	
	public User getUserByLoginId(String userName, UserType type);
	
	public User getUserByEmail(String email, UserType type);
	
	public User getUserByCellphone(String cellphone, UserType type);
	
	public User getUserByLoginIdAndPassword(String userName, String password, 
			UserType type);
	
	public void saveUser(User user);
	
	public User getUserById(int userId);
	
	public void updateUser(User user);
	
	public void deleteUser(User user);
}
