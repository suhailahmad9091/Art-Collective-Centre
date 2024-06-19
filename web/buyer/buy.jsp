<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String b_id = request.getParameter("b_id");
    String p_id = request.getParameter("p_id");

    String s_id = "", category = "", name = "", size = "", price = "";

    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    String date = currentDate.format(formatter);

    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("select * from painting where p_id = " + p_id);
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
        s_id = rs.getString(2);
        category = rs.getString(3);
        name = rs.getString(4);
        size = rs.getString(5);
        price = rs.getString(6);
    }
%>

<%    if (request.getParameter("submit") != null) {
        String mode = request.getParameter("mode");

        pst = con.prepareStatement("insert into payment(p_id, b_id, s_id, pt_amount, pt_mode, pt_date) values(?,?,?,?,?,?)");
        pst.setString(1, p_id);
        pst.setString(2, b_id);
        pst.setString(3, s_id);
        pst.setString(4, price);
        pst.setString(5, mode);
        pst.setString(6, date);
        pst.executeUpdate();
%>

<script>
    alert("Order placed successfully");
    window.location = "./orders.jsp?b_id=<%=b_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Buy</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Order Details</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Painting Category</span>
                            <input
                                type="text"
                                value="<%=category%>"
                                readonly
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Painting Name</span>
                            <input
                                type="text"
                                value="<%=name%>"
                                readonly
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Painting Size</span>
                            <input
                                type="text"
                                value="<%=size%>"
                                readonly
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Painting Price</span>
                            <input
                                type="text"
                                value="<%=price%>"
                                readonly
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Choose Payment Mode</span>
                            <select name="mode" id="mode" required>
                                <option value="Cash on Delivery">Cash on Delivery</option>
                            </select>
                        </div>
                        <div class="button">
                            <input style="padding: 10px 30px" type="submit" name="submit" value="Buy" />
                        </div>
                </form>
            </div>
        </div>
    </body>
</html>
