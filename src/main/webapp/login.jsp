<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập - Hệ thống quản lý thư viện</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background: #fff;
      color: #000;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .header {
      background: #000000;
      color: #ffffff;
      padding: 1rem 2rem;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
    }

    .header-content {
      display: flex;
      justify-content: center;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
    }

    .logo {
      font-size: 1.5rem;
      font-weight: bold;
    }

    .login-wrapper {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem 1rem;
    }

    .login-container {
      border: 1px solid #000;
      padding: 2rem;
      width: 320px;
      border-radius: 6px;
      background: #fff;
    }

    .login-header {
      text-align: center;
      margin-bottom: 1.5rem;
    }

    .login-header h1 {
      font-size: 1.5rem;
      margin-bottom: 0.5rem;
    }

    .form-group {
      margin-bottom: 1rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: bold;
    }

    input {
      width: 100%;
      padding: 0.6rem;
      border: 1px solid #000;
      border-radius: 4px;
      background: #fff;
      color: #000;
      font-size: 1rem;
    }

    input:focus {
      outline: none;
      border-color: #555;
    }

    .login-btn {
      width: 100%;
      padding: 0.6rem;
      background: #000;
      color: #fff;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
    }

    .login-btn:hover {
      background: #333;
    }

    .error-message {
      background: #f8f8f8;
      border: 1px solid #000;
      color: #000;
      padding: 0.5rem;
      border-radius: 4px;
      margin-bottom: 1rem;
      text-align: center;
      font-size: 0.9rem;
    }

    .footer {
      text-align: center;
      padding: 1rem;
      background: #f8f8f8;
      border-top: 1px solid #ccc;
      color: #333;
      font-size: 0.85rem;
    }
  </style>
</head>
<body>


<div class="header">
  <div class="header-content">
    <div class="logo">📚 Hệ thống thư viện</div>
  </div>
</div>

<div class="login-wrapper">
  <div class="login-container">
    <div class="login-header">
      <h1>Đăng nhập</h1>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <div class="error-message"><%= request.getAttribute("error") %></div>
    <% } %>

    <form method="post" action="login">
      <div class="form-group">
        <label for="username">Tên đăng nhập:</label>
        <input type="text" id="username" name="username" required>
      </div>

      <div class="form-group">
        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required>
      </div>

      <button type="submit" class="login-btn">Đăng nhập</button>
    </form>
  </div>
</div>

</body>
</html>
