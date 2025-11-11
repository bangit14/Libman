<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.librian.model.LoanSlipDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết phiếu mượn - Hệ thống quản lý thư viện</title>
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

        .borrowing-info-section {
            background: #ffffff;
            border: 2px solid #000000;
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .borrowing-info {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .info-row {
            display: flex;
            gap: 2rem;
            flex-wrap: wrap;
        }

        .info-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            flex: 1;
            min-width: 200px;
        }

        .info-group label {
            font-weight: bold;
            font-size: 1rem;
        }

        .info-group input {
            padding: 0.75rem;
            border: 2px solid #000000;
            font-size: 1rem;
            background: #f8f8f8;
        }

        .info-actions {
            display: flex;
            justify-content: flex-end;
        }

        .back-btn {
            background: #666666;
            color: #ffffff;
            border: 2px solid #666666;
            padding: 0.75rem 2rem;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .back-btn:hover {
            background: #ffffff;
            color: #666666;
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
        <h1 class="page-title">Chi tiết phiếu mượn</h1>

        <div class="borrowing-info-section">
            <div class="borrowing-info">
                <div class="info-row">
                    <div class="info-group">
                        <label>Mã phiếu mượn:</label>
                        <input type="text" value="<%= request.getAttribute("borrowingSlipId") %>" readonly>
                    </div>
                    <div class="info-group">
                        <label>Ngày mượn:</label>
                        <input type="text" value="<%= request.getAttribute("loanDate")%>" readonly>
                    </div>
                </div>
            </div>
        </div>

        <div class="results-section">
            <table class="results-table">
                <thead>
                    <tr>
                        <th>Mã chi tiết</th>
                        <th>Tên tài liệu</th>
                        <th>Số lượng</th>
                        <th>Ngày trả</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<LoanSlipDetail> loanSlipDetails = (List<LoanSlipDetail>) request.getAttribute("loanSlipDetails"); %>
                    <% if (loanSlipDetails != null && !loanSlipDetails.isEmpty()) { %>
                        <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm"); %>
                        <% for (LoanSlipDetail detail : loanSlipDetails) { %>
                            <tr>
                                <td><%= detail.getId() %></td>
                                <td><%= request.getAttribute("documentNameMap") != null && ((java.util.Map<Integer,String>)request.getAttribute("documentNameMap")).get(detail.getDocumentId()) != null ? ((java.util.Map<Integer,String>)request.getAttribute("documentNameMap")).get(detail.getDocumentId()) : detail.getDocumentId() %></td>
                                <td><%= detail.getQuantity() %></td>
                                <td><%= detail.getReturnDate() != null ? dateFormat.format(detail.getReturnDate()) : "Chưa trả" %></td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="4" class="no-results">
                                <div class="no-results-icon">📋</div>
                                <h3>Không có chi tiết phiếu mượn</h3>
                                <p>Phiếu mượn này không có chi tiết nào</p>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div style="text-align: center; margin-top: 20px">
            <a href="javascript:history.back()" class="back-btn">Quay lại</a>
        </div>
    </div>
</body>
</html>
