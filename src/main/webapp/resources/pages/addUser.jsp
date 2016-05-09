<%@include file="taglib_includes.jsp"%>
<html>
<head>
    <title><spring:message code="App.Title"/> </title>
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/users.js"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table width="200px" height="auto" align="center" style="border-collapse: collapse;" border="1" bordercolor="grey" class="aaa">
    <tr bgcolor="lightgrey">
        <th><b>Add new User</b></th>
    </tr>
    <tr valign="top" >
        <td >
            <form:form action="saveUser.do" method="post" commandName="addUser">

                <table width="500" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">
                    <tr>
                        <td width="100" align="right">Name</td>
                        <td width="150">
                            <form:input path="name"/></td>
                        <td align="left" >
                            <form:errors path="name" cssStyle="color:red"/>
                        </td>
                    </tr>

                    <tr>
                        <td width="100" align="right">Age</td>
                        <td><form:input path="age"/></td>
                        <td align="left"><form:errors path="age" cssStyle="color:red"/>  </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">isAdmin</td>
                        <td>
                            <form:select path="isAdmin">
                                <form:option value="false" label="false"/>
                                <form:option value="true" label="true"/>
                            </form:select>
                        </td>
                        <td>
                        </td>
                    </tr>


                    <tr>
                        <td colspan="3" align="center">
                            <input type="submit" name="" value="&#10004;Save">
                            &nbsp;&nbsp;
                            <input type="reset" name="" value="&#8634;Reset">
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
