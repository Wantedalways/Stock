// 修改库存信息的方法
function edit($checked) {

    // 填充数据
    $.ajax({

        url : "workbench/stock/get.do",
        data: {

            "id" : $checked[0].value

        },
        type: "get",
        dataType: "json",
        success : function (data) {

            $("#hide-id").val(data.id);
            // 园区选中
            $("#edit-parkId").find("option").each(function () {

                if (data.parkId === $(this).html()) {

                    $(this).attr("selected", "selected");

                }
            })
            $("#edit-freezerId").val(data.freezerId);
            $("#edit-pile").val(data.pile);
            $("#edit-dateTag").val(data.dateTag);
            $("#edit-shed").val(data.shed);
            $("#edit-bud").val(data.bud);
            $("#edit-type").val(data.type);
            $("#edit-grade").val(data.grade);
            $("#edit-amount").val(data.amount);
            $("#edit-nature").val(data.nature);
            $("#edit-peel").val(data.peel);
            $("#edit-test").val(data.test);
            $("#edit-remark").val(data.remark);

        }
    })

    $("#editStockModal").modal("show");

    // 保存修改按钮
    $("#edit-save").click(function () {

        $.ajax({

            url : "workbench/stock/update.do",
            data : {

                "id" : $.trim($("#hide-id").val()),
                "parkId" : $.trim($("#edit-parkId").val()),
                "freezerId" : $.trim($("#edit-freezerId").val()),
                "pile" : $.trim($("#edit-pile").val()),
                "dateTag" : $.trim($("#edit-dateTag").val()),
                "shed" : $.trim($("#edit-shed").val()),
                "bud" : $.trim($("#edit-bud").val()),
                "type" : $.trim($("#edit-type").val()),
                "grade" : $.trim($("#edit-grade").val()),
                "amount" : $.trim($("#edit-amount").val()),
                "nature" : $.trim($("#edit-nature").val()),
                "peel" : $.trim($("#edit-peel").val()),
                "test" : $.trim($("#edit-test").val()),
                "remark" : $.trim($("#edit-remark").val())

            },
            type : "post",
            dataType : "json",
            success : function (data) {

                if (data.success) {

                    alert(data.message);

                    $("#editStockModal").modal("hide");

                    stockList(1,10);

                } else {

                    alert(data.message);

                }
            }
        })
    })
}

// 删除库存信息的方法
function del() {

    var $checked = $(".select-single:checked");

    var param = "";

    for (var i = 0;i < $checked.length;i ++) {

        param += "id=" + $checked[i].value;

        if (i < $checked.length - 1) {

            param += "&";

        }
    }

    $.ajax({

        url : "workbench/stock/del.do",
        data : param,
        type : "post",
        dataType : "json",
        success : function (data) {

            if (data.success) {

                // 刷新库存列表
                alert(data.message);
                stockList(1,10);

            } else {

                // 删除失败
                alert(data.message);

            }
        }
    })
}

// 全选和反选
$(".select-all").prop("checked", false);
$(".select-single").prop("checked", false);

$("#select-all").click(function () {

    $(".select-single").prop("checked",this.checked);

})

$("#stockListTbody").on("click",$(".select-single"),function () {

    $("#select-all").prop("checked",$(".select-single").length === $(".select-single:checked").length);

})