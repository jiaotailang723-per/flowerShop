<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>我的订单 - 朝花夕拾鲜花店</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="description" content="查看和管理您的订单信息">
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

		.order-list-container {
			width: 100%;
			max-width: 1600px;
			margin: 120px auto 40px;
			padding: 0 40px;
		}

		.order-list-header {
			text-align: center;
			margin-bottom: 40px;
			padding: 40px 0;
			background: linear-gradient(135deg, #ff98cc, #FFC0CB);
			color: white;
			border-radius: 20px;
			box-shadow: 0 8px 32px rgba(255, 105, 180, 0.3);
		}

		.order-list-header h1 {
			margin: 0;
			font-size: 4rem;
			font-weight: 800;
			text-shadow: 4px 4px 8px rgba(0,0,0,0.3);
		}

		.order-list-header p {
			margin: 15px 0 0;
			font-size: 1.2rem;
			opacity: 0.95;
		}

		.order-card {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 20px;
			box-shadow: 0 8px 35px rgba(0,0,0,0.1);
			margin-bottom: 32px;
			overflow: hidden;
			border: 2px solid #f0f0f0;
			transition: all 0.3s ease;
		}

		.order-card:hover {
			transform: translateY(-4px);
			box-shadow: 0 12px 40px rgba(0,0,0,0.15);
		}

		.order-header {
			background: linear-gradient(135deg, #f8f9fa, #e9ecef);
			padding: 25px 30px;
			border-bottom: 3px solid #dee2e6;
			display: flex;
			justify-content: space-between;
			align-items: center;
			flex-wrap: wrap;
			gap: 15px;
		}

		.order-info {
			display: flex;
			flex-direction: column;
			gap: 6px;
		}

		.order-number {
			font-weight: 800;
			color: #212529;
			font-size: 18px;
		}

		.order-date {
			color: #6c757d;
			font-size: 16px;
		}

		.order-status {
			padding: 6px 16px;
			border-radius: 25px;
			font-size: 14px;
			font-weight: 700;
			text-align: center;
			min-width: 100px;
		}

		.status-pending {
			background: #fff3cd;
			color: #856404;
		}

		.status-paid {
			background: #d4edda;
			color: #155724;
		}

		.status-shipped {
			background: #cce5ff;
			color: #004085;
		}

		.status-completed {
			background: #d1ecf1;
			color: #0c5460;
		}

		.order-body {
			padding: 30px;
		}

		.order-items {
			margin-bottom: 20px;
		}

		.order-item {
			display: flex;
			align-items: center;
			padding: 15px 0;
			border-bottom: 1px solid #f0f0f0;
		}

		.order-item:last-child {
			border-bottom: none;
		}

		.item-info {
			flex: 1;
			margin-left: 15px;
		}

		.item-name {
			font-weight: 600;
			color: #212529;
			margin-bottom: 4px;
			font-size: 16px;
		}

		.item-details {
			color: #6c757d;
			font-size: 14px;
		}

		.item-price {
			color: #e74c3c;
			font-weight: 600;
			font-size: 16px;
			text-align: right;
			min-width: 100px;
		}

		.order-summary {
			background: #f8f9fa;
			border-radius: 12px;
			padding: 20px;
			margin-bottom: 20px;
		}

		.summary-row {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 10px;
		}

		.summary-row:last-child {
			margin-bottom: 0;
			padding-top: 10px;
			border-top: 2px solid #dee2e6;
			font-weight: 700;
			font-size: 18px;
		}

		.summary-label {
			color: #6c757d;
			font-size: 16px;
		}

		.summary-value {
			color: #212529;
			font-weight: 600;
		}

		.summary-value.total {
			color: #e74c3c;
			font-size: 20px;
		}

		.order-details {
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
			gap: 20px;
			margin-bottom: 20px;
		}

		.detail-group {
			background: #f8f9fa;
			border-radius: 12px;
			padding: 20px;
		}

		.detail-label {
			font-weight: 600;
			color: #495057;
			margin-bottom: 8px;
			font-size: 14px;
		}

		.detail-value {
			color: #212529;
			line-height: 1.6;
		}

		.empty-orders {
			text-align: center;
			padding: 80px 20px;
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 20px;
			box-shadow: 0 8px 35px rgba(0,0,0,0.1);
		}

		.empty-orders i {
			font-size: 5rem;
			color: #dee2e6;
			margin-bottom: 20px;
		}

		.empty-orders h3 {
			color: #6c757d;
			margin-bottom: 10px;
		}

		.empty-orders p {
			color: #6c757d;
			margin-bottom: 20px;
		}

		.btn-shop-now {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			border: none;
			padding: 12px 30px;
			border-radius: 25px;
			font-weight: 600;
			font-size: 16px;
			cursor: pointer;
			transition: all 0.3s ease;
			text-decoration: none;
			display: inline-block;
		}

		.btn-shop-now:hover {
			transform: translateY(-2px);
			box-shadow: 0 6px 20px rgba(255, 105, 180, 0.4);
			color: white;
			text-decoration: none;
		}

		@media (max-width: 768px) {
			.order-list-container {
				margin-top: 100px;
				padding: 0 15px;
			}

			.order-list-header h1 {
				font-size: 2rem;
			}

			.order-header {
				flex-direction: column;
				align-items: flex-start;
			}

			.order-body {
				padding: 20px;
			}

			.order-details {
				grid-template-columns: 1fr;
			}
		}
	</style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="flag" value="5"/>
</jsp:include>
<!--//header-->

<div class="order-list-container">
	<!-- 页面标题 -->
	<div class="order-list-header">
		<h1>我的订单</h1>
		<p>查看和管理您的订单信息</p>
	</div>

	<!-- 订单列表 -->
	<c:choose>
		<c:when test="${empty orderList}">
			<div class="empty-orders">
				<i class="fas fa-shopping-cart"></i>
				<h3>暂无订单</h3>
				<p>您还没有任何订单，快去选购您心爱的花卉吧！</p>
				<a href="${pageContext.request.contextPath}/index" class="btn-shop-now">开始购物</a>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${orderList}" var="order">
				<div class="order-card">
					<div class="order-header">
						<div class="order-info">
							<div class="order-number">订单号：${order.id}</div>
							<div class="order-date">下单时间：${order.datetime}</div>
						</div>
						<div class="order-status 
							<c:choose>
								<c:when test="${order.status==1}">status-pending</c:when>
								<c:when test="${order.status==2}">status-paid</c:when>
								<c:when test="${order.status==3}">status-shipped</c:when>
								<c:when test="${order.status==4}">status-completed</c:when>
								<c:otherwise>status-pending</c:otherwise>
							</c:choose>">
							<c:choose>
								<c:when test="${order.status==1}">未付款</c:when>
								<c:when test="${order.status==2}">已付款</c:when>
								<c:when test="${order.status==3}">已发货</c:when>
								<c:when test="${order.status==4}">已完成</c:when>
								<c:otherwise>未知状态</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="order-body">
						<div class="order-items">
							<c:forEach items="${order.itemList}" var="item">
								<div class="order-item">
									<div class="item-info">
										<div class="item-name">${item.goodsName}</div>
										<div class="item-details">单价：¥${item.price} × 数量：${item.amount}</div>
									</div>
									<div class="item-price">¥${item.price * item.amount}</div>
								</div>
							</c:forEach>
						</div>

						<div class="order-summary">
							<div class="summary-row">
								<span class="summary-label">订单总计：</span>
								<span class="summary-value total">¥${order.total}</span>
							</div>
						</div>

						<div class="order-details">
							<div class="detail-group">
								<div class="detail-label">收货信息</div>
								<div class="detail-value">
									<div><strong>${order.name}</strong></div>
									<div>${order.phone}</div>
									<div style="margin-top: 8px;">${order.address}</div>
								</div>
							</div>

							<div class="detail-group">
								<div class="detail-label">支付方式</div>
								<div class="detail-value">
									<c:choose>
										<c:when test="${order.paytype==1}">微信支付</c:when>
										<c:when test="${order.paytype==2}">支付宝</c:when>
										<c:when test="${order.paytype==3}">货到付款</c:when>
										<c:otherwise>在线支付</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->
</body>
</html>