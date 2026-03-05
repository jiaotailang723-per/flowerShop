<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="/WEB-INF/views/admin/header.jsp"/>
	<br><br>
	<div class="alert alert-success" role="alert">恭喜你! 登录成功了</div>
</div>
</body>
</html>