package com.blog.controller;

import com.blog.dao.UserDao;
import com.blog.model.User;
import com.blog.util.MD5Util;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 显示注册页面
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置字符编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取表单参数
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // 验证参数
        if (username == null || username.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "请填写完整的注册信息！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 验证密码长度
        if (password.length() < 6) {
            request.setAttribute("error", "密码长度至少6位！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 验证两次密码是否一致
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "两次输入的密码不一致！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 验证用户名长度
        if (username.length() < 3 || username.length() > 50) {
            request.setAttribute("error", "用户名长度应在3-50个字符之间！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        try {
            // 检查用户名是否已存在
            if (userDao.isUsernameExists(username)) {
                request.setAttribute("error", "用户名已存在，请换一个用户名！");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }

            // 检查邮箱是否已存在
            if (userDao.isEmailExists(email)) {
                request.setAttribute("error", "邮箱已被注册，请使用其他邮箱！");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }

            // 创建用户对象
            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(MD5Util.md5(password)); // 密码加密

            // 保存用户到数据库
            int userId = userDao.addUser(user);

            if (userId > 0) {
                // 注册成功，重定向到登录页面
                response.sendRedirect(request.getContextPath() + "/login?register=success");
            } else {
                // 注册失败，返回注册页面
                request.setAttribute("error", "注册失败，请稍后重试！");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "系统错误，请稍后重试！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}