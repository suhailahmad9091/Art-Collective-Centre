<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String a_id = request.getParameter("a_id");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Manage Feedback</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="../css/navbar.css" />
    </head>
    <body>
        <ul>
            <li class="l1">
                <a style="pointer-events: none; color: red">
                    <i
                        style="color: red"
                        class="fa fa-user"
                        aria-hidden="true"
                        ></i>
                    &nbsp; Admin</a
                >
            </li>
            <li class="l1"><a href="./manage_buyer.jsp?a_id=<%=a_id%>">Manage Buyer</a></li>
            <li class="l1"><a href="./manage_seller.jsp?a_id=<%=a_id%>">Manage Seller</a></li>
            <li class="l1"><a href="./manage_painting.jsp?a_id=<%=a_id%>">Manage Painting</a></li>
            <li class="l1"><a href="./manage_feedback.jsp?a_id=<%=a_id%>">Manage Feedback</a></li>
            <li class="l2" style="float: right">
                <a href="../index.jsp"
                   >Logout &nbsp;
                    <i
                        style="color: red"
                        class="fa fa-sign-out"
                        aria-hidden="true"
                        ></i
                    ></a>
            </li>
        </ul>

        <div class="container">
            <h1 style="color: red; font-weight: bold">Manage Feedback</h1>
            <br />
            
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>S. No.</th>
                        <th>Seller Name</th>
                        <th>Buyer Name</th>
                        <th>Feedback Date</th>
                        <th>Feedback Text</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        int sno = 1;
                        Connection con = ConnectionProvider.getCon();
                        PreparedStatement pst = con.prepareStatement("select f_id, s_name, b_name, f_date, f_text from feedback f, buyer b, seller s where b.b_id = f.b_id and s.s_id = f.s_id;");
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                    %>        

                    <tr>
                        <th scope="row"><%=sno%></th>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td>
                            <a href="./delete_feedback.jsp?f_id=<%=rs.getString(1)%>&a_id=<%=a_id%>"
                               ><i
                                    style="color: red"
                                    class="fa fa-trash fa-delete"
                                    aria-hidden="true"
                                    ></i>
                            </a>
                        </td>
                    </tr>

                    <%
                            sno++;
                        }
                    %>

                </tbody>
            </table>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
