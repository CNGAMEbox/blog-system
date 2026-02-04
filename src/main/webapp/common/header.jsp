<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx", contextPath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - 博客系统</title>

    <%-- 本地 Bootstrap CSS --%>
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <%-- Bootstrap Icons --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        :root {
            --primary-color: #1890ff;
            --secondary-color: #666;
            --bg-color: #f8f9fa;
            --border-color: #eaeaea;
            --card-bg: #fff;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: var(--bg-color);
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* ===== 顶部导航栏 ===== */
        .site-header {
            background-color: var(--card-bg);
            border-bottom: 1px solid var(--border-color);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            height: 64px;
        }

        /* LOGO 区域 (左) */
        .header-brand .brand-logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-color);
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .brand-logo i {
            margin-right: 8px;
        }

        /* 主导航菜单 (中) */
        .header-nav {
            display: flex;
            justify-content: center;
            flex: 1;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            gap: 2px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 8px 20px;
            text-decoration: none;
            color: var(--secondary-color);
            font-weight: 500;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .nav-link i {
            margin-right: 6px;
        }

        .nav-link:hover,
        .nav-link.active {
            background-color: #f0f7ff;
            color: var(--primary-color);
        }

        /* 用户操作区 (右) */
        .header-actions {
            display: flex;
            gap: 12px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-login {
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            background: transparent;
        }

        .btn-register {
            color: white;
            background-color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }

        .btn-register:hover {
            background-color: #0d7bff;
        }

        /* ===== 主布局容器 ===== */
        .main-layout {
            display: flex;
            min-height: calc(100vh - 64px);
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            gap: 30px;
        }

        /* ===== 侧边栏样式 ===== */
        .sidebar {
            flex: 0 0 260px;
        }

        .sidebar-card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
        }

        .sidebar-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0 0 20px 0;
            color: #333;
            display: flex;
            align-items: center;
        }

        .sidebar-nav {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            color: #555;
            text-decoration: none;
            border-radius: 10px;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        .sidebar-nav a:hover,
        .sidebar-nav a.active {
            background: #f0f7ff;
            color: var(--primary-color);
        }

        .sidebar-nav a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        /* ===== 主内容区样式 ===== */
        .main-content-area {
            flex: 1;
        }

        .welcome-card {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border-radius: 16px;
            padding: 40px;
            margin-bottom: 30px;
        }

        .feature-card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 28px;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .feature-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        /* 响应式 */
        @media (max-width: 992px) {
            .main-layout {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .header-container {
                padding: 0 15px;
            }
            .nav-link span,
            .action-btn span {
                display: none;
            }
            .nav-link i,
            .action-btn i {
                margin-right: 0;
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
<%-- 仅包含顶部导航栏 --%>
<header class="site-header">
    <div class="header-container">
        <div class="header-brand">
            <a href="${ctx}/" class="brand-logo">
                <i class="bi bi-journal-text"></i>
                <span>博客系统</span>
            </a>
        </div>

        <nav class="header-nav">
            <ul class="nav-menu">
                <li><a href="${ctx}/" class="nav-link ${param.active == 'home' ? 'active' : ''}">
                    <i class="bi bi-house-door"></i><span>首页</span>
                </a></li>
                <li><a href="${ctx}/article/list" class="nav-link ${param.active == 'articles' ? 'active' : ''}">
                    <i class="bi bi-journal-text"></i><span>文章</span>
                </a></li>
                <li><a href="${ctx}/categories" class="nav-link ${param.active == 'categories' ? 'active' : ''}">
                    <i class="bi bi-tags"></i><span>分类</span>
                </a></li>
                <li><a href="${ctx}/about" class="nav-link ${param.active == 'about' ? 'active' : ''}">
                    <i class="bi bi-info-circle"></i><span>关于</span>
                </a></li>
            </ul>
        </nav>

        <div class="header-actions">
            <a href="${ctx}/login" class="action-btn btn-login">
                <i class="bi bi-box-arrow-in-right"></i><span>登录</span>
            </a>
            <a href="${ctx}/register" class="action-btn btn-register">
                <i class="bi bi-person-plus"></i><span>注册</span>
            </a>
        </div>
    </div>
</header>

<%-- 注意：这里没有关闭body和html标签 --%>
<%-- 主布局由各个具体页面自己控制 --%>