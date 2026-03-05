<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Website Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        /* 搜索框样式 - 优化顶部搜索框 */
        .search-box {
            display: flex;
            align-items: center;
            position: relative;
            z-index: 10;
            padding: 12px 0 12px 20px;
            margin-left: 0;
        }

        .search-box form {
            display: flex;
            align-items: center;
            background: rgba(255,255,255,0.15);
            border-radius: 25px;
            padding: 6px 12px;
            border: 1px solid rgba(255,255,255,0.3);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .search-box form:hover {
            background: rgba(255,255,255,0.2);
            border-color: rgba(255,255,255,0.4);
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15);
        }

        .search-box input[type="text"] {
            border: none;
            background: transparent;
            padding: 8px 12px;
            color: #fff;
            font-size: 14px;
            outline: none;
            width: 200px;
            min-width: 150px;
            transition: width 0.3s ease;
        }

        .search-box input[type="text"]:focus {
            width: 250px;
        }

        .search-box input[type="text"]::placeholder {
            color: rgba(255,255,255,0.7);
        }

        .search-box button {
            border: none;
            background: linear-gradient(135deg, #ff98cc 0%, #FFC0CB 100%);
            color: #fff;
            padding: 8px 14px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-left: 8px;
            font-size: 1.1em;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(255, 105, 180, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-box button:hover {
            background: linear-gradient(135deg, #ff98cc 0%, #ff98cc 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 105, 180, 0.4);
        }

        .search-box button i {
            font-size: 14px;
        }

        /* 头部底部搜索框样式 */
        .header-bottom {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px 20px;
            margin-top: 10px;
        }

        .header-bottom .search {
            max-width: 600px;
            width: 100%;
        }

        .header-bottom .search form {
            display: flex;
            align-items: center;
            background: rgba(255,255,255,0.1);
            border-radius: 30px;
            padding: 3px;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .header-bottom .search input[type="text"] {
            flex: 1;
            border: none;
            background: transparent;
            padding: 12px 20px;
            color: #fff;
            font-size: 15px;
            outline: none;
            border-radius: 25px 0 0 25px;
            min-width: 0;
        }

        .header-bottom .search input[type="text"]::placeholder {
            color: rgba(255,255,255,0.7);
        }

        .header-bottom .search input[type="submit"] {
            background: #ff98cc;
            border: none;
            color: #fff;
            padding: 12px 25px;
            border-radius: 0 25px 25px 0;
            cursor: pointer;
            font-size: 15px;
            transition: background-color 0.3s ease;
            position: relative;
            font-weight: 500;
        }

        .header-bottom .search input[type="submit"]:hover {
            background-color: #ff98cc;
        }

        .header-bottom .search input[type="submit"]::before {
            content: "\e003";
            font-family: 'Glyphicons Halflings';
            font-size: 14px;
            color: #fff;
        }

        @media (max-width: 768px) {
            .search-box {
                margin-left: 10px;
                padding: 3px 0;
            }

            .search-box form {
                padding: 5px 10px;
            }

            .search-box input[type="text"] {
                width: 120px;
                min-width: 100px;
                padding: 6px 10px;
                font-size: 13px;
            }

            .search-box input[type="text"]:focus {
                width: 150px;
            }

            .search-box button {
                padding: 6px 12px;
                margin-left: 5px;
            }

            .header-bottom {
                padding: 10px 15px;
            }
            
            .header-bottom .search {
                max-width: 100%;
            }
        }
    </style>
    <script>
        $(document).ready(function() {
            // 确保Bootstrap下拉菜单初始化
            $('.dropdown-toggle').dropdown();

            // 简化滚动逻辑
            $(window).scroll(function() {
                $('.header').toggleClass('header-fixed', $(this).scrollTop() > 100);
            });

            // 鼠标进入页面顶部时显示头部
            $(document).on('mouseenter', '.header, .dropdown-menu', function() {
                if ($(window).scrollTop() <= 100) {
                    $('.header').addClass('header-show');
                }
            });

            // 鼠标离开页面顶部时隐藏头部
            $(document).on('mouseleave', '.header', function(e) {
                // 只有当鼠标离开到非下拉菜单区域且不在搜索框内时才隐藏
                var relatedTarget = e.relatedTarget;
                if (relatedTarget && (
                    $(relatedTarget).closest('.dropdown-menu').length ||
                    $(relatedTarget).closest('.search-box').length ||
                    $(relatedTarget).closest('.header-bottom').length ||
                    $(relatedTarget).closest('.search').length
                )) {
                    return; // 不隐藏
                }
                $('.header').removeClass('header-show');
            });

            // 搜索框相关元素交互时保持头部显示
            var searchFocused = false;
            
            $(document).on('focus', '.search-box input[type="text"], .header-bottom .search input[type="text"]', function() {
                searchFocused = true;
                $('.header').addClass('header-show');
            });

            $(document).on('click', '.search-box, .search-box form, .search-box button, .header-bottom .search, .header-bottom .search form, .header-bottom .search input[type="submit"]', function() {
                searchFocused = true;
                $('.header').addClass('header-show');
            });

            // 搜索框失去焦点时延迟隐藏
            $(document).on('blur', '.search-box input[type="text"], .header-bottom .search input[type="text"]', function(e) {
                searchFocused = false;
                // 延迟隐藏，以便点击提交按钮时不会立即隐藏
                setTimeout(function() {
                    if (!searchFocused && $(window).scrollTop() <= 100) {
                        // 检查鼠标是否在头部区域
                        var mouseInHeader = $(document.elementFromPoint(e.clientX || 0, e.clientY || 0)).closest('.header').length > 0;
                        if (!mouseInHeader) {
                            $('.header').removeClass('header-show');
                        }
                    }
                }, 300);
            });

            // 鼠标在搜索框区域内时保持显示
            $(document).on('mouseenter', '.search-box, .header-bottom .search', function() {
                if ($(window).scrollTop() <= 100) {
                    $('.header').addClass('header-show');
                }
            });
        });
    </script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1 class="navbar-brand"><a href="${pageContext.request.contextPath}/index"></a></h1>
            </div>
            <!--navbar-header-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/index" <c:if test="${param.flag==1}">class="active"</c:if>>首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle <c:if test="${param.flag==2}">active</c:if>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商品分类<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-2">
                            <li>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4>商品分类</h4>
                                        <ul class="multi-column-dropdown">
                                            <li><a class="list" href="${pageContext.request.contextPath}/flowers_list">全部系列</a></li>
                                            <c:forEach items="${typeList}" var="t">
                                                <li><a class="list" href="${pageContext.request.contextPath}/flowers_list?typeid=${t.id}">${t.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/flowersrecommend_list?type=2" <c:if test="${param.flag==3 && t==2}">class="active"</c:if>>热销</a></li>
                    <li><a href="${pageContext.request.contextPath}/flowersrecommend_list?type=3" <c:if test="${param.flag==3 && t==3}">class="active"</c:if>>新品</a></li>

                    <c:choose>
                        <c:when test="${empty user}">
                            <li><a href="${pageContext.request.contextPath}/user_register" <c:if test="${param.flag==10}">class="active"</c:if>>注册</a></li>
                            <li><a href="${pageContext.request.contextPath}/user_login" <c:if test="${param.flag==9}">class="active"</c:if>>登录</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pageContext.request.contextPath}/order_list" <c:if test="${param.flag==5}">class="active"</c:if>>我的订单</a></li>
                            <li><a href="${pageContext.request.contextPath}/user_center" <c:if test="${param.flag==4}">class="active"</c:if>>个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/user_logout">退出</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${!empty user && user.isadmin}">
                        <li><a href="${pageContext.request.contextPath}/admin/index" target="_blank">后台管理</a></li>
                    </c:if>
                </ul>
                <!--/.navbar-collapse-->
            </div>
            <!--//navbar-header-->
        </nav>
        <div class="header-info">
            <div class="header-right cart">
                <a href="${pageContext.request.contextPath}/flowers_cart">
                    <span class="glyphicon glyphicon-shopping-cart <c:if test="${param.flag==7}">active</c:if>" aria-hidden="true"><span class="card_num"><c:choose><c:when test="${empty order}">0</c:when><c:otherwise>${order.amount}</c:otherwise></c:choose></span></span>
                </a>
            </div>
            <div class="header-right search-box" id="header-search">
                <form action="${pageContext.request.contextPath}/flowers_search" method="get">
                    <input type="text" name="keyword" placeholder="搜索商品...">
                    <button type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="header-bottom">
            <div class="search">
                <form action="${pageContext.request.contextPath}/flowers_search" method="get">
                    <input type="text" name="keyword" placeholder="搜索商品...">
                    <input type="submit" value="">
                </form>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!--//header-->
<!-- 其他内容 -->
</body>
</html>