<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <link href="static/jquery/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="static/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet">

    <link rel="icon" href="static/image/logo.png">
    <script type="text/javascript" src="static/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-paginator.min.js"></script>

    <title></title>
    <script type="text/javascript">

        $(function () {

            // 时间模块
            $.fn.datetimepicker.dates['zh-CN'] = {
                days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
                daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
                daysMin: ["日", "一", "二", "三", "四", "五", "六", "日"],
                months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                today: "今天",
                suffix: [],
                meridiem: ["上午", "下午"]
            }

            $(".time").datetimepicker({
                minView: "month",
                language: 'zh-CN',
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayBtn: true,
                pickerPosition: "bottom-left"
            })

            editLogList(1,10);

            // 条件查询
            $("#search-Btn").click(function () {

                $("#hide-parkName").val($.trim($("#search-parkName").val()));
                $("#hide-editTime").val($.trim($("#search-editTime").val()));

                editLogList(1,10);

            })

            // 删除库存信息
            $("#delBtn").click(function () {

                if ($(".select-single:checked").length === 0) {

                    alert("请选中数据！");

                } else {

                    if (confirm("确认删除" + $(".select-single:checked").length + "条数据？")) {

                        del();

                    }
                }
            });
        })
        // 展示库存修改日志
        function editLogList(pageNo,pageSize) {

            // 恢复全选按钮
            $("#select-all").prop("checked",false);

            // 提取隐藏域中的查询条件
            $("#search-parkName").val($.trim($("#hide-parkName").val()));
            $("#search-editTime").val($.trim($("#hide-editTime").val()));

            $.ajax({

                url : "workbench/stock/log.do",
                data : {

                    "pageNo" : pageNo,
                    "pageSize" : pageSize,
                    "parkName" : $("#search-parkName").val(),
                    "editTime" : $("#search-editTime").val()

                },
                type : "get",
                dataType : "json",
                success : function (data) {

                    var html = '';

                    $.each(data.dataList,function (i,n) {

                        html += '<tr class="active">';
                        html += '<td><input type="checkbox" class="select-single" value="'+n.id+'"/></td>';
                        html += '<td>'+n.editBy+'</td>';
                        html += '<td>'+n.editTime+'</td>';
                        html += '<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href=\'workbench/stock/detail.do?id='+ n.id +'\';">详情</a>'

                    })

                    $("#logListTbody").html(html);

                    // 计算总页数
                    var totalPages = (data.total % pageSize === 0) ? (data.total / pageSize) : Math.ceil(data.total / pageSize);

                    // 分页插件应用
                    $("#logPage").bootstrapPaginator({

                        currentPage : pageNo,
                        numberOfPages : pageSize,
                        totalPages : totalPages,
                        size:"normal",
                        bootstrapMajorVersion: 3,
                        alignment:"center",
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first": return "首页";
                                case "prev": return "上一页";
                                case "next": return "下一页";
                                case "last": return "末页";
                                case "page": return page;
                            }
                        },
                        onPageClicked:function (event,originalEvent,type,page) {

                            editLogList(page,pageSize);

                        }
                    })
                }
            })
        }
    </script>
</head>
<body>

<!--保存查询条件的隐藏域-->
<input type="hidden" id="hide-parkName">
<input type="hidden" id="hide-editTime">

<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>库存修改日志</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">
        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">园区</div>
                        <select class="form-control" name="parkId" id="search-parkName">
                            <option></option>
                            <c:forEach items="${park}" var="park">
                                <option value="${park.name}">${park.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">时间</div>
                            <input type="text" class="form-control time" id="search-editTime">
                    </div>
                </div>

                <button type="button" class="btn btn-primary" id="search-Btn"><span
                        class="glyphicon glyphicon-search"></span> 查询
                </button>
            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button type="button" class="btn btn-danger" id="delBtn"><span
                        class="glyphicon glyphicon-minus"></span> 删除
                </button>
            </div>
        </div>
        <div style="position: relative; top: -10px; left: 0px; width: 100%; height: 100%;">
            <div style="width: 100%; position: absolute;top: 5px; left: 10px;">
                <div style="position: relative;top: 10px;">
                    <table class="table table-hover">
                        <thead>
                        <tr style="color: #B3B3B3;">
                            <td><input type="checkbox" id="select-all"/></td>
                            <td>修改人</td>
                            <td>修改时间</td>
                            <td>修改详情</td>
                        </tr>
                        </thead>
                        <tbody id="logListTbody"></tbody>
                    </table>
                </div>

                <div style="height: 50px; position: relative;top: 30px;text-align: center">
                    <ul id="logPage"></ul>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="static/js/workbench/stockEditLog.js"></script>
</body>
</html>
