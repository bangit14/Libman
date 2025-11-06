<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Trang quản lý chính - Hệ thống quản lý thư viện</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: #ffffff;
      color: #000000;
      line-height: 1.6;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    /* ===== HEADER ===== */
    .header {
      background: #000000;
      color: #ffffff;
      padding: 1rem 2rem;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
    }

    .header-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1000px;
      margin: 0 auto;
    }

    .logo {
      font-size: 1.5rem;
      font-weight: bold;
    }

    .user-info {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .logout-btn {
      background: #000;
      color: #fff;
      border: 1px solid #fff;
      padding: 0.5rem 1rem;
      border-radius: 20px;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .logout-btn:hover {
      background: #fff;
      color: #000;
    }

    /* ===== MAIN CONTAINER ===== */
    .container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 2rem;
    }

    .main-menu {
      background: #fff;
      border: 2px solid #000;
      padding: 2rem 3rem;
      border-radius: 10px;
      width: 320px;
      text-align: center;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }

    .page-title {
      font-size: 1.8rem;
      font-weight: bold;
      margin-bottom: 2rem;
    }

    .menu-item {
      margin-bottom: 1rem;
    }

    .menu-item:last-child {
      margin-bottom: 0;
    }

    .menu-btn {
      background: #000000;
      color: #ffffff;
      border: 2px solid #000000;
      padding: 1rem 2rem;
      font-size: 1.1rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      text-decoration: none;
      display: block;
      text-align: center;
      width: 100%;
      border-radius: 5px;
    }

    .menu-btn:hover {
      background: #ffffff;
      color: #000000;
    }

    /* ===== FOOTER ===== */
    .footer {
      background: #f8f8f8;
      border-top: 1px solid #ccc;
      padding: 1rem;
      text-align: center;
      color: #666;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="header-content">
    <div class="logo">📚 Thư viện Librian</div>
    <div class="user-info">
      <span>Xin chào, <%= session.getAttribute("username") %></span>
      <a href="logout" class="logout-btn">Đăng xuất</a>
    </div>
  </div>
</div>

<div class="container">
  <div class="main-menu">
    <h1 class="page-title">Trang quản lý chính</h1>

    <div class="menu-item">
      <a href="SearchDocument.jsp" class="menu-btn">Tìm kiếm tài liệu</a>
    </div>
    <div class="menu-item">
      <a href="Statistics.jsp" class="menu-btn">Thống kê</a>
    </div>
  </div>
</div>

<div class="footer">
</div>
</body>
</html>
