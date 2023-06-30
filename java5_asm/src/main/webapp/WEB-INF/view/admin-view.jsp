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
                        <a class="nav-link active" href="#/asm/view-loai-ao">
                            <img src="image/quan ao.png" alt="" width="54px">
                            Loại áo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#/asm/view-co-ao">
                            <img src="image/giay dep.png" alt="" width="54px">
                            Cổ áo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#/asm/view-tay-ao">
                            <img src="image/tui xach.png" alt="" width="54px">
                            Tay áo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#san-pham/view">
                            <img src="image/phu kien.png" alt="" width="54px">
                            Quản lí Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#asm/quan-li-khach-hang">
                            <img src="image/phu kien.png" alt="" width="54px">
                            Quản lí khách hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#asm/hoa-don-all">
                            <img src="image/phu kien.png" alt="" width="54px">
                            Quản lí đơn hàng
                        </a>
                    </li>
                </ul>

            </div>
        </div>

        <div class="col-md-9 col-lg-10 px-5 py-4">
            <div ng-view></div>
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
<script>
    var app = angular.module("myapp", ['ngRoute']);
    app.config(function ($routeProvider, $locationProvider) {
        $locationProvider.hashPrefix("");
        $routeProvider
            .when("/asm/view-loai-ao", {
                templateUrl: "/asm/view-loai-ao",
            }).when("/asm/view-co-ao", {
            templateUrl: "/asm/view-co-ao",
        }).when("/asm/view-tay-ao", {
            templateUrl: "/asm/view-tay-ao",
        }).when("/san-pham/view", {
            templateUrl: "/san-pham/view",
        }).when("/asm/quan-li-khach-hang", {
            templateUrl: "/asm/quan-li-khach-hang",
        }).when("/asm/hoa-don-all", {
            templateUrl: "/asm/hoa-don-all",
        })
            .otherwise("/asm/view-loai-ao");
    })
</script>
</body>

</html>