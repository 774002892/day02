<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-18
  Time: 16:46
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
    <script src="js/echarts.js"></script>
</head>
<body>

<div class="container">

    <div class="row">

        <div class="col-md-2">
        <div class="media">
            <div class="media-left" style="padding-right: 0px">
                <img src="images/1.png" style="width: 64px;" />
            </div>
            <div class="media-body bg-success text-center">
                <h4>5</h4>消息数
            </div>
        </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left" style="padding-right: 0px">
                    <img src="images/2.png" style="width: 64px">
                </div>
                <div class="media-body bg-success text-center">
                    <h4>10</h4>新增数
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left" style="padding-right: 0px">
                    <img src="images/3.png" style="width: 64px">
                </div>
                <div class="media-body bg-success text-center">
                    <h4>15</h4>用户总数
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left" style="padding-right: 0px">
                    <img src="images/4.png" style="width: 64px">
                </div>
                <div class="media-body bg-success text-center">
                    <h4>20</h4>图片总数
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div class="media">
                <div class="media-left" style="padding-right: 0px">
                    <img src="images/5.png" style="width: 64px">
                </div>
                <div class="media-body bg-success text-center">
                    <h4>18</h4>待审核文章
                </div>
            </div>
        </div>

    </div>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 30]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

</body>
</html>
