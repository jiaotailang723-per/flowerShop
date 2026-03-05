<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
	<title>商品详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
	<style>
		body {
			background: url('${pageContext.request.contextPath}/images/slid.jpg') center/cover no-repeat fixed !important;
			background-attachment: fixed;
		}

		.single.main-content {
			padding: 120px 20px 40px;
			min-height: calc(100vh - 100px);
		}

		.single-grids {
			display: flex;
			flex-wrap: nowrap;
			gap: 2em;
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(10px);
			border-radius: 15px;
			box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
			margin: 2em auto;
			max-width: 1200px;
			padding: 3em 2em 5em 2em;
			align-items: flex-start;
		}

		/* 左侧商品详细信息区域 - 80% */
		.product-detail-container {
			flex: 0 0 80%;
			max-width: 80%;
			display: flex;
			flex-wrap: nowrap;
			gap: 2em;
			align-items: flex-start;
		}

		.single-left {
			flex: 0 0 40%;
			max-width: 40%;
			min-width: 0;
			padding-left: 2em;
		}

		.single-right {
			flex: 1 1 55%;
			padding-left: 2em;
			min-width: 0;
		}

		/* 右侧分类选择区域 - 20% */
		.single-grid1 {
			flex: 0 0 20%;
			max-width: 20%;
			min-width: 0;
		}

		.single-right h3 {
			font-size: 2.2em;
			font-weight: 700;
			color: #333;
			margin-bottom: 1.5em;
			line-height: 1.2;
		}

		.description {
			margin-bottom: 2em;
		}

		.description h5 {
			font-size: 1.4em;
			font-weight: 600;
			color: #ff98cc;
			margin-bottom: 1em;
			text-transform: uppercase;
			letter-spacing: 1px;
		}

		.description p {
			font-size: 1.1em;
			line-height: 1.8;
			color: #666;
			margin: 0;
		}

		.occasional {
			margin-bottom: 2em;
		}

		.occasional h5 {
			font-size: 1.3em;
			font-weight: 600;
			color: #333;
			margin-bottom: 0.8em;
		}

		.occasional h5 span {
			color: #e74c3c;
			font-size: 1.5em;
			font-weight: 800;
		}

		.occasional h5:last-child span {
			color: #27ae60;
		}

		.stock-info {
			display: inline-block;
			padding: 4px 12px;
			background: rgba(39, 174, 96, 0.1);
			border-radius: 4px;
			font-size: 0.9em;
		}

		.color-quality {
			margin-top: 30px;
			text-align: right;
		}

		.color-quality a {
			display: inline-block;
			background: linear-gradient(135deg, #ff98cc, #ff98cc);
			color: white;
			padding: 16px 40px;
			border-radius: 12px;
			font-size: 18px;
			font-weight: 600;
			text-decoration: none;
			transition: all 0.3s ease;
			box-shadow: 0 4px 15px rgba(255, 105, 180, 0.3);
		}

		.color-quality a:hover {
			transform: translateY(-2px);
			box-shadow: 0 8px 25px rgba(255, 105, 180, 0.4);
			color: white;
			text-decoration: none;
		}

		.single-grid1 {
			padding-left: 2em;
			position: sticky;
			top: 120px;
		}

		.single-grid1 ul {
			list-style: none;
			padding: 0;
			margin: 0;
		}

		.single-grid1 ul li {
			margin-bottom: 12px;
		}

		.single-grid1 ul li a {
			display: block;
			padding: 12px 20px;
			color: #495057;
			text-decoration: none;
			border-radius: 8px;
			transition: all 0.3s ease;
			font-size: 16px;
		}

		.single-grid1 ul li a:hover {
			background: #ff98cc;
			color: white;
			transform: translateX(5px);
		}

		.tag {
			margin-bottom: 20px;
		}

		.tag p {
			margin: 0;
			color: #6c757d;
			font-size: 16px;
		}

		.tag a {
			color: #ff98cc;
			text-decoration: none;
			font-weight: 600;
		}

		.tag a:hover {
			text-decoration: underline;
		}


		/* FlexSlider 样式优化 - 与花店Web保持一致 */
		.flexslider {
			border: none;
			box-shadow: 0 5px 20px rgba(0,0,0,0.1);
			border-radius: 10px;
			overflow: hidden;
			margin: 0;
			background: transparent;
			position: relative;
			width: 100%;
		}

		.flex-viewport {
			height: auto !important;
			border: none !important;
			width: 100% !important;
			overflow: hidden !important;
			position: relative;
		}

		.flexslider .slides {
			width: 100% !important;
			height: auto !important;
			margin: 0;
			padding: 0;
			list-style: none;
			position: relative;
		}

		/* FlexSlider 单图显示样式 */
		.flexslider .slides {
			position: relative;
			width: 100%;
			height: auto;
			min-height: 300px;
			overflow: hidden;
		}
		
		.flexslider .slides li {
			width: 100% !important;
			margin: 0;
			padding: 0;
			display: block; /* 所有图片都显示，但通过opacity控制可见性 */
			position: absolute;
			top: 0;
			left: 0;
			opacity: 0;
			transition: opacity 0.3s ease;
		}
		
		/* 确保第一张图片默认显示 */
		.flexslider .slides > li:first-child {
			opacity: 1;
			z-index: 10;
		}

		.flexslider .slides img {
			border-radius: 10px;
			border: none !important;
			box-shadow: none !important;
			width: 100% !important;
			height: auto !important;
			display: block !important;
			max-width: 100%;
		}

		.thumb-image {
			width: 100%;
			display: block;
		}

		.thumb-image img {
			width: 100% !important;
			height: auto !important;
			display: block !important;
			max-width: 100%;
		}


		/* 缩略图导航样式 */
		.flex-control-nav.flex-control-thumbs {
			display: flex;
			justify-content: center;
			gap: 10px;
			margin-top: 20px;
			padding: 0;
			list-style: none;
		}

		.flex-control-nav.flex-control-thumbs li {
			width: 80px;
			height: 80px;
			margin: 0;
			padding: 0;
			cursor: pointer;
			opacity: 0.6;
			transition: all 0.3s ease;
			border-radius: 8px;
			overflow: hidden;
			border: 2px solid transparent;
		}

		.flex-control-nav.flex-control-thumbs li:hover {
			opacity: 1;
			border-color: #ff98cc;
		}

		.flex-control-nav.flex-control-thumbs li.flex-active,
		.flex-control-nav.flex-control-thumbs li img.flex-active {
			opacity: 1;
		}

		.flex-control-nav.flex-control-thumbs li.flex-active {
			border-color: #ff98cc;
			box-shadow: 0 0 10px rgba(255, 152, 204, 0.5);
		}

		.flex-control-nav.flex-control-thumbs li img {
			width: 100%;
			height: 100%;
			object-fit: cover;
			display: block;
		}

		/* 方向导航按钮样式 */
		.flex-direction-nav {
			list-style: none;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			pointer-events: none;
			z-index: 20;
		}
		
		.flex-direction-nav li {
			position: absolute;
			top: 50%;
			transform: translateY(-50%);
			pointer-events: auto;
			margin: 0;
			padding: 0;
		}
		
		.flex-direction-nav li:first-child {
			left: 10px !important;
			right: auto !important;
		}

		.flex-direction-nav li:last-child {
			right: 10px !important;
			left: auto !important;
		}
		
		.flex-direction-nav a {
			width: 40px;
			height: 40px;
			line-height: 40px;
			text-align: center;
			background: rgba(255, 255, 255, 0.9);
			border-radius: 50%;
			color: #ff98cc;
			font-size: 20px;
			opacity: 0.8;
			transition: all 0.3s ease;
			display: block;
			text-decoration: none;
			box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
		}

		.flex-direction-nav a:hover {
			opacity: 1;
			background: #ff98cc;
			color: white;
			box-shadow: 0 4px 12px rgba(255, 152, 204, 0.4);
		}

		@media (max-width: 992px) {
			.single-grids {
				flex-direction: column;
			}

			.product-detail-container {
				flex: 1 1 100%;
				max-width: 100%;
				flex-direction: column;
			}

			.single-left,
			.single-right {
				flex: 1 1 100%;
				max-width: 100%;
			}

			.single-left {
				padding-left: 0;
			}

			.single-right {
				padding-left: 0;
				margin-top: 2em;
			}

			.single-grid1 {
				flex: 1 1 100%;
				max-width: 100%;
				padding-left: 0;
				margin-top: 2em;
			}

			.flex-control-nav.flex-control-thumbs li {
				width: 60px;
				height: 60px;
			}
		}
	</style>
	<script>
		$(document).ready(function() {
			// 初始化图片切换功能
			initImageSlider();
			
			function initImageSlider() {
				var $slides = $('.flexslider .slides li');
				var $thumbs = $('.flex-control-nav.flex-control-thumbs li');
				var currentIndex = 0;
				var totalSlides = $slides.length;
				var autoSlideTimer = null;
				
				if (totalSlides === 0) return;
				
				// 确保slides容器有固定高度（使用第一张图片的高度）
				var $firstSlide = $slides.eq(0);
				var containerHeight = $firstSlide.outerHeight();
				$('.flexslider .slides').css('height', containerHeight + 'px');
				
				// 强制初始化：所有图片都使用绝对定位叠加
				$slides.each(function(index) {
					var $slide = $(this);
					// 先移除所有内联样式
					$slide.removeAttr('style');
					
					// 所有图片都使用绝对定位，叠加在同一位置
					$slide.css({
						'display': 'block',
						'position': 'absolute',
						'top': '0',
						'left': '0',
						'width': '100%',
						'z-index': index === 0 ? '10' : '1',
						'opacity': index === 0 ? '1' : '0'
					});
				});
				
				// 初始化缩略图状态
				$thumbs.removeClass('flex-active');
				$thumbs.find('img').removeClass('flex-active');
				$thumbs.eq(0).addClass('flex-active');
				$thumbs.eq(0).find('img').addClass('flex-active');
				
				// 切换到指定索引的函数
				function switchToSlide(index, resetTimer) {
					if (index < 0 || index >= totalSlides) return;
					if (index === currentIndex && resetTimer !== false) return; // 如果已经是当前图片，不切换（除非是自动切换）
					
					var $currentSlide = $slides.eq(currentIndex);
					var $nextSlide = $slides.eq(index);
					
					// 确保下一张图片已经在正确位置（绝对定位叠加）
					$nextSlide.css({
						'display': 'block',
						'position': 'absolute',
						'top': '0',
						'left': '0',
						'width': '100%',
						'z-index': '10',
						'opacity': '0'
					});
					
					// 淡出当前图片
					$currentSlide.stop(true, true).animate({
						'opacity': '0'
					}, 300, function() {
						// 淡出完成后，降低z-index
						$(this).css({
							'z-index': '1',
							'opacity': '0'
						});
					});
					
					// 同时淡入下一张图片
					$nextSlide.stop(true, true).animate({
						'opacity': '1'
					}, 300);
					
					currentIndex = index;
					
					// 更新缩略图活动状态
					$thumbs.removeClass('flex-active');
					$thumbs.find('img').removeClass('flex-active');
					$thumbs.eq(currentIndex).addClass('flex-active');
					$thumbs.eq(currentIndex).find('img').addClass('flex-active');
					
					// 如果resetTimer为true或undefined，重置自动切换定时器
					if (resetTimer !== false) {
						startAutoSlide();
					}
				}
				
				// 启动自动切换
				function startAutoSlide() {
					// 清除现有定时器
					if (autoSlideTimer) {
						clearInterval(autoSlideTimer);
					}
					
					// 如果只有一张图片，不需要自动切换
					if (totalSlides <= 1) return;
					
					// 每3秒自动切换到下一张
					autoSlideTimer = setInterval(function() {
						var nextIndex = (currentIndex + 1) % totalSlides;
						switchToSlide(nextIndex, false); // false表示不重置定时器
					}, 3000);
				}
				
				// 停止自动切换
				function stopAutoSlide() {
					if (autoSlideTimer) {
						clearInterval(autoSlideTimer);
						autoSlideTimer = null;
					}
				}
				
				// 缩略图点击事件
				$thumbs.on('click', function(e) {
					e.preventDefault();
					e.stopPropagation();
					
					var $clickedThumb = $(this);
					var index = $clickedThumb.index();
					
					// 切换到选中的图片（会自动重置定时器）
					switchToSlide(index);
				});
				
				// 创建左右箭头导航（如果不存在）
				var $flexslider = $('.flexslider');
				if ($flexslider.find('.flex-direction-nav').length === 0) {
					var $directionNav = $('<ul class="flex-direction-nav"><li><a class="flex-prev" href="#"><i class="fas fa-chevron-left"></i></a></li><li><a class="flex-next" href="#"><i class="fas fa-chevron-right"></i></a></li></ul>');
					$flexslider.append($directionNav);
				}
				
				// 手动左右箭头导航
				$flexslider.on('click', '.flex-direction-nav .flex-prev', function(e) {
					e.preventDefault();
					var prevIndex = (currentIndex - 1 + totalSlides) % totalSlides;
					switchToSlide(prevIndex); // 会自动重置定时器
				});
				
				$flexslider.on('click', '.flex-direction-nav .flex-next', function(e) {
					e.preventDefault();
					var nextIndex = (currentIndex + 1) % totalSlides;
					switchToSlide(nextIndex); // 会自动重置定时器
				});
				
				// 鼠标悬停时暂停自动切换，离开时恢复
				$flexslider.on('mouseenter', function() {
					stopAutoSlide();
				}).on('mouseleave', function() {
					startAutoSlide();
				});
				
				// 图片加载完成后，重新计算容器高度
				$slides.find('img').on('load', function() {
					var maxHeight = 0;
					$slides.each(function() {
						var height = $(this).outerHeight();
						if (height > maxHeight) {
							maxHeight = height;
						}
					});
					if (maxHeight > 0) {
						$('.flexslider .slides').css('height', maxHeight + 'px');
					}
				});
				
				// 如果图片已经加载完成，立即计算高度
				setTimeout(function() {
					var maxHeight = 0;
					$slides.each(function() {
						var height = $(this).outerHeight();
						if (height > maxHeight) {
							maxHeight = height;
						}
					});
					if (maxHeight > 0) {
						$('.flexslider .slides').css('height', maxHeight + 'px');
					}
					// 启动自动切换
					startAutoSlide();
				}, 100);
			}
		});
	</script>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!--//header-->

<!--//single-page-->
<div class="single main-content">
	<div class="container">
		<div class="single-grids">
			<!-- 左侧商品详细信息区域 - 80% -->
			<div class="product-detail-container">
			<div class="single-left">
				<div class="flexslider">
					<ul class="slides">
						<c:set var="coverPath" value="${fn:startsWith(g.cover, '/') ? g.cover : pageContext.request.contextPath.concat(g.cover)}" />
						<li data-thumb="${coverPath}">
							<div class="thumb-image"> <img src="${pageContext.request.contextPath}${coverPath}" data-imagezoom="true" class="img-responsive" alt="${g.name}"> </div>
						</li>
						<c:if test="${not empty g.image1}">
							<c:set var="image1Path" value="${fn:startsWith(g.image1, '/') ? g.image1 : pageContext.request.contextPath.concat(g.image1)}" />
							<li data-thumb="${image1Path}">
								<div class="thumb-image"> <img src="${pageContext.request.contextPath}${image1Path}" data-imagezoom="true" class="img-responsive" alt="${g.name}"> </div>
							</li>
						</c:if>
						<c:if test="${not empty g.image2}">
							<c:set var="image2Path" value="${fn:startsWith(g.image2, '/') ? g.image2 : pageContext.request.contextPath.concat(g.image2)}" />
							<li data-thumb="${image2Path}">
								<div class="thumb-image"> <img src="${pageContext.request.contextPath}${image2Path}" data-imagezoom="true" class="img-responsive" alt="${g.name}"> </div>
							</li>
						</c:if>
					</ul>
				</div>
				<ol class="flex-control-nav flex-control-thumbs">
					<li><img src="${pageContext.request.contextPath}${coverPath}" draggable="false" class="flex-active"></li>
					<c:if test="${not empty g.image1}">
						<li><img src="${pageContext.request.contextPath}${image1Path}" draggable="false"></li>
					</c:if>
					<c:if test="${not empty g.image2}">
						<li><img src="${pageContext.request.contextPath}${image2Path}" draggable="false"></li>
					</c:if>
				</ol>
			</div>
				<div class="single-right simpleCart_shelfItem">
					<div style="margin-bottom: 15px; text-align: right;">
						<a href="javascript:history.back()" style="color: #ff98cc; text-decoration: none;">
							<i class="fas fa-arrow-left"></i> 返回
						</a>
					</div>
					<h3>${g.name}</h3>
					<div class="tag">
						<p>分类 : <a href="${pageContext.request.contextPath}/flowers_list?typeid=${g.type.id}">${g.type.name}</a></p>
					</div>
					<div class="description">
						<h5>商品描述</h5>
						<p>${g.intro}</p>
					</div>
					<div class="occasional">
						<h5>价格：<span>¥ ${g.price}</span></h5>
						<h5>库存：<span id="goods-stock" class="stock-info">${g.stock}</span> 件</h5>
					</div>
					<div class="color-quality">
						<a href="javascript:;" class="add-cart item_add" onclick="buy(${g.id})">
							<i class="fas fa-shopping-cart"></i> 加入购物车
						</a>
					</div>
				</div>
			</div>
			<!-- 右侧商品分类选择区域 - 20% -->
			<div class="single-grid1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/flowers_list">全部系列</a></li>
					<c:forEach items="${typeList}" var="t">
						<li><a href="${pageContext.request.contextPath}/flowers_list?typeid=${t.id}">${t.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>

<!--footer-->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!--//footer-->
</body>
</html>