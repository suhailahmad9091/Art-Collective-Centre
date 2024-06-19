<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String s_id = request.getParameter("s_id");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Painting</title>
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
                    <i style="color: red"
                       class="fa fa-user"
                       aria-hidden="true"
                       ></i>
                    &nbsp; Seller</a
                >
            </li>
        </li>
        <li class="l1"><a href="./profile.jsp?s_id=<%=s_id%>">Profile</a></li>
        <li class="l1"><a href="./painting.jsp?s_id=<%=s_id%>">Painting</a></li>
        <li class="l1"><a href="./feedback.jsp?s_id=<%=s_id%>">Feedback</a></li>
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
        <h1 style="color: red; font-weight: bold">Feedback</h1>
        <br />
        <a style="padding: 5px 20px" class="btn btn-success" href="./add_painting.jsp?s_id=<%=s_id%>"
           >Add Painting</a
        >
        <br />
        <br />
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>S. No.</th>
                    <th>Image</th>
                    <th>Category</th>
                    <th>Name</th>
                    <th>Size</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <%
                    int sno = 1;
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from painting where s_id = " + s_id);
                    ResultSet rs = pst.executeQuery();

                    while (rs.next()) {
                %>        

                <tr>
                    <th scope="row"><%=sno%></th>
                    <td><image style="width: 300px; height: 300px" src="../images/<%=rs.getString(7)%>" alt="/Painting"></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td>
                        <a href="./update_painting.jsp?p_id=<%=rs.getString(1)%>&s_id=<%=s_id%>"
                           ><i class="fa fa-edit" aria-hidden="true"></i
                            ></a>
                        &nbsp;
                        <a href="./delete_painting.jsp?p_id=<%=rs.getString(1)%>&s_id=<%=s_id%>"
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
