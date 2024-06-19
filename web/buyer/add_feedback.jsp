<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String b_id = request.getParameter("b_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String seller_name = request.getParameter("seller_name");
        String text = request.getParameter("text");
        String s_id = "";

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String date = currentDate.format(formatter);

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select s_id from seller where s_name=?");
        pst.setString(1, seller_name);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            s_id = rs.getString(1);
        }

        pst = con.prepareStatement("insert into feedback(s_id, b_id, f_date, f_text) values(?,?,?,?)");
        pst.setString(1, s_id);
        pst.setString(2, b_id);
        pst.setString(3, date);
        pst.setString(4, text);
        pst.executeUpdate();
%>

<script>
    alert("Feedback added successfully");
    window.location = "./feedback.jsp?b_id=<%=b_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Add Feedback</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Add Feedback</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">

                        <div class="input-box">
                            <span class="details">Seller Name</span>
                            <select name="seller_name" id="seller_name" required>
                                <%
                                    Connection con = ConnectionProvider.getCon();
                                    PreparedStatement pst = con.prepareStatement("select s_name from seller order by s_name");
                                    ResultSet rs = pst.executeQuery();

                                    while (rs.next()) {
                                %>

                                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                                <%
                                    }
                                %>    

                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Feedback Text</span>
                            <input
                                type="text"
                                name="text"
                                placeholder="Enter feedback Text"
                                required
                                />
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Add" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
