<%@include file="taglib_includes.jsp" %>
<DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="App.Title"/></title>
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/users.js"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">

<h2 class="bbb" align="center">JAVA RUSH CRUD TEST TASK</h2>

<form action="searchUsers.do" method="post">
    <table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="50%" class="fff" align="right">
        <tr>
            <td><input type="button" value="&#10150;Add user" onclick="javascript:go('saveUser.do');"/> </td>
            <td>Enter user`s name to search  <input type="text" name="name"/>
                <input type="submit" value="&#128269;Search">
                <input type="button"  value="&#9728;Home" onclick="javascript:go('viewAllUsers.do?pageNum=1');">
            </td></tr>
    </table>
</form>



<table style="border-collapse: collapse;" border="1" bordercolor="grey" width="100%" class="aaa" >
    <tr>
        <th align = "center">Id</th>
        <th align = "center">Name</th>
        <th align = "center">Age</th>
        <th align = "center">isAdmin</th>
        <th align = "center">createdDate</th>
        <th align = "center">Options</th>
    </tr>
    <c:if test="${empty SEARCH_USERS_RESULTS_KEY}">
        <tr>
            <td colspan="4">No users found</td>
        </tr>
    </c:if>
    <c:if test="${! empty SEARCH_USERS_RESULTS_KEY}">
        <c:forEach var="user" items="${SEARCH_USERS_RESULTS_KEY}">
            <tr>
                <td align = "center"><c:out value="${user.id}"></c:out></td>
                <td align = "center"><c:out value="${user.name}"></c:out></td>
                <td align = "center"><c:out value="${user.age}"></c:out> </td>
                <td align = "center"><c:out value="${user.isAdmin}"></c:out></td>
                <td align = "center"><c:out value="${user.createdDate}"></c:out></td>
                <td align = "center">
                    &nbsp;<a href="updateUser.do?id=${user.id}"><input type="submit" value="&#9998;Edit"/></a>
                    &nbsp;&nbsp;<a class="ccc" href="javascript:deleteUser('deleteUser.do?id=${user.id}');"><input type="submit" value="&#10008;Delete user"/></a>
                </td>
            </tr>

        </c:forEach>
    </c:if>
</table>


<br>
    <a style ="font-size:15px" href="viewAllUsers.do?pageNum=1">first</a>
    <c:forEach begin="${param.pageNum - 3 > 0 ? param.pageNum - 3 :1}" end="${param.pageNum + 3}" var="p">
        <c:if test="${param.pageNum ne p}">
            <a style ="font-size:15px" href="viewAllUsers.do?pageNum=${p}">${p}</a>
        </c:if>
        <c:if test="${param.pageNum eq p}">
            <a style ="font-size:15px" class="activeA" href="viewAllUsers.do?pageNum=${p}">${p}</a>
        </c:if>

    </c:forEach>
    <a style ="font-size:15px" href="viewAllUsers.do?pageNum=${USERS_PAGE_COUNT}">last</a>
</body>
</html>
