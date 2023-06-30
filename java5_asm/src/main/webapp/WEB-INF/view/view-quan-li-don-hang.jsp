<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
                    <c:if test="${listTrangThai[status.index] == 'Chờ xác nhận' }">
                        <form action="/hoa-don/xac-nhan" method="post">
                            <button type="submit" class="btn btn-primary" name="ma" value="${ma}">OK</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
