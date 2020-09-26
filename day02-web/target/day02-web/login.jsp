<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-16
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/bootstrap.css" />
    <style type="text/css">

    </style>
</head>
<body>
<div class="container">
    <form method="post" class="form-horizontal">

        <div class="form-group" >
            <label for="exampleInputEmail1" class="col-md-1">User:</label>
            <div class="col-md-11">
                <input type="text" id="account" name="account" class="form-control" style="width: 40%;" id="exampleInputEmail1" placeholder="请输入用户名">
            </div>
        </div>

        <div class="form-group">
            <label for="exampleInputPassword1" class="col-md-1">Password:</label>
            <div class="col-md-11">
            <input type="password" id="pwd" name="pwd" class="form-control" style="width: 40%;" id="exampleInputPassword1" placeholder="请输入密码">
            </div>
            </div>

        <div class="form-group">
            <button id="sub" type="button" class="btn btn-primary btn-block col-md-3 col-md-offset-2" style="width: 30%;">登录</button>
            <button id="register" type="button" class="btn btn-primary btn-block col-md-3 col-md-offset-2" style="width: 30%;">注册</button>
        </div>



    </form>
</div>

<script type="text/javascript">


    $("#register").click(function () {

        window.location="register.jsp";
    })

    $("#sub").click(function () {


      /*  $.post("login.action",{"account":$("#account").val(),"pwd":$("#pwd").val()},function (data) {
            if(data=="登录成功"){
                window.location="showUser.jsp";
            }
        },"text")*/

        $("form").ajaxSubmit({
            url:"login.action",
            dataType:"text",
            success:function (data) {

            alert(data);
            if(data=="登录成功"){
                window.location="showUser.jsp";
            }
        }
    })
    })


</script>
</body>
</html>
