<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>

<head>

    <base href="<%=basePath%>" />
    <title>Title</title>
    <link href="static/jquery/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="static/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function(){

            var names = "${data.names}".replaceAll("[","").replaceAll("]","").split(",");
            var oldData = "${data.oldData}".replaceAll("[","").replaceAll("]","").split(",");
            var newData = "${data.newData}".replaceAll("[","").replaceAll("]","").split(",");


            var html = '';

            var count = 40;
            for (var i = 0;i < names.length;i ++) {

                html += '<div style="position: relative; left: 40px; height: 30px; top: '+count+'px;">';
                html += '<div style="width: 300px; color: gray;">修改项</div>';
                html += '<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>&nbsp;'+names[i]+'</b></div>';
                html += '<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">修改前</div>';
                html += '<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>&nbsp;'+oldData[i]+'</b></div>';
                html += '<div style="width: 300px;position: relative; left: 900px; top: -80px; color: gray;">修改后</div>';
                html += '<div style="width: 300px;position: relative; left: 1100px; top: -100px;"><b>&nbsp;'+newData[i]+'</b></div>';
                html += '<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -100px;"></div>';
                html += '<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -100px; left: 450px;"></div>';
                html += '<div style="height: 1px; width: 400px; background: red; position: relative; top: -100px; left: 900px;"></div>';
                html += '</div>';

                count += 20;

            }

            $("#targetDiv").append(html);

            // 删除
            $("#del-btn").click(function () {

                if (confirm("确认删除？")) {

                    $.ajax({

                        url : "workbench/stock/logDel.do",
                        data : {
                            "id" : "${data.logStock.id}"
                        },
                        type : "get",
                        dataType : "json",
                        success : function (data) {

                            if (data.success) {

                                alert(data.message);

                                window.location.href="workbench/stock/log.jsp";

                            } else {

                                alert(data.message);

                            }
                        }
                    })
                }
            })
        })
    </script>
</head>
<body>

<!-- 返回按钮 -->
<div style="position: relative; top: 35px; left: 10px;">
    <a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left" style="font-size: 20px; color: #DDDDDD"></span></a>
</div>

<!-- 大标题 -->
<div style="position: relative; left: 40px; top: -30px;">
    <div class="page-header">
        <h3>库存日志 <small>${data.logStock.editBy} - ${data.logStock.editTime} </small></h3>
    </div>
    <div style="position: relative; height: 50px; width: 250px;  top: -72px; left: 700px;">
        <button type="button" class="btn btn-danger" id="del-btn"><span class="glyphicon glyphicon-minus"></span> 删除</button>
    </div>
</div>

<!-- 详细信息 -->
<div style="position: relative; top: -70px;"  id="targetDiv">
    <div style="position: relative; left: 40px; height: 30px;">
        <div style="width: 300px; color: gray;">修改人</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>&nbsp;${data.logStock.editBy}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">修改时间</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>&nbsp;${data.logStock.editTime}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>

    <div style="position: relative; left: 40px; height: 30px; top: 20px;">
        <div style="width: 300px; color: gray;">园区</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>&nbsp;${data.stock.parkId}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">冷库号</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>&nbsp;${data.stock.freezerId}</b></div>
        <div style="width: 300px;position: relative; left: 900px; top: -80px; color: gray;">品种</div>
        <div style="width: 300px;position: relative; left: 1100px; top: -100px;"><b>&nbsp;${data.stock.type}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -100px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -100px; left: 450px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -100px; left: 900px;"></div>
    </div>
</div>
<div style="height: 200px;"></div>
</body>
</html>