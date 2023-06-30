<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>

    <!-- CSS của Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <!-- Thêm các tệp CSS của riêng bạn -->
    <link rel="stylesheet" href="lab1234.css">

    <!-- Thêm các tệp JavaScript của Bootstrap (tùy chọn) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>

    <!-- Thêm các tệp JavaScript của riêng bạn -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>

    <!-- CSS của riêng bạn -->
    <style>
        /* Thêm các kiểu CSS của bạn vào đây */
        img {
            width: 15%;
        }

        .card-deck {
            display: flex;
            flex-wrap: wrap; /* Wraps cards to a new line when they exceed container width */
            justify-content: space-between; /* Adds equal spacing between cards */
        }

        .card {
            margin-right: 10px; /* thêm khoảng cách ngang 10px */
            margin-bottom: 10px;
            margin-top: 10px;
        }

    </style>
</head>

<body onload="auto()" ng-app="myapp">

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
                    <a class="nav-link active" aria-current="page" href="trangchu.html">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gioithieu.html">GIỚI THIỆU</a>
                </li>

            </ul>

            <ul class="navbar-nav me-3 mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <img src="image/fb.png" alt="" width="54px">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="giohang.html">
                        <img src="image/gio hang.png" alt="" width="54px">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <img src="image/co my.png" alt="" width="38px">
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        ENGLISH
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">VIỆT NAM</a></li>
                        <li><a class="dropdown-item" href="#">TRUNG QUỐC</a></li>
                        <li><a class="dropdown-item" href="#">HÀN QUỐC</a></li>
                        <li><a class="dropdown-item" href="#">> XEM THÊM</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>
</header>

