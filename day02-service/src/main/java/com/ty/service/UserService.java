package com.ty.service;

import com.ty.vo.PageVo;
import com.ty.vo.User;

import java.util.List;

public interface UserService {


    PageVo<User> queryAllUser(User user, int page, int rows);

    User queryUserById(int id);

    User userLogin(User user);

    int registerUser(User user);

    int deleteUser(int id);

    int updateUser(User user);
}
