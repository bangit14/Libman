# Hệ thống quản lý thư viện Librian

## Mô tả

Hệ thống quản lý thư viện Librian được xây dựng bằng Java Servlet/JSP với cơ sở dữ liệu MySQL.

## Tính năng

- ✅ Đăng nhập/Đăng xuất
- ✅ Tìm kiếm tài liệu theo tên, tác giả, loại
- ✅ Hiển thị danh sách tài liệu
- ✅ Giao diện responsive, thân thiện với người dùng

## Cấu trúc dự án

```
src/
├── main/
│   ├── java/
│   │   ├── com/example/librian/
│   │   ├── dao/           # Data Access Objects
│   │   ├── model/         # Entity classes
│   │   ├── servlet/       # Servlet controllers
│   │   └── util/          # Utility classes
│   └── webapp/
│       ├── WEB-INF/
│       │   └── web.xml    # Web configuration
│       ├── login.jsp      # Trang đăng nhập
│       ├── MainReader.jsp # Trang chính
│       └── index.jsp      # Trang chuyển hướng
```

## Cài đặt và chạy

### 1. Yêu cầu hệ thống

- Java 21+
- Maven 3.6+
- MySQL 8.0+
- Tomcat 10+

### 2. Cấu hình cơ sở dữ liệu

1. Tạo database MySQL:

```sql
CREATE DATABASE libman;
```

2. Chạy script SQL để tạo các bảng (xem phần Database Schema)

3. Cập nhật thông tin kết nối trong `src/main/java/dao/DAO.java`:

```java
private static final String URL = "jdbc:mysql://localhost:3307/libman";
private static final String USER = "root";
private static final String PASSWORD = "admin123";
```

### 3. Build và deploy

```bash
# Build project
mvn clean package

# Deploy file .war vào Tomcat
cp target/Librian-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

### 4. Truy cập ứng dụng

- URL: `http://localhost:8080/Librian-1.0-SNAPSHOT/`
- Tự động chuyển hướng đến trang đăng nhập

## Database Schema

### Bảng tblUser

```sql
CREATE TABLE tblUser (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    dob TIMESTAMP NULL,
    phone VARCHAR(10),
    email VARCHAR(255),
    role VARCHAR(50)
);
```

### Bảng tblDocument

```sql
CREATE TABLE tblDocument (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    type VARCHAR(255),
    author VARCHAR(255),
    quantity INT DEFAULT 0
);
```

### Các bảng khác

- `tblStaff`: Thông tin nhân viên
- `tblReader`: Thông tin bạn đọc
- `tblBorrowingSlip`: Phiếu mượn
- `tblLoanSlipDetail`: Chi tiết phiếu mượn

## Sử dụng

### 1. Đăng nhập

- Truy cập trang web
- Nhập tên đăng nhập và mật khẩu
- Hệ thống sẽ kiểm tra thông tin trong bảng `tblUser`

### 2. Tìm kiếm tài liệu

- Trên trang chính, sử dụng ô tìm kiếm
- Có thể tìm theo tên, tác giả hoặc loại tài liệu
- Nhấn "Tìm kiếm" để thực hiện
- Nhấn "Xóa bộ lọc" để xem tất cả tài liệu

### 3. Đăng xuất

- Nhấn nút "Đăng xuất" ở góc phải trên
- Hệ thống sẽ chuyển về trang đăng nhập

## Cấu trúc code

### Model Classes

- `User.java`: Entity cho bảng tblUser
- `Document.java`: Entity cho bảng tblDocument
- `BorrowingSlip.java`: Entity cho phiếu mượn
- `LoanSlipDetail.java`: Entity cho chi tiết phiếu mượn
- `Staff.java`: Entity cho nhân viên
- `Reader.java`: Entity cho bạn đọc

### DAO Classes

- `UserDAO.java`: Xử lý dữ liệu người dùng
- `DocumentDAO.java`: Xử lý dữ liệu tài liệu

### Servlet Classes

- `LoginServlet.java`: Xử lý đăng nhập
- `MainServlet.java`: Xử lý trang chính và tìm kiếm
- `LogoutServlet.java`: Xử lý đăng xuất

## Phát triển thêm

### Thêm tính năng mới

1. Tạo model class mới trong `src/main/java/model/`
2. Tạo DAO class tương ứng trong `src/main/java/dao/`
3. Tạo servlet xử lý trong `src/main/java/servlet/`
4. Tạo JSP page trong `src/main/webapp/`
5. Cập nhật `web.xml` nếu cần

### Thêm validation

- Thêm validation cho form input
- Kiểm tra quyền truy cập
- Xử lý lỗi database

## Troubleshooting

### Lỗi kết nối database

- Kiểm tra MySQL service đang chạy
- Kiểm tra thông tin kết nối trong DAO.java
- Đảm bảo database đã được tạo

### Lỗi 404 Not Found

- Kiểm tra URL mapping trong servlet
- Kiểm tra file JSP có tồn tại
- Kiểm tra web.xml configuration

### Lỗi ClassNotFoundException

- Chạy `mvn clean install` để download dependencies
- Kiểm tra Tomcat version compatibility
