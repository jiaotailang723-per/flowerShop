<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>用户登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<style>
		/* Authentication Page Styles */
		.login-section {
			min-height: calc(100vh - 100px);
			background: url('${pageContext.request.contextPath}/images/slid.jpg') center/cover no-repeat fixed;
			padding: 40px 20px;
			display: flex;
			align-items: center;
			justify-content: center;
			position: relative;
			overflow: hidden;
			margin-top: 100px;
		}

		.login-section::before {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background: rgba(255, 192, 203, 0.3);
			backdrop-filter: blur(1px);
		}

		.auth-container {
			max-width: 700px;
			width: 100%;
			position: relative;
			z-index: 2;
		}

		.auth-card {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 24px;
			box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
			overflow: hidden;
			border: 1px solid rgba(255, 255, 255, 0.2);
		}

		.auth-header {
			text-align: center;
			padding: 40px 30px 30px;
			background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
			position: relative;
		}

		.auth-header::before {
			content: '';
			position: absolute;
			bottom: 0;
			left: 50%;
			transform: translateX(-50%);
			width: 60px;
			height: 3px;
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			border-radius: 2px;
		}

		.auth-icon {
			width: 80px;
			height: 80px;
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			border-radius: 50%;
			display: flex;
			align-items: center;
			justify-content: center;
			margin: 0 auto 20px;
			font-size: 36px;
			color: white;
			box-shadow: 0 8px 25px rgba(255, 105, 180, 0.3);
		}

		.auth-title {
			margin: 0 0 10px 0;
			font-size: 28px;
			font-weight: 700;
			color: #2d3748;
		}

		.auth-subtitle {
			margin: 0;
			color: #718096;
			font-size: 16px;
			line-height: 1.5;
		}

		.auth-body {
			padding: 40px 30px;
		}

		.auth-form {
			display: flex;
			flex-direction: column;
			gap: 32px;
		}

		.form-row {
			display: grid;
			grid-template-columns: 1fr 1fr;
			gap: 20px;
		}

		.form-group {
			display: flex;
			flex-direction: column;
			gap: 8px;
		}

		.form-label {
			display: flex;
			align-items: center;
			gap: 8px;
			font-weight: 600;
			color: #4a5568;
			font-size: 16px;
		}

		.form-label i {
			color: #ff98cc;
			font-size: 18px;
		}

		.input-wrapper {
			position: relative;
		}

		.form-input {
			width: 100%;
			padding: 16px 16px 16px 50px;
			border: 2px solid #e2e8f0;
			border-radius: 12px;
			font-size: 16px;
			color: #2d3748;
			background: white;
			transition: all 0.3s ease;
			outline: none;
			box-sizing: border-box;
		}

		.form-input:focus {
			border-color: #ff98cc;
			box-shadow: 0 0 0 3px rgba(255, 105, 180, 0.1);
			transform: translateY(-1px);
		}

		.form-input::placeholder {
			color: #a0aec0;
		}

		.input-icon {
			position: absolute;
			left: 16px;
			top: 50%;
			transform: translateY(-50%);
			color: #a0aec0;
			font-size: 18px;
			transition: color 0.3s ease;
			pointer-events: none;
		}

		.form-input:focus + .input-icon {
			color: #ff98cc;
		}

		.auth-btn {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			border: none;
			padding: 16px 32px;
			border-radius: 12px;
			font-size: 16px;
			font-weight: 600;
			cursor: pointer;
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 8px;
			transition: all 0.3s ease;
			box-shadow: 0 4px 15px rgba(255, 105, 180, 0.3);
			margin-top: 8px;
		}

		.auth-btn:hover {
			transform: translateY(-2px);
			box-shadow: 0 8px 25px rgba(255, 105, 180, 0.4);
		}

		.auth-btn:active {
			transform: translateY(0);
		}

		.auth-footer {
			text-align: center;
			margin-top: 32px;
			padding-top: 24px;
			border-top: 1px solid #e2e8f0;
		}

		.auth-footer p {
			margin: 0;
			color: #718096;
			font-size: 15px;
		}

		.auth-link {
			color: #ff98cc;
			text-decoration: none;
			font-weight: 600;
			transition: color 0.3s ease;
		}

		.auth-link:hover {
			color: #ff98cc;
			text-decoration: underline;
		}

		/* Decorative Elements */
		.auth-decoration {
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			pointer-events: none;
			overflow: hidden;
		}

		.decoration-circle {
			position: absolute;
			border-radius: 50%;
			background: rgba(255, 255, 255, 0.1);
			animation: float 6s ease-in-out infinite;
		}

		.circle-1 {
			width: 200px;
			height: 200px;
			top: -100px;
			right: -100px;
			animation-delay: 0s;
		}

		.circle-2 {
			width: 150px;
			height: 150px;
			bottom: -75px;
			left: -75px;
			animation-delay: 2s;
		}

		.circle-3 {
			width: 100px;
			height: 100px;
			top: 50%;
			left: -50px;
			animation-delay: 4s;
		}

		@keyframes float {
			0%, 100% {
				transform: translateY(0px) rotate(0deg);
				opacity: 0.1;
			}
			50% {
				transform: translateY(-20px) rotate(180deg);
				opacity: 0.2;
			}
		}

		/* Responsive Design */
		@media (max-width: 768px) {
			.login-section {
				padding: 20px 15px;
				margin-top: 100px;
			}

			.auth-card {
				border-radius: 20px;
			}

			.auth-header {
				padding: 30px 20px 25px;
			}

			.auth-icon {
				width: 70px;
				height: 70px;
				font-size: 32px;
			}

			.auth-title {
				font-size: 24px;
			}

			.auth-body {
				padding: 30px 20px;
			}

			.form-row {
				grid-template-columns: 1fr;
				gap: 16px;
			}

			.form-input {
				padding: 14px 14px 14px 45px;
				font-size: 16px;
			}

			.input-icon {
				left: 14px;
				font-size: 16px;
			}

			.auth-btn {
				padding: 14px 28px;
				font-size: 16px;
			}
		}

		.alert {
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="flag" value="9"/>
</jsp:include>
<!--//header-->

<!-- Login Section -->
<div class="login-section">
	<div class="auth-container">
		<div class="auth-card">
			<div class="auth-header">
				<div class="auth-icon">
					<i class="fas fa-user-circle"></i>
				</div>
				<h2 class="auth-title">欢迎回来</h2>
				<p class="auth-subtitle">登录您的账号，继续享受优质服务</p>
			</div>

			<div class="auth-body">
				<c:if test="${!empty msg}">
					<div class="alert alert-success">${msg}</div>
				</c:if>
				<c:if test="${!empty failMsg}">
					<div class="alert alert-danger">${failMsg}</div>
				</c:if>
				<form action="${pageContext.request.contextPath}/user_login" method="post" class="auth-form">
					<div class="form-row">
						<div class="form-group">
							<label for="ue" class="form-label">
								<i class="fas fa-user"></i>
								用户名/手机号
							</label>
							<div class="input-wrapper">
								<input type="text" id="ue" name="ue" class="form-input" placeholder="请输入用户名或手机号" required>
								<div class="input-icon">
									<i class="fas fa-user"></i>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="form-label">
								<i class="fas fa-lock"></i>
								密码
							</label>
							<div class="input-wrapper">
								<input type="password" id="password" name="password" class="form-input" placeholder="请输入密码" required>
								<div class="input-icon">
									<i class="fas fa-lock"></i>
								</div>
							</div>
						</div>
					</div>

					<button type="submit" class="auth-btn">
						<span>登录账号</span>
						<i class="fas fa-arrow-right"></i>
					</button>
				</form>

				<div class="auth-footer">
					<p>还没有账号？
						<a href="${pageContext.request.contextPath}/user_register" class="auth-link">立即注册</a>
					</p>
				</div>
			</div>
		</div>

		<!-- Decorative Elements -->
		<div class="auth-decoration">
			<div class="decoration-circle circle-1"></div>
			<div class="decoration-circle circle-2"></div>
			<div class="decoration-circle circle-3"></div>
		</div>
	</div>
</div>
<!--//login-section-->

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->
</body>
</html>