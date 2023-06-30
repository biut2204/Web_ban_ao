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

        .container {
            display: flex;
            align-items: center; /* căn giữa theo chiều dọc */
        }

        ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        ul:first-child {
            margin-right: 10px; /* giãn cách giữa 2 phần tử */
        }
    </style>
</head>

<body onload="auto()">

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

<main class="container-fluid bg-body-primary">
    <div class="row">
        <div class="col-md-3 col-lg-2 d-none d-md-block bg-body-secondary sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <img src="image/quan ao.png" alt="" width="54px">
                            QUẦN ÁO
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="image/giay dep.png" alt="" width="54px">
                            GIÀY DÉP
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="image/tui xach.png" alt="" width="54px">
                            TÚI XÁCH
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="image/phu kien.png" alt="" width="54px">
                            PHỤ KIỆN
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-md-12 col-lg-10 px-5 py-4">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/images/banner_1.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/banner_2.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
</main>

<h1 style="text-align: center">Danh mục sản phẩm nổi bật</h1>
<form action="/asm/gio-hang" method="post">
    <label for="">Tìm kiếm</label>
    <input type="text" name="" id="">
    <div class="card-deck mb-5">
        <c:forEach items="${page.content}" var="list">
            <div class="col-md-3 col-6">
                <div class="card" style="display: flex; align-items: center;">
                    <div class="thumbnail" style="float: left">
                        <a href="9.html">
                            <img src="/images/${list.anh}" alt="Lights" style="width:150px">
                        </a>
                    </div>

                    <div class="card-body" style="float: left">
                        <h5 class="card-title">${list.ten}</h5>
                        <p class="card-text">Giá chỉ từ ${list.gia}</p>
                    </div>

                    <div class="card-body"
                         style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                        <button class="btn bg-body-secondary text-black">Xem sản phẩm</button>
                        <button type="submit" class="btn bg-body-secondary text-black" formaction="/gio-hang/add"
                                name="idSP" value="${list.id}">Thêm vào giỏ hàng
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
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

<div class="container">
    <div class="row">
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card h-100">
                <img src="/images/ao_so_mi_1.jpg" class="card-img-top" alt="Cooking tips">
                <div class="card-body">
                    <h5 class="card-title">Cooking tips</h5>
                    <p class="card-text">Learn simple cooking tips to make your meals delicious and healthy.</p>
                    <a href="#" class="btn btn-primary">Learn more</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card h-100">
                <img src="/images/ao_so_mi_2.jpg" class="card-img-top" alt="Preparing breakfast for 30 people">
                <div class="card-body">
                    <h5 class="card-title">Preparing breakfast for 30 people</h5>
                    <p class="card-text">Discover 6 easy ways to prepare a delicious and nutritious breakfast for a
                        large group of people.</p>
                    <a href="#" class="btn btn-primary">Learn more</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card h-100">
                <img src="/images/ao_so_mi_di_co.jpg" class="card-img-top" alt="Visiting a clean farm in the US">
                <div class="card-body">
                    <h5 class="card-title">Visiting a clean farm in the US</h5>
                    <p class="card-text">Explore a sustainable and eco-friendly farm that produces fresh and healthy
                        produce.</p>
                    <a href="#" class="btn btn-primary">Learn more</a>
                </div>
            </div>
        </div>
    </div>
</div>

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
<script>
    $(document).ready(function () {
        $('.slider').slick({
            autoplay: true,
            autoplaySpeed: 3000,
            dots: true,
            arrows: false,
            infinite: true,
            speed: 500,
            fade: true,
            cssEase: 'linear'
        });
    });
</script>
</body>

</html>