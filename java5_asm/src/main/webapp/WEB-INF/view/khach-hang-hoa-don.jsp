<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>Quản lý nhân viên</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Import Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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

<div class="container">
    <h1>Danh sách hóa đơn</h1>

    <!-- Display table of invoice information -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Mã hóa đơn</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listMa}" var="ma" varStatus="status">
            <tr>
                <td>${ma}</td>
                <td>${listTongTien[status.index]}</td>
                <td>${listTrangThai[status.index]}</td>
                <td>
                        <%-- Display the "Thanh toán" button only if the invoice status is "Chưa thanh toán" --%>
                    <c:if test="${listTrangThai[status.index] == 'Chờ' }">
                        <form action="/hoa-don/cho-xac-nhan" method="post">
                            <button type="submit" class="btn btn-primary" name="ma" value="${ma}">Thanh toán</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Import Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-CLJ6+PdEa2l9thF3mUqsFfL0ZGKk4j5AqCDh1iDxXwHbjWU7gVvKCTniBbYlX8iQ"
        crossorigin="anonymous"></script>
</body>
</html>
