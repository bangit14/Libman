<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.librian.model.Document" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm tài liệu - Hệ thống quản lý thư viện</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ffffff;
            color: #000000;
            line-height: 1.6;
            margin: 0;
        }

        /* ================= HEADER ================= */
        .header {
            background: #000;
            color: #fff;
            padding: 1rem 2rem;
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

        .logout-btn {
            background: #000;
            color: #fff;
            border: 1px solid #000;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background: #fff;
            color: #000;
        }

        /* ================= MAIN CONTAINER ================= */
        .container {
            max-width: 900px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .page-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 2rem;
        }

        /* ================= FORM TÌM KIẾM ================= */
        .search-section {
            padding: 2rem 0;
            text-align: center;
        }

        .search-form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .search-label {
            font-weight: bold;
            font-size: 1.1rem;
        }

        .search-input {
            padding: 0.75rem;
            border: 1px solid #000;
            font-size: 1rem;
            width: 300px;
        }

        .search-btn,
        .back-btn {
            background: #000;
            color: #fff;
            border: none;
            font-size: 1rem;
            width: 120px;
            height: 45px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
        }

        .search-btn:hover,
        .back-btn:hover {
            background: #fff;
            color: #000;
            border: 1px solid #000;
        }

        /* ================= BẢNG KẾT QUẢ ================= */
        .results-section {
            margin-top: 2rem;
        }

        .table-wrapper {
            max-height: 400px;         /* Giới hạn chiều cao hiển thị */
            overflow-y: auto;          /* Thanh cuộn dọc */
            border: 1px solid #000;
            border-radius: 5px;
        }

        .results-table {
            width: 100%;
            border-collapse: collapse;
        }

        .results-table th,
        .results-table td {
            border: 1px solid #000;
            padding: 1rem;
            text-align: left;
            white-space: nowrap; /* Không xuống dòng */
        }

        .results-table th {
            background: #f0f0f0;
            position: sticky;  /* Giữ cố định tiêu đề khi cuộn */
            top: 0;
            z-index: 10;
        }

        .results-table tr:nth-child(even) {
            background: #f9f9f9;
        }

        .results-table tr:hover {
            background: #e8e8e8;
        }

        .detail-btn {
            background: #000;
            color: #fff;
            border: none;
            padding: 0.5rem 1rem;
            text-decoration: none;
            font-size: 0.9rem;
            border-radius: 3px;
            transition: all 0.3s ease;
        }

        .detail-btn:hover {
            background: #fff;
            color: #000;
            border: 1px solid #000;
        }

        .no-results {
            text-align: center;
            padding: 2rem;
            color: #555;
        }

    </style>
</head>
<body>
<div class="header">
    <div class="header-content">
        <div class="logo">Thư viện Librian</div>
        <div class="user-info">
            <span>Xin chào, <%= session.getAttribute("username") %></span>
            <a href="logout" class="logout-btn">Đăng xuất</a>
        </div>
    </div>
</div>

<div class="container">
    <h1 class="page-title">Tìm kiếm tài liệu</h1>

    <div class="search-section">
        <form method="get" action="search" class="search-form">
            <label class="search-label">Từ khóa:</label>
            <input type="text" name="keyword" placeholder="Nhập từ khóa..."
                   class="search-input"
                   value="<%= request.getAttribute("searchKeyword") != null ? request.getAttribute("searchKeyword") : "" %>">
            <button type="submit" class="search-btn">Tìm kiếm</button>
            <a href="main" class="back-btn">Quay lại</a>
        </form>
    </div>

    <div class="results-section">
        <div class="table-wrapper">
            <table class="results-table">
                <thead>
                <tr>
                    <th>Mã tài liệu</th>
                    <th>Tên</th>
                    <th>Số lượng</th>
                    <th>Chi tiết</th>
                </tr>
                </thead>
                <tbody>
                <% List<Document> documents = (List<Document>) request.getAttribute("documents"); %>
                <% if (documents != null && !documents.isEmpty()) { %>
                <% for (Document doc : documents) { %>
                <tr>
                    <td><%= doc.getId() %></td>
                    <td><%= doc.getName() %></td>
                    <td><%= doc.getQuantity() %></td>
                    <td><a href="detail?id=<%= doc.getId() %>" class="detail-btn">Chi tiết</a></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="4" class="no-results">Không tìm thấy tài liệu nào</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
