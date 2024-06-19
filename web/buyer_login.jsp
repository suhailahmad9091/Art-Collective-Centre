<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    if (request.getParameter("submit") != null) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select * from buyer where b_email=? and b_password=?");
        pst.setString(1, email);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String b_id = rs.getString(1);
            response.sendRedirect("./buyer/profile.jsp?b_id=" + b_id);
        } else {
%>

<script>
    alert("Invalid Email and Password");
</script>

<%
        }
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>Buyer Login</title>
        <link rel="stylesheet" href="./css/login.css" />
    </head>
    <body>
        <div class="wrapper">
            <div class="title">Buyer Login</div>
            <form action="#" method="post">
                <div class="field">
                    <input type="email" name="email" required />
                    <label>Email</label>
                </div>
                <div class="field">
                    <input type="password" name="password"required />
                    <label>Password</label>
                </div>
                <div class="field">
                    <input type="submit" name="submit" value="Login" />
                </div>
                <div class="signup-link">
                    Not a member? <a href="./buyer_signup.jsp">Signup</a>
                </div>
                <div class="home-link">
                    <a href="./index.jsp">Back to Home</a>
                </div>
            </form>
        </div>
    </body>
</html>

