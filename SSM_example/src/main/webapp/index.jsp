<%--
  Created by IntelliJ IDEA.
  User: hys
  Date: 2022/7/12
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 修改Modal -->
<div class="modal fade" id="alter_emp_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">emp info</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="empName" id="alter_empName"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="alter_gender_male"  value="男"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="alter_gender_female" value="女"> 女
                        </label>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="alter_email" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptId</label>
                        <div class="col-sm-10">
                            <select id="alter_deptId" name="deptId" class="form-control">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="alter_emp_btn" type="button" class="btn btn-primary">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 新增模态框Modal -->
<div class="modal fade" id="add_emp_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">emp info</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="put_empName" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="put_gender" value="男" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="inlineRadio2" value="女"> 女
                        </label>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="put_email" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptId</label>
                        <div class="col-sm-10">
                            <select id="put_deptId" name="deptId" class="form-control">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="add_emp_save_btn" type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>用户信息</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-9">
                <button id="add_emp_btn" class="btn btn-primary" type="button" data-toggle="modal" data-target="#emp_model">新增</button>
                <button class="btn btn-danger" id="del_emp_btn">删除</button>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover" id="emps_tab">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" class="check_all"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
        </div>
        <div class="row">
            <div class="col-md-6" id="page_info"></div>
            <div class="col-md-6 col-md-offset-6" id="page_nav"></div>

        </div>
    </div>
    <script type="text/javascript">
        /**
         * pageTotal作为全局变量用来添加数据后跳转到最后一页
         * emailFormat、empNameFormat用来存储正则表达式判断格式正确与否，来决定是否可以提交增加的emp数据
         * currentPage记录访问的当前页码，用于修改后页面跳转到修改记录所在页面
          */
        var pageTotal;
        var emailFormat;
        var empNameFormat;
        var currentPage;
        //页面加载完成跳转到第一页
        $(function () {
            to_page(1);
        })
        //跳转到指定页面
        function to_page(pageNum){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function (result){
                    build_emps_tab(result);
                    build_pages_info(result);
                    build_pages_nav(result);
                }
            })
        }
        //查找emp数据然后填充到表格中
        function build_emps_tab(result){
            //先清空，否则数据会叠加
            $("#emps_tab tbody").empty();
            var emps = result.extend.empPageInfo.list;
            //$.each循环
            //emps为传入数据，function为每次循环行为，item为每一条emp数据
            $.each(emps,function (index,item){
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var empGenderTd = $("<td></td>").append(item.gender);
                var empEmailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.dept.deptName);
                //append是一层一层嵌进去的，append之后返回的是嵌进去的元素
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑").attr("edit-id",item.empId);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除").attr("delete-id",item.empId);
                var btnTd = $("<td></td>").append(editBtn).append(delBtn)
                //每次append返回的还是tr标签
                $("<tr></tr>").append("<td><input type='checkbox' class='check_item'/></td>").append(empIdTd).append(empNameTd).append(empGenderTd)
                    .append(empEmailTd).append(deptNameTd).append(btnTd).appendTo("#emps_tab tbody");

            })

        }

        //为编辑按钮绑定点击事件
        $(document).on("click",".edit",function (){
            var empId = $(this).attr("edit-id");
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"GET",
                success:function (result){
                    //1.加载部门信息
                    build_model_dept("#alter_deptId");
                    //2.加载员工数据
                    build_update_emp_modal(result);
                    //3.为更新按钮绑定empId，方便进行数据修改时作为where条件进行更新
                    // $("#alter_emp_btn").attr("edit_id",$(this).attr("edit-id"));
                    $("#alter_emp_btn").attr("edit-id",empId);

                    //4.调出修改模态框
                    $("#alter_emp_model").modal({
                        //取消模态框外部点击关闭
                        backdrop: "static",
                    });

                }
            })
        })
        //更新按钮绑定事件
        $("#alter_emp_btn").click(function (){
            $.ajax({
                url:"${APP_PATH}/emp/"+$("#alter_emp_btn").attr("edit-id"),
                data:$("#alter_emp_model form").serialize(),
                type:"PUT",
                success:function (){
                    //1.修改完后关闭模态框
                    $("#alter_emp_model").modal("hide");
                    //2.重新访问修改记录前所在页码
                    to_page(currentPage);
                }
            })
        })

        $(document).on("click",".delete",function (){
            // alert($(this).attr("delete-id"));
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            if (confirm("确定要删除【"+ empName +"】吗？")) $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("delete-id"),
                // data:"_method=DELETE",
                type:"DELETE",
                success:function (){
                    to_page(currentPage);
                    alert("删除成功！");
                }
            })
        })

        function build_update_emp_modal(result){
            var emp = result.extend.emp;
            $("#alter_empName").text(emp.empName);
            $("#alter_emp_model input[name=gender]").val([emp.gender]);
            $("#alter_email").attr("value",emp.email);
            $("#alter_emp_model select").val([emp.deptId]);
        }


        //查询数据填充分页信息
        function build_pages_info(result){
            //先清空，否则数据会叠加
            $("#page_info").empty();
            //当前页：empPageInfo.pageNum,总empPageInfo.pages页,总empPageInfo.total条记录
            var pageNum = result.extend.empPageInfo.pageNum;
            var pages = result.extend.empPageInfo.pages;
            var total = result.extend.empPageInfo.total;
            $("#page_info").append("当前页:" + pageNum + ",总" + pages +"页,总" + total + "条记录");
            pageTotal = pages;
            currentPage = pageNum;
        }
        //查找数据填充分页条
        function build_pages_nav(result){

            var pageInfo = result.extend.empPageInfo;
            var navPage = pageInfo.navigatepageNums;
            var navElm = $("<nav></nav>").attr("aria-label","Page navigation");
            var ulElm = $("<ul></ul>").addClass("pagination");
            var firstPage = $("<li></li>").append($("<a></a>").attr("href","#").append("首页")).click(function (){to_page(1)});
            var prePage = $("<li></li>").append($("<a></a>").attr("href","#").append("&laquo;")).click(function (){to_page(pageInfo.pageNum-1)});
            if (pageInfo.isFirstPage) {
                firstPage.addClass("disabled");
                prePage.addClass("disabled");
            }else{
                //可以在此处绑定单击事件，这样的话临界值就不会再绑定单击事件了
            }
            ulElm.append(firstPage).append(prePage);

            $.each(navPage,function (index,item){
                var num = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
                if (item == pageInfo.pageNum) num.addClass("active");
                num.click(function (){
                    to_page(item);
                })
                ulElm.append(num);
            })
            var nextPage = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;")).click(function (){to_page(pageInfo.pageNum+1)});
            var lastPage = $("<li></li>").append($("<a></a>").attr("href","#").append("末页")).click(function (){to_page(pageInfo.pages)});
            if (pageInfo.isLastPage) {
                nextPage.addClass("disabled");
                lastPage.addClass("disabled");
            }else{
                //可以在此处添加绑定事件，那么临界值就不会绑定单击事件了
            }
            ulElm.append(nextPage).append(lastPage);
            ulElm.appendTo(navElm);
            //先清空，否则数据会叠加
            $("#page_nav").empty();
            $("#page_nav").append(navElm);
        }
        //为新增按钮绑定单击事件
        $("#add_emp_btn").click(function (){
            $("#add_emp_model").modal({
                backdrop:"static",
            });
            build_model_dept("#put_deptId");
        })

        //为empName增加页面的失去焦点绑定事件
        $("#put_empName").blur(function (){
            //判断数据格式
            var regEmpName = /(^[a-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
            empNameFormat = formatTest("#put_empName",regEmpName,"正确格式为3到16位数字或2到5位汉字！");
            $.ajax({
                url:"${APP_PATH}/checkEmpName",
                data:"empName="+$("#put_empName").val(),
                type:"GET",
                success:function (result){
                    if (result.code==0 ) {
                        $("#put_empName").parent().removeClass("has-error","has-success").addClass("has-error");
                        if (result.extend.exists == true) $("#put_empName").next().text("用户名已存在！");
                        else $("#put_empName").next().text("正确格式为3到16位数字或2到5位汉字！");
                        empNameFormat = false;
                    } else{
                        $("#put_empName").parent().removeClass("has-error","has-success").addClass("has-success");
                        $("#put_empName").next().text("");
                        empNameFormat = true ;
                    }
                }
            })
        })

        //正则判断格式是否正确提取出来的方法
        function formatTest(ele,regEx,msg){

            if (!regEx.test($(ele).val())) {
                $(ele).parent().removeClass("has-error","has-success").addClass("has-error");
                $(ele).next().text(msg)
                return false;
            }else {
                $(ele).parent().removeClass("has-error","has-success").addClass("has-success");
                $(ele).next().text("");
                return true;
            }
        }

        //为添加数据时email表格的失去焦点绑定事件
        $("#put_email").blur(function (){
            //判断数据格式
            var regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
            emailFormat = formatTest("#put_email",regEmail,"邮箱格式不正确！");
            $.ajax({
                url:"${APP_PATH}/checkEmail",
                data:"email="+$("#put_email").val(),
                type:"GET",
                success:function (result){
                    if (result.code==0 ) {
                        $("#put_email").parent().removeClass("has-error","has-success").addClass("has-error");
                        $("#put_email").next().text("邮箱格式不正确");
                        emailFormat = false;
                    } else{
                        $("#put_email").parent().removeClass("has-error","has-success").addClass("has-success");
                        $("#put_email").next().text("");
                        emailFormat = true;
                    }
                }
            })
        })

        //增加数据的保存按钮绑定单击事件，提交保存
        $("#add_emp_save_btn").click(function (){
            if (!emailFormat||!empNameFormat) return false;
            $.ajax({
                url:"${APP_PATH}/addEmp",
                data:$("#add_emp_model form").serialize(),
                type:"POST",
                success:function (result){
                    //1.如果添加失败，那么返回false
                    if (result.code==0) {
                        $("#put_empName").next().text("用户名已存在！");
                        return false;
                    }else {
                        //2.关闭模态框
                        $("#add_emp_model").modal("hide");
                        //3.跳转到最后一页查看保存数据
                        to_page(pageTotal+1);
                    }
                }
            });
        })

        //循环输出empName和empId的方法
        function build_model_dept(ele){
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/getDept",
                async:false,
                type:"GET",
                success:function (result) {
                    var depts = result.extend.depts;
                    var deptIdElm = $(ele);
                    $.each(depts,function (index, item) {
                        deptIdElm.append($("<option></option>").append(item.deptName).attr("value",item.deptId))
                    })
                }
            })
        }

        //选中check_all那么item全部checked
        $(".check_all").click(function (){
            //是否勾选看全选框结果
            $(".check_item").prop("checked",$(this).prop("checked"));
        })
        //如果5个item全被勾选，那么勾选check_all，如果5个选择取消一个，去勾check_all
        $(document).on("click",".check_item",function () {
            // alert($(".check_item:checked").length)
            if ($(".check_item:checked").length==$(".check_item").length) $(".check_all").prop("checked",true);
            else $(".check_all").prop("checked",false);
        })
        //对勾选的进行删除
        $("#del_emp_btn").click(function () {
            //each函数的第一个元素是有一个dom对象！！！！
            var name = "";
            var ids = "";
            $.each($(".check_item:checked"),function (){
                name += $(this).parents("tr").find("td:eq(2)").text() + ",";
                ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
            })
            //去除多余的逗号
            name = name.substr(0,name.length-1);
            //ids去除多余的 "-"
            ids = ids.substr(0,ids.length-1);
            //确认删除框
            if (confirm("确定删除【"+ name +"】吗？")) $.ajax({
                url:"${APP_PATH}/emp/"+ids,
                type:"DELETE",
                success:function (result){
                    alert("删除成功");
                    to_page(currentPage);
                }
            })
        })

    </script>
</body>
</html>
