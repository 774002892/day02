<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-16
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/bootstrap-table.js"></script>

    <script type="text/javascript" src="js/bootstrap-table-zh-CN.js"></script>


    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-table.css">
</head>
<body>

<div class="container">


    <table id="tab" class="table">
        <%--
            <tr>
                <td>id</td>
                <td>姓名</td>
                <td>用户名</td>
                <td>密码</td>
                <td>身高</td>
                <td>生日</td>
                <td>操作</td>
            </tr>--%>

    </table>

    <div class="modal fade" id="addUserModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改用户资料</h4>
                </div>

                <div class="modal-body">

<form id="updateUser-form" method="post" class="form-horizontal">
    <input type="hidden" name="id" id="updateUserId">
                    <div class="form-group">
                        <label for="updateUsername" class="control-label col-md-2 text-right">姓名:</label>
                        <div class="col-md-10">
                        <input type="text" name="name"  id="updateUsername"  class="form-control"
                               placeholder="姓名"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="updateUserAccount" class="control-label col-md-2 text-right" >账号:</label>
                        <div class="col-md-10 ">
                        <input type="text" name="account" id="updateUserAccount" class="form-control" >
                    </div>
                    </div>

                    <div class="form-group">
                        <label for="updateUserPwd" class="control-label col-md-2 text-right">密码:</label>
                        <diV class="col-md-10 ">
                        <input type="text" name="pwd" id="updateUserPwd" class="form-control">
                        </diV>
                    </div>

                    <div class="form-group">
                        <label for="updateUserHeight" class="control-label col-md-2 text-right">身高</label>
                        <div class="col-md-10">
                            <input type="text" name="height" id="updateUserHeight" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="updateUserBirthday" class="control-label col-md-2 text-right">生日:</label>
                        <div class="col-md-10">
                            <input type="date" name="birthday" id="updateUserBirthday" class="form-control">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span
                                class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                        </button>
                        <button type="button" id="updatebtn_submit" class="btn btn-primary" data-dismiss="modal"><span
                                class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                        </button>
                    </div>

</form>
                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript">

    /* $.post("queryAllUser.action",function (data) {

         for(var i=0;i<data.length;i++){

         $("#tab").append("<tr><td>"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data[i].account+"</td><td>"+data[i].pwd+"</td><td>"+data[i].height+"</td><td>"+data[i].birthday+"</td><td><button type='button' class='btn btn-primary' onclick=''>修改</button>&nbsp;<button type='button' class='btn btn-primary' onclick=''>删除</button></td></tr>")
         }
     },"json")
 */



        $("#tab").bootstrapTable({
            url: "queryAllUser.action",                      //请求后台的URL（*）
            method: 'GET',                      //请求方式（*）
            //toolbar: '#toolbar',              //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 2,                     //每页的记录行数（*）
            pageList: [2,4],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
          /*  uniqueId: "ID",                     //每一行的唯一标识，一般为主键列*/
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            //得到查询的参数
            queryParams: function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    page: (params.offset / params.limit) + 1,   //页码

                };
                return temp;
            },
            columns: [{
                checkbox: true,
                visible: true                  //是否显示复选框
            }, {
                field: 'id',
                title: 'id',
                sortable: true
            }, {
                field: 'name',
                title: '姓名',
                sortable: true
            }, {
                    field: 'account',
                    title: '用户名',
                    sortable: true
             }, {
                    field: 'pwd',
                    title: '密码',
                    sortable: true
             }, {
                    field: 'height',
                    title: '身高',
                    sortable: true
             }, {
                    field: 'birthday',
                    title: '生日',
                    sortable: true
             },{
                field: '',
                title: '操作',
                formatter:function (value,row,index) {

                    var id =row.id;
                    return '<button class=\"btn btn-success\"  onclick=\"edituser('+id+')\" >编辑</button>&nbsp;' +
                        '<button class=\"btn btn-danger\" onclick=\"deluser('+id+')\" >删除</button>';
                }
            }

            ],
         /*   onLoadSuccess: function () {
            },
            onLoadError: function () {
                showTips("数据加载失败！");
            },
            onDblClickRow: function (row, $element) {
                var id = row.ID;
                EditViewById(id, 'view');
            },*/
        });



        function edituser(id) {

            $("#addUserModal").modal('show');
            $.post("queryUserById.action",{"id":id},function (data) {

             $("#updateUserId").val(data.id);
             $("#updateUsername").val(data.name);
             $("#updateUserAccount").val(data.account);
             $("#updateUserPwd").val(data.pwd);
             $("#updateUserHeight").val(data.height);
             $("#updateUserBirthday").val(data.birthday);

            },"json");
        }

        $("#updatebtn_submit").click(function () {

            $("#updateUser-form").ajaxSubmit({
                url:"updateUser.action",
                dataType:"text",
                success:function (data) {

                    $("#tab").bootstrapTable("refresh");
                    alert(data);
                }
            });

        })

        function deluser(id){

            $.post("deleteUser.action",{"id":id},function (data) {

                $("#tab").bootstrapTable("refresh");
                alert(data);
            },"text");

        }


</script>
</body>
</html>
