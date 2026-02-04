<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title" value="首页" />
<%-- 包含头部，只包含导航和样式 --%>
<jsp:include page="/common/header.jsp">
    <jsp:param name="title" value="${title}" />
    <jsp:param name="active" value="home" />
</jsp:include>

<%-- 页面自己的布局开始 --%>
<div class="main-layout">
    <%-- 左侧边栏 --%>
    <aside class="sidebar">
        <jsp:include page="/common/sidebar.jsp">
            <jsp:param name="active" value="home" />
        </jsp:include>
    </aside>

    <%-- 右侧主内容区 --%>
    <div class="main-content-area">
        <%-- 欢迎卡片 --%>
        <div class="welcome-card">
            <h1 style="margin-top: 0; font-size: 2.5rem;">欢迎来到博客系统</h1>
            <p style="font-size: 1.2rem; opacity: 0.95; margin-bottom: 25px;">
                一个简洁高效的创作空间，分享你的技术见解与生活思考。
            </p>
            <div style="display: flex; gap: 15px;">
                <a href="${ctx}/register" class="action-btn"
                   style="background: white; color: #6a11cb; border: none; font-weight: 600;">
                    <i class="bi bi-rocket-takeoff me-2"></i>开始创作
                </a>
                <a href="${ctx}/login" class="action-btn"
                   style="background: transparent; color: white; border: 1px solid white;">
                    <i class="bi bi-box-arrow-in-right me-2"></i>登录账户
                </a>
            </div>
        </div>

        <%-- 核心功能卡片网格 --%>
        <h3 style="font-size: 1.5rem; font-weight: 600; margin: 40px 0 20px;">
            <i class="bi bi-grid-3x3-gap me-2"></i>核心功能
        </h3>

        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 25px; margin-bottom: 40px;">
            <a href="${ctx}/article/list" class="feature-card">
                <div style="width: 60px; height: 60px; background: #e6f7ff; color: #1890ff;
                     border-radius: 14px; display: flex; align-items: center; justify-content: center;
                     margin-bottom: 22px; font-size: 1.8rem;">
                    <i class="bi bi-pencil-square"></i>
                </div>
                <h3 style="font-size: 1.4rem; margin-bottom: 12px;">文章管理</h3>
                <p style="color: #666; line-height: 1.6;">创建、编辑、发布博客文章，支持分类管理。</p>
            </a>

            <a href="${ctx}/register" class="feature-card">
                <div style="width: 60px; height: 60px; background: #f6ffed; color: #52c41a;
                     border-radius: 14px; display: flex; align-items: center; justify-content: center;
                     margin-bottom: 22px; font-size: 1.8rem;">
                    <i class="bi bi-person-circle"></i>
                </div>
                <h3 style="font-size: 1.4rem; margin-bottom: 12px;">用户中心</h3>
                <p style="color: #666; line-height: 1.6;">安全的注册登录，管理个人信息和文章。</p>
            </a>

            <a href="#" class="feature-card">
                <div style="width: 60px; height: 60px; background: #fff7e6; color: #fa8c16;
                     border-radius: 14px; display: flex; align-items: center; justify-content: center;
                     margin-bottom: 22px; font-size: 1.8rem;">
                    <i class="bi bi-tags"></i>
                </div>
                <h3 style="font-size: 1.4rem; margin-bottom: 12px;">分类标签</h3>
                <p style="color: #666; line-height: 1.6;">为文章添加分类与标签，结构化知识体系。</p>
            </a>
        </div>
    </div>
</div>
<%-- 页面自己的布局结束 --%>

<%-- 包含脚部，包含脚本和关闭标签 --%>
<jsp:include page="/common/footer.jsp" />
