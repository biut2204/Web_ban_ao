<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý nhân viên</title>
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
    </style>
</head>

<body>
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
                            <option ${sanPham.loaiAo.id eq listLA.id ? 'selected' : ''} value="${listLA.id}">${listLA.ten}</option>${listLA.id}
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
                ${loi}
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

    <!-- Phân trang -->

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-CLJ6+PdEa2l9thF3mUqsFfL0ZGKk4j5AqCDh1iDxXwHbjWU7gVvKCTniBbYlX8iQ"
        crossorigin="anonymous"></script>
</body>
</html>