<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>重置密码</title>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="/WEB-INF/views/admin/header.jsp"/>
	<br><br>

	<c:if test="${!empty msg}">
		<div class="alert alert-success">${msg}</div>
	</c:if>
	<c:if test="${!empty failMsg}">
		<div class="alert alert-danger">${failMsg}</div>
	</c:if>

	<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/user_reset" method="post">
		<input type="hidden" name="id" value="${user.id}">
		<div class="form-group">
			<label class="col-sm-1 control-label">用户名</label>
			<div class="col-sm-5">${user.username}</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label">手机号码</label>
			<div class="col-sm-5">${user.userphone}</div>
		</div>
		<div class="form-group">
			<label for="input_password" class="col-sm-1 control-label">新密码</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="input_password"
					   name="password" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">提交修改</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>