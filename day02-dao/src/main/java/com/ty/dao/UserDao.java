package com.ty.dao;

import com.ty.vo.User;

import java.util.List;

public interface UserDao {

    List<User> queryAllUser(User user);



    int queryAllUserCount(User user);

    User queryUserById(int id);

    User userLogin(User user);

    int registerUser(User user);

    int deleteUser(int id);

    int updateUser(User user);

}
