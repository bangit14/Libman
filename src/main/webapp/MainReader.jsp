<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang chủ bạn đọc - Hệ thống quản lý thư viện</title>
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
      }

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
        max-width: 1200px;
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

      .user-info span {
        background: #333333;
        padding: 0.5rem 1rem;
        border-radius: 20px;
      }

      .logout-btn {
        background: #333333;
        color: #ffffff;
        border: 1px solid #666666;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        cursor: pointer;
        text-decoration: none;
        transition: background 0.3s ease;
      }

      .logout-btn:hover {
        background: #555555;
      }

      .container {
        max-width: 800px;
        margin: 4rem auto;
        padding: 0 2rem;
        text-align: center;
      }

      .main-title {
        font-size: 2.5rem;
        font-weight: bold;
        color: #000000;
        margin-bottom: 3rem;
      }

      .search-button {
        background: #000000;
        color: #ffffff;
        border: 2px solid #000000;
        padding: 1rem 3rem;
        font-size: 1.2rem;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
      }

      .search-button:hover {
        background: #ffffff;
        color: #000000;
      }

      .footer {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        background: #f8f8f8;
        border-top: 1px solid #cccccc;
        padding: 1rem;
        text-align: center;
        color: #666666;
        font-size: 0.9rem;
      }

      @media (max-width: 768px) {
        .header-content {
          flex-direction: column;
          gap: 1rem;
        }

        .main-title {
          font-size: 2rem;
        }

        .search-button {
          padding: 0.8rem 2rem;
          font-size: 1rem;
        }
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
      <h1 class="main-title">Trang chủ bạn đọc</h1>
      <a href="search" class="search-button">Tìm kiếm</a>
    </div>

    <div class="footer">
      <p>&copy; 2024 Hệ thống quản lý thư viện Librian</p>
    </div>
  </body>
</html>
