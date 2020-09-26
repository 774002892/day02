package com.ty.controller;

import com.ty.service.UserService;
import com.ty.vo.PageVo;
import com.ty.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login.action",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String login(User user){


        System.out.println(user);

        User user1=userService.userLogin(user);

        if(user1!=null){
            System.out.println("登录成功");
            return "登录成功";

        }
        System.out.println("登录失败");
        return "登录失败";
    }



    @RequestMapping(value = "/register.action",produces = "text/json;charset=utf-8")
    @ResponseBody
    public String register(User user){

        int num=userService.registerUser(user);

        if(num!=0){

            return "注册成功";
        }

        return "注册失败";
    }

    @RequestMapping("queryAllUser.action")
    @ResponseBody
    public PageVo<User> queryAllUser(User user,
                                     @RequestParam(value = "page",defaultValue = "1")int page,
                                     @RequestParam(value = "rows",defaultValue="2") int rows){


        System.out.println("page="+page);
        System.out.println("rows="+rows);

        return userService.queryAllUser(user,page,rows);
    }


    @RequestMapping("queryUserById.action")
    @ResponseBody
    public User queryUserById(int id){

        return userService.queryUserById(id);
    }


    @RequestMapping(value = "deleteUser.action",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteUser(int id){

        int num=userService.deleteUser(id);

        if(num!=0){

            return "删除成功";
        }

        return "删除失败";
    }



    @RequestMapping(value = "updateUser.action",produces = "text/json;charset=utf-8")
    @ResponseBody
    public String updateUser(User user){

        int num=userService.updateUser(user);
        if(num!=0){

            return "修改成功";
        }

        return "修改失败";
    }



}
