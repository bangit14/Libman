<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.librian.model.Reader" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê độc giả - Hệ thống quản lý thư viện</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
            max-width: 1200px;
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

        .search-section {
            background: #ffffff;
            border: 2px solid #000000;
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .search-form {
            margin-bottom: 2rem;
        }

        .form-row {
            display: flex;
            gap: 2rem;
            align-items: end;
            justify-content: center;
            flex-wrap: wrap;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
        }

        .summary-section {
            background: #ffffff;
            border: 2px solid #000000;
            padding: 1rem 2rem;
            margin-bottom: 2rem;
        }

        .summary-item {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .summary-item label {
            font-weight: bold;
            font-size: 1.1rem;
        }

        .summary-item input {
            padding: 0.5rem;
            border: 2px solid #000000;
            font-size: 1rem;
            width: 200px;
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
        }

        .form-group input:focus {
            outline: none;
            border-color: #333333;
        }

        .search-btn, .back-btn {
            background: #000000;
            color: #ffffff;
            border: 2px solid #000000;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .search-btn:hover, .back-btn:hover {
            background: #ffffff;
            color: #000000;
        }

        .results-section {
            background: #ffffff;
            border: 2px solid #000000;
        }

        .results-table {
            width: 100%;
            border-collapse: collapse;
        }

        .results-table th,
        .results-table td {
            border: 1px solid #000000;
            padding: 1rem;
            text-align: left;
        }

        .results-table th {
            background: #f0f0f0;
            font-weight: bold;
        }

        .results-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .results-table tr:hover {
            background: #e8e8e8;
        }

        .detail-btn {
            background: #000000;
            color: #ffffff;
            border: 1px solid #000000;
            padding: 0.5rem 1rem;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 0.9rem;
        }

        .detail-btn:hover {
            background: #ffffff;
            color: #000000;
        }

        .no-results {
            text-align: center;
            padding: 3rem;
            color: #666666;
        }

        .no-results-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }

            .search-form {
                flex-direction: column;
                gap: 1rem;
            }

            .results-table {
                font-size: 0.9rem;
            }

            .results-table th,
            .results-table td {
                padding: 0.5rem;
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
        <h1 class="page-title">Thống kê độc giả</h1>

        <div class="search-section">
            <form method="get" action="reader" class="search-form">
                <div class="form-row">
                    <a href="Statistics.jsp" class="back-btn">Quay lại</a>

                    <div class="form-group">
                        <label for="totalBorrowed">Tổng số lượt mượn:</label>
                        <input type="text" id="totalBorrowed" name="totalBorrowed"
                               value="<%= request.getAttribute("totalBorrowed") != null ? request.getAttribute("totalBorrowed") : "" %>"
                               readonly>
                    </div>

                    <div class="form-group">
                        <label for="startDate">Bắt đầu:</label>
                        <input type="date" id="startDate" name="startDate"
                               value="<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : "" %>">
                    </div>

                    <div class="form-group">
                        <label for="endDate">Kết thúc:</label>
                        <input type="date" id="endDate" name="endDate"
                               value="<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : "" %>">
                    </div>

                    <button type="submit" class="search-btn">Tìm kiếm</button>
                </div>
            </form>
        </div>

        <div class="results-section">
            <table class="results-table">
                <thead>
                    <tr>
                        <th>Mã độc giả</th>
                        <th>Tên</th>
                        <th>Số điện thoại</th>
                        <th>Số lần mượn</th>
                        <th>Chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Reader> readers = (List<Reader>) request.getAttribute("readers"); %>
                    <% if (readers != null && !readers.isEmpty()) { %>
                        <% for (Reader reader : readers) { %>
                            <tr>
                                <td><%= reader.getId() %></td>
                                <td><%= reader.getName() != null ? reader.getName() : "N/A" %></td>
                                <td><%= reader.getPhone() != null ? reader.getPhone() : "N/A" %></td>
                                <td><%= reader.getBorrowCount() %></td>
                                <td>
                                    <a href="loan-detail?readerId=<%= reader.getId() %>&startDate=<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : "" %>&endDate=<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : "" %>"
                                       class="detail-btn">
                                        Xem chi tiết
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="5" class="no-results">
                                <div class="no-results-icon">👥</div>
                                <h3>Không tìm thấy độc giả nào</h3>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
