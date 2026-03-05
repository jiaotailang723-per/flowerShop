<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>用户注册 - 花卉商城</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<style>
		body {
			background: url('${pageContext.request.contextPath}/images/slid.jpg') center/cover no-repeat fixed !important;
			background-attachment: fixed;
		}

		/* Authentication Page Styles */
		.register-section {
			min-height: calc(100vh - 100px);
			padding: 120px 20px 40px;
			display: flex;
			align-items: center;
			justify-content: center;
			position: relative;
			overflow: hidden;
		}

		.register-section::before {
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
			max-width: 900px;
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
			gap: 24px;
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

		.form-group.full-width {
			grid-column: 1 / -1;
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

		.required {
			color: #e53e3e;
			margin-left: 4px;
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

		/* Password validation styles */
		.password-match {
			border-color: #48bb78 !important;
			box-shadow: 0 0 0 3px rgba(72, 187, 120, 0.1) !important;
		}

		.password-mismatch {
			border-color: #f56565 !important;
			box-shadow: 0 0 0 3px rgba(245, 101, 101, 0.1) !important;
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

		.form-input:focus ~ .input-icon {
			color: #ff98cc;
		}

		.error-message {
			color: #e53e3e;
			font-size: 13px;
			margin-top: 4px;
			display: none;
		}

		.error-message.show {
			display: block;
		}

		.success-message {
			color: #48bb78;
			font-size: 13px;
			margin-top: 4px;
			display: none;
		}

		.success-message.show {
			display: block;
		}

		.checking {
			color: #718096;
			font-size: 13px;
			margin-top: 4px;
			display: none !important;
		}

		.checking.show {
			display: block !important;
		}

		.form-input.available {
			border-color: #48bb78 !important;
			box-shadow: 0 0 0 3px rgba(72, 187, 120, 0.1) !important;
		}

		.form-input.exist {
			border-color: #f56565 !important;
			box-shadow: 0 0 0 3px rgba(245, 101, 101, 0.1) !important;
		}

		.auth-btn {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			border: none;
			padding: 16px 32px;
			border-radius: 12px;
			font-size: 18px;
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
			margin-top: 24px;
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

		.alert {
			padding: 12px 20px;
			margin-bottom: 20px;
			border-radius: 8px;
			background: #fee;
			border: 1px solid #fcc;
			color: #c33;
		}

		/* Responsive Design */
		@media (max-width: 768px) {
			.register-section {
				padding: 100px 15px 30px;
			}

			.auth-container {
				max-width: 100%;
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
	</style>
	<script>
		$(document).ready(function() {
			// 获取contextPath
			var contextPath = "${pageContext.request.contextPath}";
			if (!contextPath || contextPath === "") {
				contextPath = "";
			}
			
			// 初始化：隐藏所有checking消息
			$(".checking").removeClass("show");
			
			// 防抖函数
			function debounce(func, wait) {
				var timeout;
				return function() {
					var context = this;
					var args = arguments;
					clearTimeout(timeout);
					timeout = setTimeout(function() {
						func.apply(context, args);
					}, wait);
				};
			}

			// 检查用户名是否存在
			var checkUsernameDebounced = debounce(function(username) {
				if (!username || username.length < 6) {
					return;
				}
				
				var $input = $("[name='username']");
				var $errorMsg = $input.siblings(".error-message");
				var $successMsg = $input.siblings(".success-message");
				var $checking = $input.siblings(".checking");
				var $icon = $input.siblings(".input-icon").find("i");
				
				// 显示检查中状态
				$checking.text("正在检查...").addClass("show");
				$errorMsg.removeClass("show");
				$successMsg.removeClass("show");
				$input.removeClass("available exist");
				// 移除所有可能的图标类，只保留fa-spinner和fa-spin
				$icon.removeClass("fa-user fa-check-circle fa-times-circle fa-spinner fa-spin").addClass("fa-spinner fa-spin");
				$icon.css('color', '#718096');
				
				var checkUrl = contextPath + "/user_check/username";
				console.log("检查用户名，URL:", checkUrl, "用户名:", username);
				
				$.ajax({
					url: checkUrl,
					type: "GET",
					data: {username: username},
					dataType: "text",
					timeout: 5000,
					success: function(data) {
						console.log("用户名检查响应:", data);
						$checking.removeClass("show");
						
						// 移除spinner图标
						$icon.removeClass("fa-spinner fa-spin");
						
						var response = data.trim();
						if (response === "exist") {
							$errorMsg.text("该用户名已被使用，请选择其他用户名").addClass("show");
							$successMsg.removeClass("show");
							$input.removeClass("available").addClass("exist");
							$icon.removeClass("fa-user fa-check-circle").addClass("fa-times-circle");
							$icon.css('color', '#f56565');
						} else if (response === "available") {
							$errorMsg.removeClass("show");
							$successMsg.text("该用户名可用").addClass("show");
							$input.removeClass("exist").addClass("available");
							$icon.removeClass("fa-user fa-times-circle").addClass("fa-check-circle");
							$icon.css('color', '#48bb78');
						} else if (response === "error") {
							$errorMsg.text("检查失败，请稍后重试").addClass("show");
							$successMsg.removeClass("show");
							$icon.removeClass("fa-check-circle fa-times-circle").addClass("fa-user");
							$icon.css('color', '#a0aec0');
						} else {
							// 未知响应，恢复默认状态
							$icon.removeClass("fa-check-circle fa-times-circle").addClass("fa-user");
							$icon.css('color', '#a0aec0');
							console.warn("未知响应:", data);
						}
					},
					error: function(xhr, status, error) {
						$checking.removeClass("show");
						// 移除spinner图标，恢复默认图标
						$icon.removeClass("fa-spinner fa-spin fa-check-circle fa-times-circle").addClass("fa-user");
						$icon.css('color', '#a0aec0');
						console.error("检查用户名失败:", status, error, "URL:", checkUrl, "响应:", xhr.responseText);
					}
				});
			}, 500);

			// 检查手机号是否存在
			var checkUserphoneDebounced = debounce(function(userphone) {
				if (!userphone || userphone.length !== 11) {
					return;
				}
				
				var $input = $("[name='userphone']");
				var $errorMsg = $input.siblings(".error-message");
				var $successMsg = $input.siblings(".success-message");
				var $checking = $input.siblings(".checking");
				var $icon = $input.siblings(".input-icon").find("i");
				
				// 显示检查中状态
				$checking.text("正在检查...").addClass("show");
				$errorMsg.removeClass("show");
				$successMsg.removeClass("show");
				$input.removeClass("available exist");
				// 移除所有可能的图标类，只保留fa-spinner和fa-spin
				$icon.removeClass("fa-phone fa-check-circle fa-times-circle fa-spinner fa-spin").addClass("fa-spinner fa-spin");
				$icon.css('color', '#718096');
				
				var checkUrl = contextPath + "/user_check/userphone";
				console.log("检查手机号，URL:", checkUrl, "手机号:", userphone);
				
				$.ajax({
					url: checkUrl,
					type: "GET",
					data: {userphone: userphone},
					dataType: "text",
					timeout: 5000,
					success: function(data) {
						console.log("手机号检查响应:", data);
						$checking.removeClass("show");
						
						// 移除spinner图标
						$icon.removeClass("fa-spinner fa-spin");
						
						var response = data.trim();
						if (response === "exist") {
							$errorMsg.text("该手机号已被注册，请使用其他手机号").addClass("show");
							$successMsg.removeClass("show");
							$input.removeClass("available").addClass("exist");
							$icon.removeClass("fa-phone fa-check-circle").addClass("fa-times-circle");
							$icon.css('color', '#f56565');
						} else if (response === "available") {
							$errorMsg.removeClass("show");
							$successMsg.text("该手机号可用").addClass("show");
							$input.removeClass("exist").addClass("available");
							$icon.removeClass("fa-phone fa-times-circle").addClass("fa-check-circle");
							$icon.css('color', '#48bb78');
						} else if (response === "error") {
							$errorMsg.text("检查失败，请稍后重试").addClass("show");
							$successMsg.removeClass("show");
							$icon.removeClass("fa-check-circle fa-times-circle").addClass("fa-phone");
							$icon.css('color', '#a0aec0');
						} else {
							// 未知响应，恢复默认状态
							$icon.removeClass("fa-check-circle fa-times-circle").addClass("fa-phone");
							$icon.css('color', '#a0aec0');
							console.warn("未知响应:", data);
						}
					},
					error: function(xhr, status, error) {
						$checking.removeClass("show");
						// 移除spinner图标，恢复默认图标
						$icon.removeClass("fa-spinner fa-spin fa-check-circle fa-times-circle").addClass("fa-phone");
						$icon.css('color', '#a0aec0');
						console.error("检查手机号失败:", status, error, "URL:", checkUrl, "响应:", xhr.responseText);
					}
				});
			}, 500);

			// 验证用户名：只允许字母、数字和下划线，长度在 6 到 20 之间
			function validateUsername() {
				var username = $("[name='username']").val().trim();
				var usernamePattern = /^[a-zA-Z0-9_]{6,20}$/;
				var $errorMsg = $("[name='username']").siblings(".error-message");
				var $successMsg = $("[name='username']").siblings(".success-message");
				var $checking = $("[name='username']").siblings(".checking");
				var $input = $("[name='username']");
				var $icon = $input.siblings(".input-icon").find("i");
				
				if (!username) {
					$errorMsg.text("请输入用户名").addClass("show");
					$successMsg.removeClass("show");
					$checking.removeClass("show");
					$input.removeClass("available exist");
					$icon.removeClass("fa-check-circle fa-times-circle fa-spinner fa-spin").addClass("fa-user");
					$icon.css('color', '#a0aec0');
					return false;
				}
				
				if (!usernamePattern.test(username)) {
					$errorMsg.text("用户名只能包含字母、数字和下划线，长度在 6 到 20 之间").addClass("show");
					$successMsg.removeClass("show");
					$checking.removeClass("show");
					$input.removeClass("available exist");
					$icon.removeClass("fa-check-circle fa-times-circle fa-spinner fa-spin").addClass("fa-user");
					$icon.css('color', '#a0aec0');
					return false;
				} else {
					// 格式正确，检查是否存在
					checkUsernameDebounced(username);
					return true;
				}
			}

			// 验证手机号码：11 位数字，以 1 开头
			function validateUserphone() {
				var userphone = $("[name='userphone']").val().trim();
				var userphonePattern = /^1\d{10}$/;
				var $errorMsg = $("[name='userphone']").siblings(".error-message");
				var $successMsg = $("[name='userphone']").siblings(".success-message");
				var $checking = $("[name='userphone']").siblings(".checking");
				var $input = $("[name='userphone']");
				var $icon = $input.siblings(".input-icon").find("i");
				
				if (!userphone) {
					$errorMsg.text("请输入手机号码").addClass("show");
					$successMsg.removeClass("show");
					$checking.removeClass("show");
					$input.removeClass("available exist");
					$icon.removeClass("fa-check-circle fa-times-circle fa-spinner fa-spin").addClass("fa-phone");
					$icon.css('color', '#a0aec0');
					return false;
				}
				
				if (!userphonePattern.test(userphone)) {
					$errorMsg.text("请输入正确的 11 位手机号码，以 1 开头").addClass("show");
					$successMsg.removeClass("show");
					$checking.removeClass("show");
					$input.removeClass("available exist");
					$icon.removeClass("fa-check-circle fa-times-circle fa-spinner fa-spin").addClass("fa-phone");
					$icon.css('color', '#a0aec0');
					return false;
				} else {
					// 格式正确，检查是否存在
					checkUserphoneDebounced(userphone);
					return true;
				}
			}

			// 验证密码：至少包含一个大写字母和一个小写字母，长度在 8 到 20 之间
			function validatePassword() {
				var password = $("[name='password']").val();
				var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])[A-Za-z\d]{8,20}$/;
				var $errorMsg = $("[name='password']").siblings(".error-message");
				
				if (!password) {
					$errorMsg.text("请输入密码").addClass("show");
					return false;
				}
				
				if (!passwordPattern.test(password)) {
					$errorMsg.text("密码至少包含一个大写字母和一个小写字母，长度在 8 到 20 之间").addClass("show");
					return false;
				} else {
					$errorMsg.removeClass("show");
					return true;
				}
			}

			// 实时密码匹配验证
			function validatePasswordMatch() {
				var password = $("[name='password']").val();
				var confirmPassword = $("[name='confirmPassword']").val();
				var $confirmInput = $("[name='confirmPassword']");
				var $errorMsg = $confirmInput.siblings(".error-message");
				var $icon = $confirmInput.siblings(".input-icon").find("i");

				if (confirmPassword === '') {
					$confirmInput.removeClass('password-match password-mismatch');
					$icon.removeClass('fa-check-circle fa-times-circle').addClass('fa-lock');
					$icon.css('color', '#a0aec0');
					$errorMsg.removeClass("show");
				} else if (password === confirmPassword && password !== '') {
					$confirmInput.removeClass('password-mismatch').addClass('password-match');
					$icon.removeClass('fa-lock fa-times-circle').addClass('fa-check-circle');
					$icon.css('color', '#48bb78');
					$errorMsg.removeClass("show");
				} else {
					$confirmInput.removeClass('password-match').addClass('password-mismatch');
					$icon.removeClass('fa-lock fa-check-circle').addClass('fa-times-circle');
					$icon.css('color', '#f56565');
					$errorMsg.text("两次输入的密码不一致").addClass("show");
				}
			}

			// 监听输入框的输入事件
			$("[name='username']").on("input", validateUsername);
			$("[name='userphone']").on("input", validateUserphone);
			$("[name='password']").on("input", function() {
				validatePassword();
				validatePasswordMatch();
			});
			$("[name='confirmPassword']").on("input", validatePasswordMatch);

			// 监听表单的提交事件
			$("form[name='registerForm']").submit(function(event) {
				if (!validateUsername() || !validateUserphone() || !validatePassword()) {
					event.preventDefault();
					layer.msg("请检查表单输入是否正确", {icon: 0});
					return false;
				}

				var password = $("[name='password']").val();
				var confirmPassword = $("[name='confirmPassword']").val();
				if (password !== confirmPassword) {
					event.preventDefault();
					layer.msg("两次输入的密码不一致", {icon: 0});
					return false;
				}

				// 检查用户名和手机号是否已存在
				var $usernameInput = $("[name='username']");
				var $userphoneInput = $("[name='userphone']");
				
				if ($usernameInput.hasClass("exist")) {
					event.preventDefault();
					layer.msg("该用户名已被使用，请选择其他用户名", {icon: 0});
					$usernameInput.focus();
					return false;
				}
				
				if ($userphoneInput.hasClass("exist")) {
					event.preventDefault();
					layer.msg("该手机号已被注册，请使用其他手机号", {icon: 0});
					$userphoneInput.focus();
					return false;
				}

				// 如果正在检查中，阻止提交
				if ($usernameInput.siblings(".checking").hasClass("show") || 
				    $userphoneInput.siblings(".checking").hasClass("show")) {
					event.preventDefault();
					layer.msg("正在验证中，请稍候...", {icon: 0, time: 1500});
					return false;
				}

				return true;
			});
		});
	</script>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="flag" value="10"/>
</jsp:include>
<!--//header-->

<!-- Register Section -->
<div class="register-section">
	<div class="auth-container">
		<div class="auth-card">
			<div class="auth-header">
				<div class="auth-icon">
					<i class="fas fa-user-plus"></i>
				</div>
				<h2 class="auth-title">创建账号</h2>
				<p class="auth-subtitle">简单注册，立即开启您的购物之旅</p>
			</div>

			<div class="auth-body">
				<c:if test="${not empty msg}">
					<div class="alert alert-danger">${msg}</div>
				</c:if>
				<form action="${pageContext.request.contextPath}/user_register" method="post" name="registerForm" class="auth-form">
					<div class="form-row">
						<div class="form-group">
							<label for="username" class="form-label">
								<i class="fas fa-user"></i>
								用户名
								<span class="required">*</span>
							</label>
							<div class="input-wrapper">
								<input type="text" id="username" name="username" class="form-input" placeholder="请输入用户名" required>
								<div class="input-icon">
									<i class="fas fa-user"></i>
								</div>
								<div class="error-message"></div>
								<div class="success-message"></div>
								<div class="checking"></div>
							</div>
						</div>

						<div class="form-group">
							<label for="userphone" class="form-label">
								<i class="fas fa-phone"></i>
								手机号码
								<span class="required">*</span>
							</label>
							<div class="input-wrapper">
								<input type="text" id="userphone" name="userphone" class="form-input" placeholder="请输入手机号码" required>
								<div class="input-icon">
									<i class="fas fa-phone"></i>
								</div>
								<div class="error-message"></div>
								<div class="success-message"></div>
								<div class="checking"></div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="form-label">
								<i class="fas fa-lock"></i>
								密码
								<span class="required">*</span>
							</label>
							<div class="input-wrapper">
								<input type="password" id="password" name="password" class="form-input" placeholder="请输入密码" required>
								<div class="input-icon">
									<i class="fas fa-lock"></i>
								</div>
								<div class="error-message"></div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirmPassword" class="form-label">
								<i class="fas fa-lock"></i>
								确认密码
								<span class="required">*</span>
							</label>
							<div class="input-wrapper">
								<input type="password" id="confirmPassword" name="confirmPassword" class="form-input" placeholder="请再次输入密码" required>
								<div class="input-icon">
									<i class="fas fa-lock"></i>
								</div>
								<div class="error-message"></div>
							</div>
						</div>

						<div class="form-group">
							<label for="name" class="form-label">
								<i class="fas fa-user-circle"></i>
								收货人
							</label>
							<div class="input-wrapper">
								<input type="text" id="name" name="name" class="form-input" placeholder="请输入收货人姓名">
								<div class="input-icon">
									<i class="fas fa-user-circle"></i>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phone" class="form-label">
								<i class="fas fa-phone-alt"></i>
								收货电话
							</label>
							<div class="input-wrapper">
								<input type="text" id="phone" name="phone" class="form-input" placeholder="请输入收货电话">
								<div class="input-icon">
									<i class="fas fa-phone-alt"></i>
								</div>
							</div>
						</div>

						<div class="form-group full-width">
							<label for="address" class="form-label">
								<i class="fas fa-map-marker-alt"></i>
								收货地址
							</label>
							<div class="input-wrapper">
								<input type="text" id="address" name="address" class="form-input" placeholder="请输入收货地址">
								<div class="input-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
						</div>
					</div>

					<button type="submit" class="auth-btn">
						<span>创建账号</span>
						<i class="fas fa-user-plus"></i>
					</button>
				</form>

				<div class="auth-footer">
					<p>已有账号？
						<a href="${pageContext.request.contextPath}/user_login" class="auth-link">立即登录</a>
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
<!--//account-->

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->
</body>
</html>
