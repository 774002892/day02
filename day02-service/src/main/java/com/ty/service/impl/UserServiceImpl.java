package com.ty.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ty.dao.UserDao;
import com.ty.service.UserService;
import com.ty.vo.PageVo;
import com.ty.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    UserDao userDao;

    @Override
    public PageVo<User> queryAllUser(User user, int page, int rows) {

        PageVo<User> pageVo=new PageVo<User>();

        PageHelper.startPage(page,rows);
        pageVo.setRows(userDao.queryAllUser(user));

        pageVo.setTotal(userDao.queryAllUserCount(user));

        return pageVo;
    }

    @Override
    public User queryUserById(int id) {
        return userDao.queryUserById(id);
    }

    @Override
    public User userLogin(User user) {
        return userDao.userLogin(user);
    }

    @Override
    public int registerUser(User user) {


        return userDao.registerUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }
}
