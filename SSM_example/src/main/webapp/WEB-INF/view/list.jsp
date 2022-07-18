<%--
  Created by IntelliJ IDEA.
  User: hys
  Date: 2022/7/12
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- 以服务器路径为基准，http://localhost:80801
     需要加上项目名ssm -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
${empPageInfo}
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>用户信息</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-9">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <tr>
                <th>#</th>
                <th>empName</th>
                <th>gender</th>
                <th>email</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${empPageInfo.list}" var="emp">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.empName}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.email}</td>
                    <td>${emp.dept.deptName}</td>
                    <td>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
    <div class="row">
        <div class="col-md-6">
            当前页：${empPageInfo.pageNum},总${empPageInfo.pages}页,总${empPageInfo.total}条记录
        </div>
        <div class="col-md-6 col-md-offset-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li <c:if test="${empPageInfo.isFirstPage}">class="disabled" </c:if>><a href="${APP_PATH}/emps?pageNum=1">首页</a></>
                    <li <c:if test="${empPageInfo.isFirstPage}">class="disabled" </c:if> >
                        <a href="${APP_PATH}/emps?pageNum=${empPageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${empPageInfo.navigatepageNums}" var="page">
                    <li <c:if test="${page==empPageInfo.pageNum}">class="active" </c:if>><a href="${APP_PATH}/emps?pageNum=${page}" >${page}</a></li>
                    </c:forEach>

                    <li <c:if test="${empPageInfo.isLastPage}">class="disabled"</c:if>>
                        <a href="${APP_PATH}/emps?pageNum=${empPageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li <c:if test="${empPageInfo.isLastPage}">class="disabled"</c:if>><a href="${APP_PATH}/emps?pageNum=${empPageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
