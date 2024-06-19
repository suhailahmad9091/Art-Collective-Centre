<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String s_id = request.getParameter("s_id");
    String p_id = request.getParameter("p_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String height = request.getParameter("height");
        String width = request.getParameter("width");
        String price = request.getParameter("price");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("update painting set p_name=?, p_size=?, p_price=? where p_id=" + p_id);
        pst.setString(1, name);
        pst.setString(2, height + "x" + width);
        pst.setString(3, price);
        pst.executeUpdate();
%>

<script>
    alert("Painting updated successfully");
    window.location = "./painting.jsp?s_id=<%=s_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Update Painting</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Update Painting</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from painting where p_id = ?");
                    pst.setString(1, p_id);
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
                                value="<%=rs.getString(4)%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Price</span>
                            <input
                                type="number"
                                name="price"
                                min="0"
                                placeholder="Enter price"
                                value="<%=rs.getString(6)%>"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Size</span>
                            <input
                                type="number"
                                name="height"
                                min="0"

                                <%
                                    String size = rs.getString(5);
                                    String height = "", width = "";
                                    int i = 0;
                                    while(size.charAt(i) != 'x') {
                                        height += size.charAt(i);
                                        i++;
                                    }
                                    width = size.substring(i+1);
                                %>

                                value="<%=height%>"
                                placeholder="Enter height"
                                required
                                />
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            X
                            <input
                                type="number"
                                name="width"
                                min="0"
                                placeholder="Enter width"
                                value="<%=width%>"
                                required
                                />
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
