<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title" value="用户注册"/>
<jsp:include page="/common/header.jsp">
    <jsp:param name="title" value="${title}"/>
    <jsp:param name="active" value="register"/>
</jsp:include>

<%-- 添加main-content容器 --%>
<div class="main-content">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="form-container">
                    <div class="text-center mb-4">
                        <h2 class="fw-bold">创建账户</h2>
                        <p class="text-muted">注册后即可开始创作你的博客</p>
                    </div>

                    <%-- 显示消息 --%>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty success}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle me-2"></i>${success}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form id="registerForm" action="${ctx}/register" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label fw-semibold">
                                <i class="bi bi-person me-1"></i>用户名
                            </label>
                            <input type="text" class="form-control form-control-lg"
                                   id="username" name="username"
                                   value="${param.username}"
                                   required minlength="3" maxlength="50"
                                   placeholder="请输入3-50个字符的用户名">
                            <div class="form-text">用户名将用于登录和显示，注册后不可更改</div>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">
                                <i class="bi bi-envelope me-1"></i>邮箱地址
                            </label>
                            <input type="email" class="form-control form-control-lg"
                                   id="email" name="email"
                                   value="${param.email}"
                                   required placeholder="请输入有效的邮箱地址">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label fw-semibold">
                                <i class="bi bi-lock me-1"></i>密码
                            </label>
                            <input type="password" class="form-control form-control-lg"
                                   id="password" name="password"
                                   required minlength="6" maxlength="20"
                                   placeholder="请输入6-20个字符的密码">
                        </div>

                        <div class="mb-4">
                            <label for="confirmPassword" class="form-label fw-semibold">
                                <i class="bi bi-lock-fill me-1"></i>确认密码
                            </label>
                            <input type="password" class="form-control form-control-lg"
                                   id="confirmPassword" name="confirmPassword"
                                   required placeholder="请再次输入密码">
                        </div>

                        <div class="d-grid mb-4">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-person-plus me-2"></i>注册账户
                            </button>
                        </div>

                        <div class="text-center">
                            <p class="text-muted mb-0">
                                已有账户？
                                <a href="${ctx}/login" class="text-primary text-decoration-none fw-semibold">
                                    立即登录
                                </a>
                            </p>
                        </div>
                    </form>
                </div>

                <div class="text-center mt-4">
                    <p class="text-muted">
                        注册即表示你同意我们的
                        <a href="#" class="text-decoration-none">服务条款</a>和
                        <a href="#" class="text-decoration-none">隐私政策</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>><%-- 关闭main-content容器 --%>

<jsp:include page="/common/footer.jsp"/>