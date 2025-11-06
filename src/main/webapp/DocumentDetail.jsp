<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="com.example.librian.model.Document" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thông tin chi tiết tài liệu - Hệ thống quản lý thư viện</title>
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
        margin: 2rem auto;
        padding: 0 2rem;
      }

      .page-title {
        font-size: 2rem;
        font-weight: bold;
        color: #000000;
        text-align: center;
        margin-bottom: 2rem;
      }

      .detail-section {
        background: #ffffff;
        border: 2px solid #000000;
        padding: 2rem;
      }

      .detail-form {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
      }

      .form-group {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
      }

      .form-group label {
        font-weight: bold;
        font-size: 1.1rem;
      }

      .form-group input {
        padding: 0.75rem;
        border: 2px solid #000000;
        font-size: 1rem;
        background: #ffffff;
        color: #000000;
      }

      .form-group input:focus {
        outline: none;
        border-color: #333333;
      }

      .form-group input:read-only {
        background: #f8f8f8;
        color: #666666;
      }

      .back-btn {
        background: #000000;
        color: #ffffff;
        border: 2px solid #000000;
        padding: 0.75rem 2rem;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
        margin-top: 2rem;
        text-align: center;
      }

      .back-btn:hover {
        background: #ffffff;
        color: #000000;
      }

      .error-message {
        background: #f8f8f8;
        color: #666666;
        padding: 2rem;
        border: 2px solid #cccccc;
        text-align: center;
        margin: 2rem 0;
      }

      .error-icon {
        font-size: 3rem;
        margin-bottom: 1rem;
      }

      @media (max-width: 768px) {
        .header-content {
          flex-direction: column;
          gap: 1rem;
        }

        .detail-form {
          grid-template-columns: 1fr;
          gap: 1rem;
        }

        .page-title {
          font-size: 1.5rem;
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
      <h1 class="page-title">Thông tin chi tiết tài liệu</h1>

      <% Document document = (Document) request.getAttribute("document"); %> <%
      if (document != null) { %>
      <div class="detail-section">
        <form class="detail-form">
          <div class="form-group">
            <label for="id">Mã tài liệu:</label>
            <input
              type="text"
              id="id"
              value="<%= document.getId() %>"
              readonly
            />
          </div>

          <div class="form-group">
            <label for="name">Tên:</label>
            <input
              type="text"
              id="name"
              value="<%= document.getName() %>"
              readonly
            />
          </div>

          <div class="form-group">
            <label for="quantity">Số lượng:</label>
            <input
              type="text"
              id="quantity"
              value="<%= document.getQuantity() %>"
              readonly
            />
          </div>

          <div class="form-group">
            <label for="author">Tác giả:</label>
            <input type="text" id="author" value="<%= document.getAuthor() !=
            null ? document.getAuthor() : "Chưa cập nhật" %>" readonly>
          </div>

          <div class="form-group">
            <label for="type">Loại:</label>
            <input type="text" id="type" value="<%= document.getType() != null ?
            document.getType() : "Chưa cập nhật" %>" readonly>
          </div>
        </form>

        <a href="search" class="back-btn">Quay lại</a>
      </div>
      <% } else { %>
      <div class="error-message">
        <div class="error-icon">❌</div>
        <h3>Không tìm thấy tài liệu</h3>
        <p>Tài liệu bạn tìm kiếm không tồn tại hoặc đã bị xóa.</p>
        <a href="search" class="back-btn">Quay lại</a>
      </div>
      <% } %>
    </div>
  </body>
</html>
