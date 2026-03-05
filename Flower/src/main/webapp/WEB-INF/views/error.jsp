<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>错误页面</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<div class="container">
  <h1>系统错误</h1>
  <p>错误信息：${error}</p>
  <a href="${pageContext.request.contextPath}/" class="btn btn-primary">返回首页</a>
</div>
</body>
</html>