<main class="container-fluid bg-body-primary">
    <div class="row">
        <div class="col-md-3 col-lg-2 d-none d-md-block bg-body-secondary sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="http://localhost:8080/asm/admin-view#/asm/view-loai-ao">
                            <img src="image/quan ao.png" alt="" width="54px">
                            Loại áo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/asm/admin-view#/asm/view-co-ao">
                            <img src="image/giay dep.png" alt="" width="54px">
                            Cổ áo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/asm/admin-view#/asm/view-tay-ao">
                            <img src="image/tui xach.png" alt="" width="54px">
                            Tay áo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/asm/admin-view#/san-pham/view">
                            <img src="image/phu kien.png" alt="" width="54px">
                            Quản lí Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="image/phu kien.png" alt="" width="54px">
                            Quản lí tài khoản
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="image/phu kien.png" alt="" width="54px">
                            Quản lí đơn hàng
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-md-9 col-lg-10 px-5 py-4">
            <div class="container mt-4">
                <div class="row">
                    <!-- Form tìm kiếm nhân viên -->
                    <div class="col-md-4 mb-3">
                        <form action="/san-pham/search" method="post">
                            <div class="mb-3">
                                <label for="minAge">Giá từ:</label>
                                <input type="text" class="form-control" id="minAge" name="min" placeholder="Giá tối thiểu...">
                            </div>

                            <div class="mb-3">
                                <label for="maxAge">Giá đến:</label>
                                <input type="text" class="form-control" id="maxAge" name="max" placeholder="Giá tối đa...">
                            </div>

                            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                        </form>
                    </div>

                    <!-- Form thêm/sửa nhân viên -->
                    <div class="col-md-8">
                        <h2 class="mb-3">Thông tin sản phẩm</h2>

                        <form action="/san-pham/view" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${sanPham.id}" id="id"/>
                            <div class="mb-3">
                                <label for="ma">Mã sản phẩm:</label>
                                <input type="text" class="form-control" id="ma" name="ma" value="${sanPham.ma}">
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="ho">Tên sản phẩm:</label>
                                    <input type="text" class="form-control" id="ho" name="ten" value="${sanPham.ten}">
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label>Ảnh sản phẩm:</label>
                                    <input type="file" name="anh">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="chucVu">Loại áo:</label>
                                <select class="form-select" id="chucVu" name="idLoaiAo" aria-label="Default select example">
                                    <option selected disabled>Chọn chức vụ...</option>
                                    <c:forEach items="${listLA}" var="listLA">
                                        <option ${sanPham.loaiAo.id eq listLA.id ? 'selected' : ''} value="${listLA.id}">${listLA.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="cuaHang">Cổ áo:</label>
                                <select class="form-select" id="cuaHang" name="idCoAo" aria-label="Default select example">
                                    <option selected disabled>Chọn cửa hàng...</option>
                                    <c:forEach items="${listCA}" var="listCA">
                                        <option ${sanPham.coAo.id eq listCA.id ? 'selected' : ''} value="${listCA.id}">${listCA.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="cuaHang1">Tay áo:</label>
                                <select class="form-select" id="cuaHang1" name="idTayAo" aria-label="Default select example">
                                    <option selected disabled>Chọn cửa hàng...</option>
                                    <c:forEach items="${listTA}" var="listTA">
                                        <option ${sanPham.tayAo.id eq listTA.id ? 'selected' : ''} value="${listTA.id}">${listTA.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="ten">Giá:</label>
                                <input type="text" class="form-control" id="ten" name="gia" value="${sanPham.gia}">
                            </div>
                            <div class="mb-3">
                                <label>Trạng thái: </label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="trangThai" id="nam"
                                           value="còn hàng" ${sanPham.trangThai == 'còn hàng' ? 'checked' : ''}>
                                    <label class="form-check-label" for="nam">còn hàng</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="trangThai" id="nu"
                                           value="hết hàng" ${sanPham.trangThai == 'hết hàng' ? 'checked' : ''}>
                                    <label class="form-check-label" for="nu">hết hàng</label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary" formaction="/san-pham/add">Thêm</button>
                                <button type="submit" class="btn btn-warning" formaction="/san-pham/update">Sửa</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Bảng danh sách nhân viên -->
                <h2 class="mt-5 mb-3">Danh sách nhân viên</h2>
                <form action="/san-pham/view" method="post">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Tên Sản phẩm</th>
                            <th scope="col">Ảnh sản phẩm</th>
                            <th scope="col">Loại sản phẩm</th>
                            <th scope="col">Cổ áo</th>
                            <th scope="col">Tay áo</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Hành động</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.content}" var="list">
                            <tr>
                                <td>${list.ma}</td>
                                <td>${list.ten}</td>
                                <td style="width: 150px"><img src="/images/${list.anh}" alt="" style="width:50%"></td>
                                <td>${list.loaiAo.ten}</td>
                                <td>${list.tayAo.ten}</td>
                                <td>${list.coAo.ten}</td>
                                <td>${list.gia}</td>
                                <td>${list.trangThai}</td>
                                <td>
                                    <button formaction="/san-pham/detail" name="detail" value="${list.id}" class="btn btn-primary me-2">Detail</button>
                                    <button formaction="/san-pham/remove" name="delete" value="${list.id}" class="btn btn-danger">Remove</button>
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
                                <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                                    <c:choose>
                                        <c:when test="${page.number == i}">
                                            <li class="page-item active"><a class="page-link" href="?page=${i}">${i + 1}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="?page=${i}">${i + 1}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${not page.last}">
                                    <a href="?pageNo=${page.number + 1}">Next</a>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<footer class="container-fluid bg-body-tertiary">
    <div class="row py-5">
        <div class="col-md-4 col-lg-3 mb-3 mb-md-0">
            <img src="image/weibo.png" alt="" width="100%">
        </div>
        <div class="col-md-4 col-lg-6 mb-3 mb-md-0">
            <div class="row">
                <div class="col-md-6">
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2">
                            <a class="nav-link active" href="#">TRANG CHỦ</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">GIỚI THIỆU</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">QUẦN ÁO</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">GIÀY DÉP</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">TÚI XÁCH</a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">PHỤ KIỆN</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">ĐĂNG NHẬP</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">GIỎ HÀNG</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">LIÊN HỆ</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="#">TÌM KIẾM</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-lg-3">
            <ul class="list-unstyled">
                <li class="mb-2">Địa chỉ: 123 Nguyễn Văn Linh, Q.7, TP.HCM</li>
                <li class="mb-2">Email: info@weibo.com.vn</li>
                <li class="mb-2">Điện thoại: (028) 1234 5678</li>
                <li class="mb-2">Fax: (028) 1234 5679</li>
            </ul>
        </div>
    </div>

    <div class="bg-body-secondary py-3">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-md-0">© 2023 Weibo. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <img src="image/payment.png" alt="" width="40%">
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Thêm các tệp JavaScript của riêng bạn -->
<script src="lab1234.js"></script>
</body>

</html>