<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>个人信息 - 朝花夕拾</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<style>
		body {
			background: url('${pageContext.request.contextPath}/images/slid.jpg') center/cover no-repeat fixed !important;
			background-attachment: fixed;
		}

		.main-content {
			padding: 120px 20px 50px;
			min-height: calc(100vh - 100px);
		}

		.profile-content {
			max-width: 1400px;
			margin: 0 auto;
		}

		.profile-header {
			text-align: center;
			margin-bottom: 50px;
			padding: 40px 0;
			background: linear-gradient(135deg, #ff98cc, #FFC0CB);
			color: white;
			border-radius: 20px;
			box-shadow: 0 8px 32px rgba(255, 105, 180, 0.3);
		}

		.profile-header h1 {
			margin: 0;
			font-size: 3.5rem;
			font-weight: 800;
			text-shadow: 3px 3px 6px rgba(0,0,0,0.3);
		}

		.profile-header p {
			margin: 20px 0 0;
			font-size: 1.3rem;
			opacity: 0.95;
		}

		.profile-card {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 24px;
			box-shadow: 0 12px 40px rgba(0,0,0,0.08);
			margin-bottom: 40px;
			overflow: hidden;
			border: 1px solid #e9ecef;
		}

		.profile-card-header {
			background: linear-gradient(135deg, #ff98cc 0%, #ff98cc 100%);
			color: white;
			padding: 30px;
		}

		.profile-card-header h3 {
			margin: 0;
			font-size: 28px;
			font-weight: 700;
			color: white;
		}

		.profile-card-body {
			padding: 40px;
		}

		.form-section {
			margin-bottom: 40px;
		}

		.form-section:last-child {
			margin-bottom: 0;
		}

		.form-section h4 {
			margin: 0 0 25px 0;
			font-size: 20px;
			font-weight: 600;
			color: #495057;
			padding-bottom: 15px;
			border-bottom: 2px solid #e9ecef;
		}

		.form-group {
			margin-bottom: 25px;
		}

		.form-group label {
			display: flex;
			align-items: center;
			gap: 8px;
			font-weight: 600;
			color: #495057;
			margin-bottom: 10px;
			font-size: 16px;
		}

		.form-group label i {
			color: #ff98cc;
			font-size: 18px;
		}

		.form-input {
			width: 100%;
			padding: 16px 20px;
			border: 2px solid #e9ecef;
			border-radius: 12px;
			font-size: 16px;
			color: #212529;
			background: white;
			transition: all 0.3s ease;
			box-sizing: border-box;
		}

		.form-input:focus {
			border-color: #ff98cc;
			box-shadow: 0 0 0 3px rgba(255, 105, 180, 0.1);
			outline: none;
		}

		.form-input::placeholder {
			color: #adb5bd;
		}

		.form-actions {
			display: flex;
			justify-content: center;
			gap: 16px;
			padding-top: 20px;
			border-top: 1px solid #e9ecef;
		}

		.btn-primary {
			background: linear-gradient(135deg, #ff98cc 0%, #ff98cc 100%);
			color: white;
			border: none;
			padding: 14px 32px;
			border-radius: 12px;
			font-size: 16px;
			font-weight: 600;
			cursor: pointer;
			display: flex;
			align-items: center;
			gap: 8px;
			transition: all 0.3s ease;
			box-shadow: 0 4px 15px rgba(255, 105, 180, 0.3);
		}

		.btn-primary:hover {
			transform: translateY(-2px);
			box-shadow: 0 8px 25px rgba(255, 105, 180, 0.4);
		}

		.alert {
			margin-bottom: 20px;
			padding: 15px 20px;
			border-radius: 12px;
		}

		@media (max-width: 768px) {
			.main-content {
				padding: 100px 15px 20px;
			}

			.profile-header h1 {
				font-size: 2.5rem;
			}

			.profile-card-body {
				padding: 20px;
			}

			.form-actions {
				flex-direction: column;
			}

			.btn-primary {
				width: 100%;
				justify-content: center;
			}
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="4" name="flag"/>
</jsp:include>
<c:if test="${empty user}"><%response.sendRedirect("/index");%></c:if>

<div class="main-content">
	<div class="profile-content">
		<!-- Profile Header -->
		<div class="profile-header">
			<h1>个人信息中心</h1>
			<p>管理您的个人资料信息</p>
		</div>

		<!-- User Information Card -->
		<div class="profile-card">
			<div class="profile-card-header">
				<h3>个人资料</h3>
			</div>
			<div class="profile-card-body">
				<c:if test="${!empty msg}">
					<div class="alert alert-success">${msg}</div>
				</c:if>
				<c:if test="${!empty failMsg}">
					<div class="alert alert-danger">${failMsg}</div>
				</c:if>

				<form action="${pageContext.request.contextPath}/user_changeaddress" method="post" class="form-section">
					<h4><i class="fas fa-map-marker-alt"></i> 收货信息</h4>
					<div class="form-group">
						<label for="name">
							<i class="fas fa-user"></i>
							收货人
						</label>
						<input type="text" id="name" name="name" class="form-input" value="${user.name}" placeholder="请输入收货人">
					</div>
					<div class="form-group">
						<label for="phone">
							<i class="fas fa-phone"></i>
							收货电话
						</label>
						<input type="text" id="phone" name="phone" class="form-input" value="${user.phone}" placeholder="请输入收货电话">
					</div>
					<div class="form-group">
						<label for="address">
							<i class="fas fa-map-marker-alt"></i>
							收货地址
						</label>
						<input type="text" id="address" name="address" class="form-input" value="${user.address}" placeholder="请输入收货地址">
					</div>
					<div class="form-actions">
						<button type="submit" class="btn-primary">
							<i class="fas fa-save"></i>
							保存收货信息
						</button>
					</div>
				</form>

				<hr style="margin: 40px 0; border: none; border-top: 2px solid #e9ecef;">

				<form action="${pageContext.request.contextPath}/user_changepwd" method="post" class="form-section">
					<h4><i class="fas fa-lock"></i> 安全信息</h4>
					<div class="form-group">
						<label for="password">
							<i class="fas fa-key"></i>
							原密码
						</label>
						<input type="password" id="password" name="password" class="form-input" placeholder="请输入原密码">
					</div>
					<div class="form-group">
						<label for="newPassword">
							<i class="fas fa-lock"></i>
							新密码
						</label>
						<input type="password" id="newPassword" name="newPassword" class="form-input" placeholder="请输入新密码">
					</div>
					<div class="form-actions">
						<button type="submit" class="btn-primary">
							<i class="fas fa-save"></i>
							修改密码
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>