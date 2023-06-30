<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Giỏ hàng</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        input[type=text] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }
        a[href='/asm/hoa-don'] {
            display: inline-block;
            padding: 10px 20px;
            background-color: red;
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>
<header class="container-fluid bg-body-tertiary">
    <nav class="navbar navbar-expand-lg navbar-light container">
        <a class="navbar-brand" href="#">
            <img src="image/weibo.png" alt="" width="100%">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/asm/trang-chu">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gioithieu.html">GIỚI THIỆU</a>
                </li>
            </ul>
            <ul>
                <input type="text" readonly style="width: 38px">
            </ul>
            <ul>
                <a class="nav-link" href="/asm/gio-hang">
                    <img src="/images/gio_hang.jpg" alt="" width="38px">
                </a>
            </ul>

            <ul class="navbar-nav me-3 mb-2 mb-lg-0">
                <c:choose>
                    <c:when test="${idKh == null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Thông tin
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/asm/dang-nhap">Đăng kí or Đăng nhập</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:when test="${idKh != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Thông tin
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/asm/dang-nhap">Đăng kí or Đăng nhập</a></li>
                                <li><a class="dropdown-item" href="/asm/hoa-don">Hóa đơn chờ</a></li>
                                <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </nav>
</header>

<div class="container mt-4">
    <!-- Bảng danh sách nhân viên -->
    <form action="/asm/gio-hang" method="post">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Hình ảnh</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Action</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${page.content}" var="list">
                <tr>
                    <td><input type="checkbox" name="chon" value="${list.id}"></td>
                    <td>${list.sanPham.ten}</td>
                    <td><img src="/images/${list.sanPham.anh}" alt="" width="50px"></td>
                    <td><input type="number" min="0" max="100" step="1" value="${list.soLuong}"></td>
                    <td>
                        <button formaction="/gio-hang/clear" name="delete" value="${list.id}" class="btn btn-danger">Clear</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="d-flex justify-content-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${not page.first}">
                        <a href="?pageNo=${page.number - 1}">Previous</a>
                    </c:if>
                    <c:if test="${not page.last}">
                        <a href="?pageNo=${page.number + 1}">Next</a>
                    </c:if>
                </ul>
            </nav>
        </div>
        <button type="submit" formaction="/asm/add-hoa-don">Xuất hóa đơn</button>
    </form>

    <!-- Phân trang -->

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-CLJ6+PdEa2l9thF3mUqsFfL0ZGKk4j5AqCDh1iDxXwHbjWU7gVvKCTniBbYlX8iQ"
        crossorigin="anonymous"></script>
</body>
</html>