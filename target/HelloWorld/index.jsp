<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page errorPage="doLogin.jsp" %>
<html>
<body>

<form action='doLogin.jsp' method='post'>
    <table align='center' style='margin-top:200px'>
        <tr>
            <td colspan=2 align=center>图书馆</td>
        </tr>
        <tr>
            <td>请输入用户名：</td><td>
            <input type='text' name='username' /></td>
        </tr>
        <tr>
            <td>请输入密&nbsp&nbsp&nbsp码：</td>
            <td><input type='password' name='password' /></td>
        </tr>
        <tr>
            <td><input type='submit' value='登录' /></td>
            <td><button name="zc">注册</button></td>
        </tr>
    </table>

    <%
        String error = request.getParameter("error");
        if ("0".equals(error)){

        }else {

        }
    %>
</form>


</body>
</html>
