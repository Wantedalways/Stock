// 全选和反选
$(".select-all").prop("checked", false);
$(".select-single").prop("checked", false);

$("#select-all").click(function () {

    $(".select-single").prop("checked",this.checked);

})

$("#logListTbody").on("click",$(".select-single"),function () {

    $("#select-all").prop("checked",$(".select-single").length === $(".select-single:checked").length);

})

// 批量删除
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

        url : "workbench/stock/logDelBatch.do",
        data : param,
        type : "post",
        dataType : "json",
        success : function (data) {

            if (data.success) {

                // 刷新库存列表
                alert(data.message);
                editLogList(1,10);

            } else {

                // 删除失败
                alert(data.message);

            }
        }
    })
}



