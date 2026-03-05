<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index">朝花夕拾后台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/order_list">订单信息</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/user_list">客户信息</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/goods_list">商品信息</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/type_list">系列信息</a></li>
                <li><a href="${pageContext.request.contextPath}/user_logout">退出</a></li>
            </ul>
        </div>
    </div>
</nav>