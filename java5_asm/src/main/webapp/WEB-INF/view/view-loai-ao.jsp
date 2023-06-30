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
        <div class="col-md-8">
            <h2 class="mb-3">Thông tin</h2>

            <form action="/asm/view-loai-ao" method="post">
                <input type="hidden" name="id" value="${loaiAo.id}" id="id"/>
                <div class="col-md-4 mb-3">
                    <label for="ho">Mã:</label>
                    <input type="text" class="form-control" id="ho" name="ma" value="${loaiAo.ma}">
                </div>

                <div class="col-md-4 mb-3">
                    <label for="ten">Tên:</label>
                    <input type="text" class="form-control" id="ten" name="ten" value="${loaiAo.ten}">
                </div>
                <p>${loi}</p>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary" formaction="/loai-ao/add">Thêm</button>
                    <button type="submit" class="btn btn-warning" formaction="/loai-ao/update">Sửa</button>
                </div>
            </form>
        </div>
    </div>

    <h2 class="mt-5 mb-3">Danh sách</h2>
    <form action="/asm/loai-co-ao" method="post">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Mã</th>
                <th scope="col">Tên</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${page.content}" var="list">
                <tr>
                    <td>${list.ma}</td>
                    <td>${list.ten}</td>

                    <td>
                        <button formaction="/loai-ao/detail" name="detail" value="${list.id}" class="btn btn-primary me-2">Detail</button>
                        <button formaction="/loai-ao/remove" name="delete" value="${list.id}" class="btn btn-danger">Remove</button>
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