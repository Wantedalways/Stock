<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link href="static/jquery/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="static/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css"
          rel="stylesheet">
    <link href="static/jquery/jquery-editable-select-master/jquery-editable-select.css" type="text/css"
          rel="stylesheet">

    <script type="text/javascript" src="static/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="static/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="static/jquery/jquery-editable-select-master/jquery-editable-select.js"></script>

    <script type="text/javascript">

        let count = 1;

        $(function () {

            // 园区信息默认选中
            $("#park1").find("option").each(function () {

                if ("${user.parkId}" === $(this).html()) {

                    $(this).attr("selected", "selected");

                }
            })

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

            // 时间控件重新加载
            $("body").on('focus', 'input[name="dateTag"]', function (event) {

                $(".time").datetimepicker({
                    minView: "month",
                    language: 'zh-CN',
                    format: 'yyyy-mm-dd',
                    autoclose: true,
                    todayBtn: true,
                    pickerPosition: "bottom-left"
                })
            })

            // 新增一行按钮
            const max = 40;
            $("#newBtn").click(function () {

                const length = $("#stockTable tbody tr").length;

                if (length < max) {
                    count += 1;
                    let html = '<tr id="tr' + count + '">';
                    html += '<td><input type="checkbox" class="select-single" value="tr' + count + '"/></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + '" name="parkId" id="park' + count + '"><option></option><c:forEach items="${park}" var="park"><option value="${park.id}">${park.name}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + ' freezerList" name="freezerId"><option></option><c:forEach items="${freezer}" var="freezer"><option value="${freezer.id}">${freezer.name}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><input type="text" class="form-control tr' + count + '" name="pile"></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><input type="text" class="form-control tr' + count + ' time" name="dateTag"></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><input type="text" class="form-control tr' + count + '" name="shed"></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><input type="text" class="form-control tr' + count + '" name="bud"></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + ' typeList" name="type"><option></option><c:forEach items="${type}" var="type"><option value="${type.value}">${type.text}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + '" name="grade"><option></option><c:forEach items="${grade}" var="grade"><option value="${grade.value}">${grade.text}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><input type="text" class="form-control tr' + count + '" name="amount"></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + '" name="nature"><option></option><c:forEach items="${nature}" var="nature"><option value="${nature.value}">${nature.text}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + '" name="peel"><option></option><c:forEach items="${peel}" var="peel"><option value="${peel.value}">${peel.text}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><select class="form-control tr' + count + '" name="test"><option></option><c:forEach items="${test}" var="test"><option value="${test.value}">${test.text}</option></c:forEach></select></div></td>';
                    html += '<td><div class="col-sm-10" style="width: 200px;"><input type="text" class="form-control tr' + count + '" name="remark"></div></td>';
                    html += '</tr>';

                    $("#stockTable tbody").append(html);

                    // 默认选中园区
                    $("#park" + count).find("option").each(function () {

                        if ("${user.parkId}" === $(this).html()) {

                            $(this).attr("selected", "selected");

                        }
                    })

                    // 冷库号列表
                    $('.freezerList').editableSelect({

                        effects: 'slide',
                        onSelect: function (element) {

                            $('.freezerList').attr('data-val', element.val());

                        }
                    })

                    // 品种列表
                    $('.typeList').editableSelect({

                        effects: 'slide',
                        onSelect: function (element) {

                            $('.typeList').attr('data-val', element.val());

                        }
                    })

                } else {

                    alert("最大支持二十行数据！");

                }
            })

            // 删除按钮
            $("#delBtn").click(function () {
                const $checked = $(".select-single:checked");
                if ($checked.length === 0) {
                    alert("请至少选中一行！");
                } else if ($(".select-single").length === $checked.length) {
                    alert("至少保留一行！");
                } else {
                    confirm("确认删除？");
                    $checked.each(function () {
                        $(this).parent().parent().remove();
                    })
                }
            })

            // 全选和反选
            $(".select-all").prop("checked", false);
            $(".select-single").prop("checked", false);
            $(".select-all").click(function () {
                $(".select-single").prop("checked", this.checked);
            })
            $("#stockTbody").on("click", $(".select-single"), function () {
                $(".select-all").prop("checked", $(".select-single:checked").length === $(".select-single").length);
            })

            // 提交按钮
            $("#addBtn").click(function () {

                if ($(".select-single:checked").length === 0) {

                    alert("请至少选择一条数据！");

                } else {

                    confirm("确认提交数据？");

                    add();

                }


            })

            // 冷库号列表
            $('.freezerList').editableSelect({

                effects: 'slide',
                onSelect: function (element) {

                    $('.freezerList').attr('data-val', element.val());

                }
            })

            // 品种列表
            $('.typeList').editableSelect({

                effects: 'slide',
                onSelect: function (element) {

                    $('.typeList').attr('data-val', element.val());

                }
            })


            // 提交库存信息的方法
            function add() {

                var $checked = $(".select-single:checked");

                // 判断标签时间不能为空
                for (var l = 0;l <$checked.length;l ++) {

                    var num = $checked[l].value;

                    var $dateTag = $("." + num + ".time");

                    if ($dateTag.val() === "") {

                        alert("标签时间不能为空！");

                        return false;
                    }

                }

                var param = '[';

                for (var i = 0; i < $checked.length; i++) {

                    let trNum = $checked[i].value;

                    var $info = $("." + trNum);

                    param += '{';

                    for (var j = 0; j < $info.length; j++) {

                        param += '"' + $info[j].name + '":"' + $.trim($info[j].value) + '"';

                        if (j < $info.length - 1) {

                            param += ",";

                        }
                    }

                    param += "}";

                    if (i < $checked.length - 1) {

                        param += ",";

                    }
                }

                param += "]";

                $.ajax({

                    url: "workbench/stock/add.do",
                    data: param,
                    type: "post",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {

                        if (data.success) {

                            // 录入成功，提示记录条数
                            alert(data.message);

                            // 刷新当前界面
                            window.location.href = "workbench/stock/add.jsp";

                        } else {

                            // 录入失败，保留数据界面
                            alert(data.message);

                        }
                    }
                })
            }
        })
    </script>
    <title>库存添加</title>
