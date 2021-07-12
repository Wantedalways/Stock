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
    <link href="static/jquery/jquery-editable-select-master/jquery-editable-select.css" type="text/css" rel="stylesheet">


    <script type="text/javascript" src="static/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-paginator.min.js"></script>
    <script type="text/javascript" src="static/jquery/jquery-editable-select-master/jquery-editable-select.js"></script>


    <script type="text/javascript">

        $(function () {

            stockList(1,10);

            // 冷库号列表
            $('.freezerList').editableSelect({

                effects: 'slide',
                onSelect: function (element) {

                    $('.freezerList').attr('data-val',element.val());

                }
            })

            // 品种列表
            $('.typeList').editableSelect({

                effects: 'slide',
                onSelect: function (element) {

                    $('.typeList').attr('data-val',element.val());

                }
            })

            // 条件查询
            $("#search-Btn").click(function () {

                $("#hide-parkId").val($.trim($("#search-parkId").val()));
                $("#hide-freezerId").val($.trim($("#search-freezerId").val()));
                $("#hide-type").val($.trim($("#search-type").val()));
                $("#hide-grade").val($.trim($("#search-grade").val()));

                stockList(1,10);

            })

        })

        // 展示库存列表的方法
        function stockList(pageNo,pageSize) {

            // 恢复全选按钮
            $("#select-all").prop("checked",false);

            // 提取隐藏域中的查询条件
            $("#search-parkId").val($.trim($("#hide-parkId").val()));
            $("#search-freezerId").val($.trim($("#hide-freezerId").val()));
            $("#search-type").val($.trim($("#hide-type").val()));
            $("#search-grade").val($.trim($("#hide-grade").val()));

            $.ajax({

                url : "workbench/stock/list.do",
                data : {

                    "pageNo" : pageNo,
                    "pageSize" : pageSize,
                    "parkId" : $("#search-parkId").val(),
                    "freezerId" : $("#search-freezerId").val(),
                    "type" : $("#search-type").val(),
                    "grade" : $("#search-grade").val()

                },
                type: "get",
                dataType : "json",
                success : function (data) {

                    let html = "";

                    $.each(data.dataList,function (i,n) {

                        html += '<tr class="active">';
                        html += '<td><input type="checkbox" class="select-single" value="'+n.id+'"/></td>';
                        html += '<td>'+n.parkId+'</td>';
                        html += '<td>'+n.freezerId+'</td>';
                        html += '<td>'+n.pile+'</td>';
                        html += '<td>'+n.dateTag+'</td>';
                        html += '<td>'+n.dateCurrent+'</td>';
                        html += '<td>'+n.accountAge+'</td>';
                        html += '<td>'+n.shed+'</td>';
                        html += '<td>'+n.bud+'</td>';
                        html += '<td>'+n.type+'</td>';
                        html += '<td>'+n.grade+'</td>';
                        html += '<td>'+n.amount+'</td>';
                        html += '<td>'+n.nature+'</td>';
                        html += '<td>'+n.peel+'</td>';
                        html += '<td>'+n.test+'</td>';
                        html += '<td>'+n.remark+'</td>';
                        html += '</tr>'

                    })

                    $("#stockListTbody").html(html);

                    // 计算总页数
                    var totalPages = (data.total % pageSize === 0) ? (data.total / pageSize) : Math.ceil(data.total / pageSize);

                    // 分页插件应用
                    $("#stockPage").bootstrapPaginator({

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

                            stockList(page,pageSize);

                        }

                    })
                }
            })
        }

    </script>
    <title>库存列表</title>
</head>
<body>

<!--保存查询条件的隐藏域-->
<input type="hidden" id="hide-parkId">
<input type="hidden" id="hide-freezerId">
<input type="hidden" id="hide-type">
<input type="hidden" id="hide-grade">

<!-- 创建市场活动的模态窗口 -->
<div class="modal fade" id="createActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="addActivityForm">

                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-marketActivityOwner"></select>
                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="create-startTime">
                        </div>
                        <label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="create-endTime">
                        </div>
                    </div>
                    <div class="form-group">

                        <label for="create-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-cost">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveCreateModal">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form">

                    <input type="hidden" id="hide-id"/>

                    <div class="form-group">
                        <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-marketActivityOwner"></select>
                        </div>
                        <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="edit-startTime">
                        </div>
                        <label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="edit-endTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-cost">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="edit-btn">更新</button>
            </div>
        </div>
    </div>
</div>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>库存列表</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">
        <!--条件查询市场活动-->
        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">园区</div>
                        <select class="form-control tr1" name="parkId" id="search-parkId">
                            <option></option>
                            <c:forEach items="${park}" var="park">
                                <option value="${park.id}">${park.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">冷库号</div>
                        <select class="form-control tr1 freezerList" id="search-freezerId">
                            <option></option>
                            <c:forEach items="${freezer}" var="freezer">
                                <option value="${freezer.id}">${freezer.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">品种</div>
                        <select class="form-control typeList" id="search-type">
                            <option></option>
                            <c:forEach items="${type}" var="type">
                                <option value="${type.value}">${type.text}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">等级</div>
                        <select class="form-control" id="search-grade">
                            <option></option>
                            <c:forEach items="${grade}" var="grade">
                                <option value="${grade.value}">${grade.text}</option>
                            </c:forEach>
                        </select>
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
                <button type="button" class="btn btn-info" id="addEditModal"><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" class="btn btn-danger" id="del-btn"><span
                        class="glyphicon glyphicon-minus"></span> 删除
                </button>
            </div>
        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover table-striped">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox" id="select-all"/></td>
                    <td>园区</td>
                    <td>冷库号</td>
                    <td>垛位号</td>
                    <td>标签日期</td>
                    <td>录入日期</td>
                    <td>账龄</td>
                    <td>培养棚号</td>
                    <td>菇蕾量</td>
                    <td>品种</td>
                    <td>等级</td>
                    <td>数量</td>
                    <td>存储性质</td>
                    <td>是否脱皮</td>
                    <td>是否实验菌棒</td>
                    <td>备注</td>
                </tr>
                </thead>
                <tbody id="stockListTbody"></tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 30px;text-align: center">
            <ul id="stockPage"></ul>
        </div>
    </div>
</div>
</body>
</html>