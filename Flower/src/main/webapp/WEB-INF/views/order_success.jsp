<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>订单提交成功 - 朝花夕拾鲜花店</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="description" content="订单提交成功">
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

		.success-page {
			min-height: calc(100vh - 100px);
			padding: 120px 20px 40px;
		}

		.success-container {
			max-width: 1000px;
			margin: 0 auto;
		}

		.success-card {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 24px;
			box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
			overflow: hidden;
			border: 1px solid rgba(255, 255, 255, 0.2);
		}

		.success-header {
			text-align: center;
			padding: 60px 40px 40px;
			background: linear-gradient(135deg, rgba(40, 167, 69, 0.1), rgba(32, 201, 151, 0.1));
			border-bottom: 1px solid #e2e8f0;
		}

		.success-icon {
			width: 100px;
			height: 100px;
			margin: 0 auto 30px;
			background: linear-gradient(135deg, #28a745, #20c997);
			border-radius: 50%;
			display: flex;
			align-items: center;
			justify-content: center;
			box-shadow: 0 8px 30px rgba(40, 167, 69, 0.4);
		}

		.success-icon i {
			font-size: 60px;
			color: white;
		}

		.success-title {
			margin: 0 0 15px 0;
			font-size: 36px;
			font-weight: 700;
			color: #2d3748;
		}

		.success-subtitle {
			margin: 0;
			color: #718096;
			font-size: 18px;
		}

		.success-content {
			padding: 40px;
		}

		.order-info-section {
			background: linear-gradient(135deg, #f8f9fa, #e9ecef);
			border-radius: 16px;
			padding: 30px;
			margin-bottom: 30px;
		}

		.order-info-item {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 15px 0;
			border-bottom: 1px solid #dee2e6;
		}

		.order-info-item:last-child {
			border-bottom: none;
		}

		.order-info-label {
			font-size: 16px;
			font-weight: 600;
			color: #495057;
		}

		.order-info-value {
			font-size: 18px;
			font-weight: 700;
			color: #e74c3c;
		}

		.order-items-section {
			margin-bottom: 30px;
		}

		.section-title {
			font-size: 24px;
			font-weight: 700;
			color: #2d3748;
			margin-bottom: 20px;
			padding-bottom: 15px;
			border-bottom: 3px solid #ff98cc;
		}

		.order-items-table {
			width: 100%;
			border-collapse: collapse;
			background: white;
			border-radius: 12px;
			overflow: hidden;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
		}

		.order-items-table thead {
			background: linear-gradient(135deg, #f8f9fa, #e9ecef);
		}

		.order-items-table th {
			padding: 20px 15px;
			text-align: left;
			font-weight: 700;
			color: #495057;
			border-bottom: 2px solid #dee2e6;
		}

		.order-items-table td {
			padding: 20px 15px;
			border-bottom: 1px solid #f0f0f0;
		}

		.order-items-table tbody tr:last-child td {
			border-bottom: none;
		}

		.order-items-table tbody tr:hover {
			background-color: #f8f9fa;
		}

		.item-name {
			font-weight: 600;
			color: #212529;
			font-size: 16px;
		}

		.item-price {
			color: #e74c3c;
			font-weight: 700;
			font-size: 18px;
		}

		.item-amount {
			color: #6c757d;
			font-size: 16px;
		}

		.action-buttons {
			display: flex;
			justify-content: center;
			gap: 20px;
			flex-wrap: wrap;
			margin-top: 40px;
		}

		.action-btn {
			display: inline-flex;
			align-items: center;
			gap: 10px;
			padding: 16px 40px;
			border-radius: 12px;
			font-size: 18px;
			font-weight: 600;
			text-decoration: none;
			transition: all 0.3s ease;
			box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		}

		.action-btn.primary {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
		}

		.action-btn.primary:hover {
			transform: translateY(-2px);
			box-shadow: 0 8px 25px rgba(255, 105, 180, 0.4);
			color: white;
			text-decoration: none;
		}

		.action-btn.secondary {
			background: linear-gradient(135deg, #6c757d, #5a6268);
			color: white;
		}

		.action-btn.secondary:hover {
			transform: translateY(-2px);
			box-shadow: 0 8px 25px rgba(108, 117, 125, 0.4);
			color: white;
			text-decoration: none;
		}

		@media (max-width: 768px) {
			.success-page {
				padding: 100px 15px 20px;
			}

			.success-header {
				padding: 40px 20px 30px;
			}

			.success-title {
				font-size: 28px;
			}

			.success-content {
				padding: 20px;
			}

			.order-items-table {
				font-size: 14px;
			}

			.order-items-table th,
			.order-items-table td {
				padding: 12px 8px;
			}

			.action-buttons {
				flex-direction: column;
			}

			.action-btn {
				width: 100%;
				justify-content: center;
			}
		}
	</style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!--//header-->

<!-- 订单成功页面 -->
<main class="success-page">
	<div class="success-container">
		<div class="success-card">
			<!-- 成功头部 -->
			<header class="success-header">
				<div class="success-icon">
					<i class="fas fa-check-circle"></i>
				</div>
				<h1 class="success-title">订单提交成功！</h1>
				<p class="success-subtitle">感谢您的购买，我们将尽快为您处理订单</p>
			</header>

			<!-- 成功内容 -->
			<div class="success-content">
				<c:if test="${!empty order}">
					<!-- 订单信息 -->
					<div class="order-info-section">
						<div class="order-info-item">
							<span class="order-info-label">订单号：</span>
							<span class="order-info-value">${order.id}</span>
						</div>
						<div class="order-info-item">
							<span class="order-info-label">订单总金额：</span>
							<span class="order-info-value">¥ ${order.total}</span>
						</div>
					</div>

					<!-- 订单商品列表 -->
					<div class="order-items-section">
						<h2 class="section-title">
							<i class="fas fa-shopping-bag"></i> 订单商品
						</h2>
						<table class="order-items-table">
							<thead>
								<tr>
									<th>商品名称</th>
									<th>单价</th>
									<th>数量</th>
									<th>小计</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order.itemList}" var="item">
									<tr>
										<td class="item-name">${item.goodsName}</td>
										<td class="item-price">¥ ${item.price}</td>
										<td class="item-amount">${item.amount} 件</td>
										<td class="item-price">¥ ${item.price * item.amount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>

				<!-- 操作按钮 -->
				<div class="action-buttons">
					<a href="${pageContext.request.contextPath}/order_list" class="action-btn primary">
						<i class="fas fa-list-alt"></i>
						查看我的订单
					</a>
					<a href="${pageContext.request.contextPath}/index" class="action-btn secondary">
						<i class="fas fa-home"></i>
						返回首页
					</a>
				</div>
			</div>
		</div>
	</div>
</main>

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->
</body>
</html>