<%@ page contentType="text/html;charset=UTF-8"%>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>>">
    <link href="static/jquery/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="icon" href="static/image/logo.png">
    <script type="text/javascript" src="static/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(function () {

            // 修改密码
            $("#editPwdBtn").click(function () {

                var oldPwd = $.trim($("#oldPwd").val());

                $.ajax({

                    url : "settings/user/password.do",
                    data : {
                        "oldPwd" : oldPwd
                    },
                    type : "post",
                    dataType : "json",
                    success : function (data) {

                        if (!data.success) {

                            $("#oldPwd-span").html("密码错误！");

                        } else {

                            $("#oldPwd-span").html("");

                            var newPwd = $.trim($("#newPwd").val());
                            var confirmPwd = $.trim($("#confirmPwd").val());

                            if (confirmPwd !== newPwd) {

                                $("#confirmPwd-span").html("两次输入的密码不一致！");

                            } else {

                                $("#confirmPwd-span").html("");

                                $.ajax({

                                    url : "settings/user/editPwd.do",
                                    data : {

                                        "newPwd" : newPwd,

                                    },
                                    type : "post",
                                    dataType : "json",
                                    success : function (data) {

                                        if (data.success) {

                                            alert("密码修改成功，请重新登陆！");

                                            $("#editPwdModal").modal("hide");

                                            window.location.href = "index.html";

                                        } else {

                                            alert(data.message);

                                        }
                                    }
                                })

                            }

                        }
                    }
                })
            })

        })

        // 修改密码
        function editPassword() {

            // 清空填写项
            $("#oldPwd").val("");
            $("#newPwd").val("");
            $("#confirmPwd").val("");

            // 打开模态窗口
            $("#editPwdModal").modal("show");

            // 验证原密码
            oldPwd();

            // 验证新密码
            $("#confirmPwd").blur(function () {

                var newPwd = $.trim($("#newPwd").val());
                var confirmPwd = $.trim($("#confirmPwd").val());

                if (confirmPwd !== newPwd) {

                    $("#confirmPwd-span").html("两次输入的密码不一致！");

                } else {

                    $("#confirmPwd-span").html("");

                }
            })
        }

        // 验证原密码
        function oldPwd() {

            $("#oldPwd").blur(function () {

                var oldPwd = $.trim($("#oldPwd").val());

                $.ajax({

                    url : "settings/user/password.do",
                    data : {
                        "oldPwd" : oldPwd
                    },
                    type : "post",
                    dataType : "json",
                    success : function (data) {

                        if (!data.success) {

                            $("#oldPwd-span").html("密码错误！");

                        } else {

                            $("#oldPwd-span").html("");

                        }
                    }
                })
            })
        }
    </script>
    <title>工作台</title>

</head>
<body>

<!-- 我的资料 -->
<div class="modal fade" id="myInformation" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">我的资料</h4>
            </div>
            <div class="modal-body">
                <div style="position: relative; left: 40px;">
                    姓名：<b>${sessionScope.user.name}</b><br><br>
                    登录帐号：<b>${sessionScope.user.id}</b><br><br>
                    所属园区：<b>${sessionScope.user.parkId}</b><br><br>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改密码的模态窗口 -->
<div class="modal fade" id="editPwdModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="oldPwd" class="col-sm-2 control-label">原密码</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="oldPwd" style="width: 200%;">
                            <span id="oldPwd-span" style="color: #ac2925;"></span>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="newPwd" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="newPwd" style="width: 200%;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPwd" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="confirmPwd" style="width: 200%;">
                            <span id="confirmPwd-span" style="color: #ac2925;"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="editPwdBtn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 退出系统的模态窗口 -->
<div class="modal fade" id="exitModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">离开</h4>
            </div>
            <div class="modal-body">
                <p>您确定要退出系统吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='index.html';">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 顶部 -->
<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
    <div style="position: absolute; top: 5px; left: 0px; font-size: 25px; font-weight: 400; color: white; font-family: 'times new roman'">Stock &nbsp;<span style="font-size: 12px;">&copy;2021&nbsp;七河生物</span></div>
    <div style="position: absolute; top: 15px; right: 15px;">
        <ul>
            <li class="dropdown user-dropdown">
                <a href="javascript:void(0)" style="text-decoration: none; color: white;" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span> ${sessionScope.user.name} <span class="caret"></span>
                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <ul class="dropdown-menu">
                    <li><a href="javascript:void(0)" data-toggle="modal" data-target="#myInformation"><span class="glyphicon glyphicon-file"></span> 我的资料</a></li>
                    <li><a href="javascript:void(0)" onclick="editPassword()"><span class="glyphicon glyphicon-edit"></span> 修改密码</a></li>
                    <li><a href="javascript:void(0);" data-toggle="modal" data-target="#exitModal"><span class="glyphicon glyphicon-off"></span> 退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<!-- 中间 -->
<div id="center" style="position: absolute;top: 50px; bottom: 30px; left: 0px; right: 0px;">

    <!-- 导航 -->
    <div id="navigation" style="left: 0px; width: 10%; position: relative; height: 100%; overflow:auto;">

        <ul id="no1" class="nav nav-pills nav-stacked">
            <li class="liClass"><a href="workbench/main/index.jsp" target="workAreaFrame"><span class="glyphicon glyphicon-home"></span> 用户首页</a></li>
            <li class="liClass"><a href="workbench/stock/add.jsp" target="workAreaFrame"><span class="glyphicon glyphicon-upload"></span> 库存录入</a></li>
            <li class="liClass"><a href="workbench/stock/list.jsp" target="workAreaFrame"><span class="glyphicon glyphicon-th-list"></span> 库存列表</a></li>
            <li class="liClass"><a href="javascript:void(0);" target="workAreaFrame"><span class="glyphicon glyphicon-user"></span> 用户管理</a></li>
        </ul>

        <!-- 分割线 -->
        <div id="divider1" style="position: absolute; top : 0px; right: 0px; width: 1px; height: 100% ; background-color: #B3B3B3;"></div>
    </div>

    <!-- 工作区 -->
    <div id="workarea" style="position: absolute; top : 0px; left: 10%; width: 90%; height: 100%;">
        <iframe style="border-width: 0px; width: 100%; height: 100%;" name="workAreaFrame"></iframe>
    </div>

</div>

<div id="divider2" style="height: 1px; width: 100%; position: absolute;bottom: 30px; background-color: #B3B3B3;"></div>

<!-- 底部 -->
<div id="down" style="height: 30px; width: 100%; position: absolute;bottom: 0px;"></div>

<script type="text/javascript" src="static/js/workbench/index.js"></script>
</body>
</html>