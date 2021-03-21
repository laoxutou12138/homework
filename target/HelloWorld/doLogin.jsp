<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: WXL
  Date: 2021/3/12
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isErrorPage="true" %>
<html>
<head>
    <title>doLogin</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    //1.加载驱动
    Class.forName("com.mysql.cj.jdbc.Driver");

    //2.获得连接实例
    try(Connection connection =
                DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/library?serverTimezone=UTC",
                        "root","root")){
        //3.预编译SQL语句
        String sql = "select * from borrow_card where username=?";
        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1,username);
            //4.执行查询
            try(ResultSet resultSet = statement.executeQuery()) {
                //5.遍历ResultSet
                while (resultSet.next()) {
                    if (password.equals(resultSet.getString("password"))) {
                        //执行跳转
                        response.sendRedirect("./main.jsp");
                    } else {
                        //返回首页
                        response.sendRedirect("./index.jsp");
                    }
                }
                //查无此人
            }
        }
    }catch (SQLException e){
        e.printStackTrace();
    }

%>
</body>
</html>
