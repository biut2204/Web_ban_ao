<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
            background-color: #4CAF50;
            color: white;
        }

        .pagination {
            display: inline-block;
        }

        .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        .pagination a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }

        .pagination a:hover:not(.active) {background-color: #ddd;}

    </style>
</head>
<body>
<form>
    <table>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Địa chỉ</th>
            <th>Sđt</th>
            <th>Email</th>
            <th>Trạng thái</th>
        </tr>
        <c:forEach items="${page.content}" var="list">
            <tr>
                <td>${list.ma}</td>
                <td>${list.ten}</td>
                <td>${list.diaChi}</td>
                <td>${list.sdt}</td>
                <td>${list.email}</td>
                <td>${list.trangThai}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="pagination">
        <c:if test="${not page.first}">
            <a href="?pageNo=${page.number -1}">Pre</a>
        </c:if>

        <c:if test="${not page.last}">
            <a href="?pageNo=${page.number +1}">Next</a>
        </c:if>
    </div>

</form>
</body>
</html>
