<%@ page contentType="text/html;charset=UTF-8"%>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link href="static/jquery/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="icon" href="static/image/logo.png">
    <script type="text/javascript" src="static/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {

            // 设置顶层窗口
            if (window.top !== window) {

                window.top.location = window.location;

            }

            // 界面打开时用户名自动获得焦点
            const $username = $("#username");
            $username.val("");
            $username.focus();

            //点击登录按钮验证登录
            $("#loginBtn").click(function () {

                login();

            })

            // 捕捉回车键验证登录
            $(window).keydown(function (event) {

                if (event.key === "Enter") {

                    login();

                }

            })

            // 验证登录的方法
            function login() {

                // 用户名和密码不能为空(去除前后空白)
                const username = $.trim($username.val());
                const password = $.trim($("#password").val());

                if (username === "" || password === "") {

                    $("#msg").html("用户名和密码不能为空！");
                    return false;

                }

                // ajax验证登录合法性
                $.ajax({

                    url : "settings/user/login.do",
                    data : {
                        "username" : username,
                        "password" : password
                    },
                    type : "post",
                    dataType : "json",
                    success : function (data) {

                        if (data.success) {

                            // 验证成功跳转至工作界面
                            window.location.href = "workbench/index.jsp";

                        } else {

                            $("#msg").html(data.message);

                        }
                    }
                })
            }

        })
    </script>
    <title>登录</title>
</head>
<body>
<div style="position: absolute; top: 0px; left: 0px; width: 60%; height: 850px">
    <img src="static/image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;" alt="图片加载中...">
</div>
<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
    <div style="position: absolute; top: 5px; left: 0px; font-size: 25px; font-weight: 400; color: white; font-family: 'times new roman'">Stock&nbsp;<span style="font-size: 12px;">&copy;2021&nbsp;七河生物</span></div>
</div>

<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
    <div style="position: absolute; top: 0px; right: 60px;">
        <div class="page-header">
            <h1>登录</h1>
        </div>
        <form action="" class="form-horizontal" role="form">
            <div class="form-group form-group-lg">
                <div style="width: 350px;">
                    <input class="form-control" type="text" placeholder="用户名" id="username">
                </div>
                <div style="width: 350px; position: relative;top: 20px;">
                    <input class="form-control" type="password" placeholder="密码" id="password">
                </div>
                <div class="checkbox"  style="position: relative;top: 30px; left: 10px;">

                    <span id="msg" style="color: #ac2925"></span>

                </div>
                <button id="loginBtn" type="button" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>