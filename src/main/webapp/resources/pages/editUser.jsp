<%@include file="taglib_includes.jsp"%>
<html>
<head>
    <title><spring:message code="App.Title"/></title>
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/users.js"></script>
</head>
<body>
<table   width="200px" height="auto"  style="border-collapse: collapse;" border="1" bordercolor="grey" class="aaa" align="center">
    <tr>
        <th><b>Edit User Form</b></th>
    </tr>
    <tr valign="top">
        <td >
            <form:form action="updateUser.do" method="post" commandName="editUser">
                <table width="550" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">
                    <tr>
                        <td width="100" align="right">Id</td>
                        <td width="150"><form:input path="id" readonly="true"/> </td>
                        <td align="left"><form:errors path="id" cssStyle="color:red"/> </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">Name</td>
                        <td>
                            <form:input path="name"/></td>
                        <td align="left">
                            <form:errors path="name" cssStyle="color:red"/>
                        </td>
                    </tr>

                    <tr>
                        <td width="100" align="right">Age</td>
                        <td><form:input path="age"/></td>
                        <td align="left"><form:errors path="age" cssStyle="color:red"/>  </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">CreatedDate</td>
                        <td>
                            <form:input path="createdDate" readonly="true"/></td>
                        <td align="left">
                            <form:errors path="createdDate" cssStyle="color:red"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">isAdmin</td>
                        <td>
                            <form:select path="isAdmin">
                                <form:option value="true" label="true"/>
                                <form:option value="false" label="false"/>
                            </form:select>
                        </td>
                        <td>
                        </td>
                    </tr>



                    <tr valign="bottom">
                        <td  colspan="3" align="center">
                            <input class="ccc" type="button"  value="&#10008;Delete" onclick="javascript:deleteUser('deleteUser.do?id=${editUser.id}');">
                            &nbsp;&nbsp;
                            <input type="submit" name="" value="&#10004;Save">
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button"  value="&#9728;Home" onclick="javascript:go('viewAllUsers.do?pageNum=1');">
                        </td>
                    </tr>

                </table>
            </form:form>
        </td>
    </tr>
</table>
</body>
</html>
