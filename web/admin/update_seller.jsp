<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String a_id = request.getParameter("a_id");
    String s_id = request.getParameter("s_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone_number = request.getParameter("phone_number");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");

        String day = "" + dob.charAt(8) + dob.charAt(9);
        String month = "" + dob.charAt(5) + dob.charAt(6);
        String year = "" + dob.charAt(0) + dob.charAt(1) + dob.charAt(2) + dob.charAt(3);
        String temp_dob = day + "-" + month + "-" + year;

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("update seller set s_name=?, s_password=?, s_address=?, s_gender=?, s_number=?, s_email=?, s_dob=? where s_id=" + s_id);
        pst.setString(1, name);
        pst.setString(2, password);
        pst.setString(3, address);
        pst.setString(4, gender);
        pst.setString(5, phone_number);
        pst.setString(6, email);
        pst.setString(7, temp_dob);
        pst.executeUpdate();
%>

<script>
    alert("Seller updated successfully");
    window.location = "./manage_seller.jsp?a_id=<%=a_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Update Seller</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Update Seller</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from seller where s_id = ?");
                    pst.setString(1, s_id);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
                %>

                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                name="name"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct name"
                                placeholder="Enter name"
                                value="<%=rs.getString(2)%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input
                                type="email"
                                name="email"
                                placeholder="Enter email"
                                value="<%=rs.getString(7)%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input
                                type="password"
                                name="password"
                                placeholder="Enter password"
                                value="<%=rs.getString(3)%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input
                                type="text"
                                name="phone_number"
                                pattern="[6789][0-9]{9}"
                                title="Enter correct phone number"
                                placeholder="Enter phone number"
                                value="<%=rs.getString(6)%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Date of Birth</span>
                            <input
                                type="date"
                                name="dob"

                                <%
                                    String dob = rs.getString(8);
                                    String day = "" + dob.charAt(0) + dob.charAt(1);
                                    String month = "" + dob.charAt(3) + dob.charAt(4);
                                    String year = "" + dob.charAt(6) + dob.charAt(7) + dob.charAt(8) + dob.charAt(9);
                                    String temp_dob = year + "-" + month + "-" + day;

                                %>

                                value="<%=temp_dob%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input
                                type="text"
                                name="address"
                                placeholder="Enter address"
                                value="<%=rs.getString(4)%>"
                                required
                                />
                        </div>
                    </div>
                    <div class="gender-details">

                        <%
                            if (rs.getString(5).equals("Male")) {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" checked />
                        <input type="radio" name="gender" value="Female" id="dot-2" />
                        <input type="radio" name="gender" value="Other" id="dot-3" />
                        <%
                        } else if (rs.getString(5).equals("Female")) {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" />
                        <input type="radio" name="gender" value="Female" id="dot-2" checked />
                        <input type="radio" name="gender" value="Other" id="dot-3" />
                        <%
                        } else {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" />
                        <input type="radio" name="gender" value="Female" id="dot-2" />
                        <input type="radio" name="gender" value="Other" id="dot-3" checked />
                        <%
                            }
                        %>

                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
                            <label for="dot-3">
                                <span class="dot three"></span>
                                <span class="gender">Other</span>
                            </label>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" name="submit" value="Update" />
                    </div>
                </form>

                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
