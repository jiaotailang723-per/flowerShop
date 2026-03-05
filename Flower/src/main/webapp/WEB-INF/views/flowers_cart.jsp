<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>购物车 - 花卉商城</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="description" content="查看您的购物车，管理商品并进行结算">
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

		.cart-page {
			min-height: calc(100vh - 100px);
			padding: 120px 20px 40px;
		}

		.cart-container {
			max-width: 1400px;
			margin: 0 auto;
		}

		.cart-main-content {
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(20px);
			border-radius: 24px;
			box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
			overflow: hidden;
			border: 1px solid rgba(255, 255, 255, 0.2);
		}

		.cart-header {
			text-align: center;
			padding: 40px 30px 30px;
			background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
			border-bottom: 1px solid #e2e8f0;
		}

		.cart-title {
			margin: 0 0 10px 0;
			font-size: 32px;
			font-weight: 700;
			color: #2d3748;
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 12px;
		}

		.cart-title i {
			color: #ff98cc;
		}

		.cart-subtitle {
			margin: 0;
			color: #718096;
			font-size: 16px;
		}

		.cart-content {
			padding: 40px 30px;
		}

		.cart-table-container {
			overflow-x: auto;
			margin-bottom: 30px;
		}

		.cart-table {
			width: 100%;
			border-collapse: collapse;
		}

		.cart-table thead {
			background: linear-gradient(135deg, #f8f9fa, #e9ecef);
		}

		.cart-table th {
			padding: 20px 15px;
			text-align: center;
			font-weight: 700;
			color: #495057;
			border-bottom: 3px solid #dee2e6;
			font-size: 16px;
		}

		.cart-table td {
			padding: 25px 20px;
			border-bottom: 1px solid #f0f0f0;
			vertical-align: middle;
		}

		.cart-table tbody tr:hover {
			background-color: #f8f9fa;
		}

		.cart-item-image {
			width: 100px;
			height: 100px;
			border-radius: 12px;
			object-fit: cover;
			border: 3px solid #e9ecef;
			transition: all 0.3s ease;
		}

		.cart-item-image:hover {
			border-color: #ff98cc;
			transform: scale(1.05);
		}

		.cart-item-info h4 {
			margin: 0 0 8px 0;
			font-weight: 700;
			color: #212529;
			font-size: 18px;
		}

		.cart-item-info h4 a {
			color: #212529;
			text-decoration: none;
			transition: color 0.3s ease;
		}

		.cart-item-info h4 a:hover {
			color: #ff98cc;
		}

		.cart-item-info p {
			margin: 0;
			color: #6c757d;
			font-size: 14px;
		}

		.cart-item-price {
			color: #e74c3c;
			font-weight: 800;
			font-size: 20px;
			text-align: center;
		}

		.quantity-controls {
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 10px;
		}

		.quantity-btn {
			width: 36px;
			height: 36px;
			border: 2px solid #e9ecef;
			background: white;
			border-radius: 8px;
			cursor: pointer;
			display: flex;
			align-items: center;
			justify-content: center;
			transition: all 0.3s ease;
			color: #495057;
		}

		.quantity-btn:hover {
			border-color: #ff98cc;
			background: #ff98cc;
			color: white;
		}

		.quantity-input {
			width: 60px;
			height: 36px;
			text-align: center;
			border: 2px solid #e9ecef;
			border-radius: 8px;
			font-size: 16px;
			font-weight: 600;
		}

		.quantity-input:focus {
			outline: none;
			border-color: #ff98cc;
		}

		.cart-item-subtotal {
			color: #e74c3c;
			font-weight: bold;
			font-size: 18px;
			text-align: center;
		}

		.cart-item-actions {
			display: flex;
			justify-content: center;
			gap: 10px;
		}

		.action-btn {
			padding: 8px 16px;
			border: none;
			border-radius: 8px;
			cursor: pointer;
			font-size: 14px;
			font-weight: 600;
			transition: all 0.3s ease;
			display: flex;
			align-items: center;
			gap: 6px;
		}

		.action-btn.delete {
			background: #dc3545;
			color: white;
			min-width: 80px;
			white-space: nowrap;
		}

		.action-btn.delete:hover {
			background: #c82333;
			transform: translateY(-2px);
		}

		.checkout-section {
			background: linear-gradient(135deg, #f8f9fa, #e9ecef);
			padding: 30px;
			border-radius: 16px;
			margin-top: 30px;
		}

		.checkout-row {
			display: flex;
			justify-content: space-between;
			align-items: center;
			flex-wrap: wrap;
			gap: 20px;
		}

		.checkout-summary {
			flex: 1;
		}

		.checkout-summary-text {
			margin: 0;
			font-size: 16px;
			color: #495057;
		}

		.highlight {
			color: #ff98cc;
			font-weight: 700;
		}

		.checkout-total {
			display: flex;
			align-items: center;
			gap: 12px;
		}

		.total-label {
			font-size: 18px;
			font-weight: 600;
			color: #495057;
		}

		.total-amount {
			font-size: 28px;
			font-weight: 800;
			color: #e74c3c;
		}

		.checkout-button {
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			border: none;
			padding: 16px 40px;
			border-radius: 12px;
			font-size: 18px;
			font-weight: 700;
			cursor: pointer;
			display: flex;
			align-items: center;
			gap: 10px;
			transition: all 0.3s ease;
			box-shadow: 0 4px 15px rgba(255, 105, 180, 0.3);
		}

		.checkout-button:hover {
			transform: translateY(-2px);
			box-shadow: 0 8px 25px rgba(255, 105, 180, 0.4);
		}

		.empty-cart-state {
			text-align: center;
			padding: 80px 20px;
		}

		.empty-cart-icon {
			font-size: 80px;
			color: #dee2e6;
			margin-bottom: 20px;
		}

		.empty-cart-title {
			font-size: 24px;
			color: #6c757d;
			margin-bottom: 10px;
		}

		.empty-cart-description {
			color: #6c757d;
			margin-bottom: 30px;
		}

		.empty-cart-action {
			display: inline-block;
			padding: 12px 30px;
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			text-decoration: none;
			border-radius: 25px;
			font-weight: 600;
			transition: all 0.3s ease;
		}

		.empty-cart-action:hover {
			transform: translateY(-2px);
			box-shadow: 0 6px 20px rgba(255, 105, 180, 0.4);
			color: white;
			text-decoration: none;
		}

		@media (max-width: 768px) {
			.cart-page {
				padding: 100px 15px 20px;
			}

			.cart-content {
				padding: 20px 15px;
			}

			.cart-table {
				font-size: 14px;
			}

			.cart-table th,
			.cart-table td {
				padding: 12px 8px;
			}

			.cart-item-image {
				width: 60px;
				height: 60px;
			}

			.checkout-row {
				flex-direction: column;
			}

			.checkout-button {
				width: 100%;
				justify-content: center;
			}
		}
	</style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="flag" value="7"/>
</jsp:include>
<!--//header-->

<!-- 购物车页面主体 -->
<main class="cart-page">
	<div class="cart-container">
		<!-- 购物车主内容卡片 -->
		<div class="cart-main-content">
			<!-- 页面头部 -->
			<header class="cart-header">
				<h1 class="cart-title">
					<i class="fas fa-shopping-cart"></i>
					我的购物车
				</h1>
				<p class="cart-subtitle">精心挑选，为生活添彩</p>
			</header>

			<!-- 购物车内容区域 -->
			<div class="cart-content">
				<c:choose>
					<c:when test="${empty order || empty order.itemMap}">
						<div class="empty-cart-state">
							<div class="empty-cart-icon">
								<i class="fas fa-shopping-cart"></i>
							</div>
							<h2 class="empty-cart-title">购物车空空如也</h2>
							<p class="empty-cart-description">来这里挑选您心爱的花卉，让生活充满色彩吧！</p>
							<a href="${pageContext.request.contextPath}/index" class="empty-cart-action">
								<i class="fas fa-arrow-left"></i>
								去逛逛
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<!-- 商品列表区域 -->
						<section class="cart-items-section">
							<div class="cart-table-container">
								<table class="cart-table">
									<thead>
										<tr>
											<th>商品图片</th>
											<th>商品信息</th>
											<th>单价</th>
											<th>数量</th>
											<th>小计</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${order.itemMap}" var="item">
											<tr>
												<td>
													<a href="${pageContext.request.contextPath}/flowers_detail?id=${item.key}">
														<img src="${item.value.goods.cover}" alt="${item.value.goods.name}" class="cart-item-image" loading="lazy">
													</a>
												</td>
												<td>
													<div class="cart-item-info">
														<h4><a href="${pageContext.request.contextPath}/flowers_detail?id=${item.key}">${item.value.goods.name}</a></h4>
														<p>${item.value.goods.intro}</p>
														<p class="stock-info" style="color: #718096; font-size: 13px; margin-top: 5px;">
															库存：<span id="stock-${item.key}">${item.value.goods.stock}</span> 件
														</p>
													</div>
												</td>
												<td>
													<span class="cart-item-price">¥${item.value.price}</span>
												</td>
												<td>
													<div class="quantity-controls">
														<button type="button" class="quantity-btn" onclick="lessen(${item.key})" title="减少数量">
															<i class="fas fa-minus"></i>
														</button>
														<input type="number" value="${item.value.amount}" class="quantity-input" readonly id="amount-${item.key}">
														<button type="button" class="quantity-btn" onclick="buyWithStockCheck(${item.key}, ${item.value.goods.stock})" title="增加数量">
															<i class="fas fa-plus"></i>
														</button>
													</div>
													<div class="stock-warning" id="warning-${item.key}" style="display: none; color: #e53e3e; font-size: 12px; margin-top: 5px;"></div>
												</td>
												<td>
													<span class="cart-item-subtotal">¥${item.value.price * item.value.amount}</span>
												</td>
												<td>
													<div class="cart-item-actions">
														<button type="button" class="action-btn delete" onclick="deletes(${item.key})" title="删除商品">
															<i class="fas fa-trash-alt"></i>
															删除
														</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</section>

						<!-- 结算区域 -->
						<section class="checkout-section">
							<div class="checkout-row">
								<div class="checkout-summary">
									<p class="checkout-summary-text">
										已选择 <span class="highlight">${order.amount}</span> 件商品
									</p>
								</div>
								<div class="checkout-total">
									<span class="total-label">总计：</span>
									<span class="total-amount">¥${order.total}</span>
								</div>
								<a href="${pageContext.request.contextPath}/order_submit" class="checkout-button">
									<i class="fas fa-credit-card"></i>
									立即结算 (${order.amount})
								</a>
							</div>
						</section>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</main>

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->
	<script>
		// 页面加载时检查所有商品的库存
		$(document).ready(function() {
			<c:forEach items="${order.itemMap}" var="item">
				var goodsid = ${item.key};
				var currentAmount = ${item.value.amount};
				var currentStock = ${item.value.goods.stock};
				
				// 检查当前数量是否超过库存
				if (currentAmount > currentStock) {
					$('#warning-' + goodsid).text('购买数量(' + currentAmount + ')超过库存(' + currentStock + ')，请调整数量！').show();
				}
			</c:forEach>
		});
	</script>
</body>
</html>