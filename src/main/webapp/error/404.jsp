<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title" value="页面未找到" />
<jsp:include page="/common/header.jsp">
    <jsp:param name="title" value="${title}" />
</jsp:include>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
            <div class="error-container">
                <h1 class="display-1 text-muted mb-4">404</h1>
                <h2 class="h3 mb-3">页面未找到</h2>
                <p class="text-muted mb-4">
                    抱歉，您访问的页面不存在或已被移动。
                </p>
                <div class="d-flex justify-content-center gap-3">
                    <a href="${ctx}/" class="btn btn-primary">
                        <i class="bi bi-house-door me-2"></i>返回首页
                    </a>
                    <a href="javascript:history.back()" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-2"></i>返回上一页
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/common/footer.jsp" />