<%-- 本地 Bootstrap JS --%>
<script src="${ctx}/static/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 简单的表单验证
        const registerForm = document.getElementById('registerForm');
        if (registerForm) {
            registerForm.addEventListener('submit', function(e) {
                const password = document.getElementById('password');
                const confirmPassword = document.getElementById('confirmPassword');

                if (password && confirmPassword && password.value !== confirmPassword.value) {
                    e.preventDefault();
                    alert('两次输入的密码不一致！');
                    confirmPassword.focus();
                }
            });
        }
    });
</script>
</body>
</html>