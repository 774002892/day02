<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-17
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册用户</title>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>

    <div class="container">
        <form class="form-horizontal">
            <div class="row">
                <fieldset class="col-md-6 col-md-offset-3">
                    <legend>登录</legend>

                    <div class="form-group has-error has-feedback">
                        <label class="control-label col-md-2" for="username">用户名：</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" name="username" id="username" placeholder="请输入用户名" />
                            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        </div>

                    </div>

                    <div class="form-group has-success has-feedback">
                        <label class="control-label col-md-2" for="pwd">密码：</label>
                        <div class="col-md-10">
                            <input class="form-control" type="password" name="pwd" id="pwd" placeholder="请输入密码"/>
                            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                        </div>

                    </div>

                    <br>
                    <div class="row">
                        <input id="register" type="button" value="注册" class="btn btn-warning col-md-3 col-md-offset-2" />
                    </div>


                </fieldset>
            </div>


        </form>

    </div>

<script type="text/javascript">

    $("#register").click(function () {

        $("form").ajaxSubmit({
            url:"register.action",
            dataType:"text",
            success:function (data) {
                alert(data);
                if (data == "注册成功") {
                    window.location = "login.jsp";
                }
            }
        })

    })

</script>

</body>
</html>