</head>
<body>
<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>库存添加</h3>
        </div>
    </div>
    <div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
        <div style="width: 100%; position: absolute;top: 5px; left: 10px;">
            <div class="btn-toolbar" role="toolbar"
                 style="background-color: #F7F7F7; height: 50px; position: relative;top: -10px;">
                <div class="btn-group" style="position: relative; top: 18%;">
                    <button type="button" class="btn btn-primary" id="addBtn"><span
                            class="glyphicon glyphicon-pencil"></span> 提交
                    </button>
                    <button type="button" class="btn btn-default" id="newBtn"><span
                            class="glyphicon glyphicon-plus"></span> 新增一行
                    </button>
                    <button type="button" class="btn btn-danger" id="delBtn"><span
                            class="glyphicon glyphicon-minus"></span> 删除
                    </button>
                </div>
                <div style="top: 50px;position:absolute; height:auto;">
                    <table class="table table-hover table-bordered" id="stockTable">
                        <thead>
                        <tr style="color: #5e5e5e;font-weight: bold">
                            <td><input type="checkbox" class="select-all"/></td>
                            <td>园区<span style="font-size: 15px; color: red;">*</span></td>
                            <td>冷库号<span style="font-size: 15px; color: red;">*</span></td>
                            <td>垛位号</td>
                            <td>标签日期<span style="font-size: 15px; color: red;">*</span></td>
                            <td>培养棚号</td>
                            <td>菇蕾量</td>
                            <td>品种<span style="font-size: 15px; color: red;">*</span></td>
                            <td>等级<span style="font-size: 15px; color: red;">*</span></td>
                            <td>数量<span style="font-size: 15px; color: red;">*</span></td>
                            <td>存储性质<span style="font-size: 15px; color: red;">*</span></td>
                            <td>是否脱皮<span style="font-size: 15px; color: red;">*</span></td>
                            <td>是否实验菌棒<span style="font-size: 15px; color: red;">*</span></td>
                            <td>备注</td>

                        </tr>
                        </thead>
                        <tbody id="stockTbody">
                        <tr id="tr1">
                            <td><input type="checkbox" class="select-single" value="tr1"/></td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1" name="parkId" id="park1">
                                        <option></option>
                                        <c:forEach items="${park}" var="park">
                                            <option value="${park.id}">${park.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1 freezerList" name="freezerId">
                                        <option></option>
                                        <c:forEach items="${freezer}" var="freezer">
                                            <option value="${freezer.id}">${freezer.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <input type="text" class="form-control tr1" name="pile">
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <input type="text" class="form-control tr1 time" name="dateTag">
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <input type="text" class="form-control tr1" name="shed">
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <input type="text" class="form-control tr1" name="bud">
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1 typeList" name="type">
                                        <option></option>
                                        <c:forEach items="${type}" var="type">
                                            <option value="${type.value}">${type.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1" name="grade">
                                        <option></option>
                                        <c:forEach items="${grade}" var="grade">
                                            <option value="${grade.value}">${grade.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <input type="text" class="form-control tr1" name="amount">
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1" name="nature">
                                        <option></option>
                                        <c:forEach items="${nature}" var="nature">
                                            <option value="${nature.value}">${nature.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1" name="peel">
                                        <option></option>
                                        <c:forEach items="${peel}" var="peel">
                                            <option value="${peel.value}">${peel.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <select class="form-control tr1" name="test">
                                        <option></option>
                                        <c:forEach items="${test}" var="test">
                                            <option value="${test.value}">${test.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="col-sm-10" style="width: 200px;">
                                    <input type="text" class="form-control tr1" name="remark">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>