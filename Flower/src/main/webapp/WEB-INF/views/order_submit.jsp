<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>确认订单 - 朝花夕拾鲜花店</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="description" content="确认您的订单信息并完成支付">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
	<style>
		body {
			background: url('${pageContext.request.contextPath}/images/slid.jpg') center/cover no-repeat fixed !important;
			background-attachment: fixed;
		}

		.order-confirm-container {
			width: 100%;
			max-width: 1400px;
			margin: 120px auto 40px;
			padding: 0 40px;
		}

		.order-steps {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-bottom: 50px;
			padding: 30px 40px;
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 20px;
			box-shadow: 0 4px 25px rgba(0,0,0,0.1);
		}

		.step {
			display: flex;
			align-items: center;
			position: relative;
			flex: 1;
			text-align: center;
			max-width: 200px;
		}

		.step:not(:last-child)::after {
			content: '';
			position: absolute;
			right: -60px;
			top: 50%;
			transform: translateY(-50%);
			width: 120px;
			height: 3px;
			background: linear-gradient(90deg, #dee2e6, #e9ecef);
			border-radius: 2px;
			z-index: 1;
		}

		.step-circle {
			width: 50px;
			height: 50px;
			border-radius: 50%;
			display: flex;
			align-items: center;
			justify-content: center;
			margin: 0 auto 12px;
			font-weight: bold;
			font-size: 18px;
			transition: all 0.3s ease;
			position: relative;
			z-index: 2;
			box-shadow: 0 2px 8px rgba(0,0,0,0.1);
		}

		.step.active .step-circle {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			box-shadow: 0 4px 15px rgba(255, 105, 180, 0.4);
		}

		.step.completed .step-circle {
			background: linear-gradient(135deg, #28a745, #20c997);
			color: white;
			box-shadow: 0 4px 15px rgba(40, 167, 69, 0.4);
		}

		.step.pending .step-circle {
			background: #f8f9fa;
			color: #6c757d;
			border: 2px solid #dee2e6;
		}

		.step-label {
			font-size: 16px;
			font-weight: 600;
			color: #495057;
		}

		.step.active .step-label {
			color: #ff98cc;
		}

		.order-confirm-header {
			text-align: center;
			margin-bottom: 40px;
			padding: 30px 0;
			background: linear-gradient(135deg, #ff98cc, #FFC0CB);
			color: white;
			border-radius: 15px;
			box-shadow: 0 4px 20px rgba(255, 105, 180, 0.3);
		}

		.order-confirm-header h1 {
			margin: 0;
			font-size: 3.5rem;
			font-weight: 800;
			text-shadow: 3px 3px 6px rgba(0,0,0,0.3);
		}

		.order-confirm-header p {
			margin: 20px 0 0;
			font-size: 1.3rem;
			opacity: 0.95;
		}

		.shipping-info-section {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 16px;
			box-shadow: 0 8px 35px rgba(0,0,0,0.1);
			padding: 40px;
			margin-bottom: 40px;
		}

		.shipping-info-header {
			text-align: center;
			margin-bottom: 30px;
		}

		.shipping-info-header h3 {
			margin: 0;
			color: #495057;
			font-weight: 600;
			font-size: 1.4rem;
		}

		.form-group {
			margin-bottom: 20px;
		}

		.form-group label {
			display: block;
			margin-bottom: 8px;
			font-weight: 600;
			color: #495057;
			font-size: 16px;
		}

		.form-control {
			width: 100%;
			padding: 16px 20px;
			border: 3px solid #e9ecef;
			border-radius: 12px;
			font-size: 16px;
			transition: all 0.3s ease;
			background-color: #f8f9fa;
			box-sizing: border-box;
		}

		.form-control:focus {
			border-color: #ff98cc;
			box-shadow: 0 0 0 3px rgba(255, 105, 180, 0.1);
			background-color: white;
			outline: none;
		}

		.payment-section {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 16px;
			box-shadow: 0 8px 35px rgba(0,0,0,0.1);
			padding: 40px;
			margin-bottom: 40px;
		}

		.payment-header {
			text-align: center;
			margin-bottom: 30px;
		}

		.payment-header h2 {
			margin: 0 0 20px 0;
			color: #495057;
			font-weight: 600;
			font-size: 1.8rem;
		}

		.payment-amount {
			text-align: center;
			margin-bottom: 30px;
			padding: 20px;
			background: linear-gradient(135deg, #f8f9fa, #e9ecef);
			border-radius: 12px;
		}

		.payment-amount h3 {
			margin: 0;
			font-size: 2rem;
			font-weight: 700;
			color: #e74c3c;
		}

		.payment-options {
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
			gap: 20px;
		}

		.payment-option {
			border: 3px solid #e9ecef;
			border-radius: 16px;
			padding: 20px;
			cursor: pointer;
			transition: all 0.3s ease;
			background: white;
			text-align: center;
		}

		.payment-option:hover {
			border-color: #ff98cc;
			transform: translateY(-2px);
			box-shadow: 0 4px 20px rgba(255, 105, 180, 0.1);
		}

		.payment-option.selected {
			border-color: #ff98cc;
			background: linear-gradient(135deg, rgba(255, 105, 180, 0.05), rgba(255, 20, 147, 0.05));
			box-shadow: 0 4px 20px rgba(255, 105, 180, 0.2);
		}

		.payment-option input[type="radio"] {
			margin-bottom: 10px;
		}

		.payment-option img {
			width: 100%;
			height: auto;
			border-radius: 8px;
		}

		.order-submit-section {
			text-align: center;
			padding: 30px 0;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-wrap: wrap;
			gap: 20px;
		}

		.btn-submit-order {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			border: none;
			padding: 20px 60px;
			font-size: 20px;
			font-weight: 700;
			border-radius: 50px;
			cursor: pointer;
			transition: all 0.3s ease;
			box-shadow: 0 8px 35px rgba(255, 105, 180, 0.4);
			text-transform: uppercase;
			letter-spacing: 2px;
		}

		.btn-submit-order:hover {
			transform: translateY(-2px);
			box-shadow: 0 6px 25px rgba(255, 105, 180, 0.6);
		}

		.btn-back-cart {
			display: inline-block;
			background: linear-gradient(135deg, #6c757d, #5a6268);
			color: white;
			border: none;
			padding: 20px 60px;
			font-size: 20px;
			font-weight: 700;
			border-radius: 50px;
			cursor: pointer;
			transition: all 0.3s ease;
			box-shadow: 0 8px 35px rgba(108, 117, 125, 0.4);
			text-transform: uppercase;
			letter-spacing: 2px;
			text-decoration: none;
		}

		.btn-back-cart:hover {
			transform: translateY(-2px);
			box-shadow: 0 6px 25px rgba(108, 117, 125, 0.6);
			color: white;
			text-decoration: none;
		}

		@media (max-width: 768px) {
			.order-confirm-container {
				margin-top: 100px;
				padding: 0 15px;
			}

			.order-confirm-header h1 {
				font-size: 2rem;
			}

			.shipping-info-section,
			.payment-section {
				padding: 20px;
			}

			.btn-submit-order {
				padding: 14px 30px;
				font-size: 16px;
			}
		}
	</style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!--//header-->

<div class="order-confirm-container">
	<!-- 步骤指示器 -->
	<div class="order-steps">
		<div class="step completed">
			<div class="step-circle">1</div>
			<div class="step-label">购物车</div>
		</div>
		<div class="step active">
			<div class="step-circle">2</div>
			<div class="step-label">确认订单</div>
		</div>
		<div class="step pending">
			<div class="step-circle">3</div>
			<div class="step-label">付款完成</div>
		</div>
	</div>

	<!-- 页面标题 -->
	<div class="order-confirm-header">
		<h1>确认订单</h1>
		<p>请仔细检查您的订单信息，确认无误后提交</p>
	</div>

	<!-- 配送信息表单 -->
	<div class="shipping-info-section">
		<div class="shipping-info-header">
			<h3><i class="fas fa-map-marker-alt"></i> 配送信息</h3>
		</div>
		<form class="form-horizontal" action="${pageContext.request.contextPath}/order_confirm" method="post" id="payform">
			<div class="form-group">
				<label for="name">收货人</label>
				<input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="输入收货人" required>
			</div>
			<div class="form-group">
				<label for="phone">收货电话</label>
				<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="输入收货电话" required>
			</div>
			<div class="form-group">
				<label for="address">收货地址</label>
				<input type="text" class="form-control" id="address" name="address" value="${user.address}" placeholder="输入收货地址" required>
			</div>

			<!-- 支付方式选择 -->
			<div class="payment-section">
				<div class="payment-header">
					<h2><i class="fas fa-credit-card"></i> 选择支付方式</h2>
					<div class="payment-amount">
						<h3>支付金额: ¥${order.total}</h3>
					</div>
				</div>

				<div class="payment-options">
					<label class="payment-option selected">
						<input type="radio" name="paytype" value="1" checked="checked" />
						<img src="${pageContext.request.contextPath}/images/wechat.jpg" alt="微信支付">
						<div>微信支付</div>
					</label>
					<label class="payment-option">
						<input type="radio" name="paytype" value="2" />
						<img src="${pageContext.request.contextPath}/images/alipay.jpg" alt="支付宝支付">
						<div>支付宝</div>
					</label>
				</div>
			</div>

			<div class="order-submit-section">
				<a href="${pageContext.request.contextPath}/flowers_cart" class="btn-back-cart" style="margin-right: 20px;">
					<i class="fas fa-arrow-left"></i> 返回购物车
				</a>
				<button type="submit" class="btn-submit-order">
					<i class="fas fa-check-circle"></i> 确认订单
				</button>
			</div>
		</form>
	</div>
</div>

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->

<script type="text/javascript">
	$(document).ready(function() {
		$('.payment-option').on('click', function() {
			$('.payment-option').removeClass('selected');
			$(this).addClass('selected');
			$(this).find('input[type="radio"]').prop('checked', true);
		});
	});
</script>
</body>
</html>