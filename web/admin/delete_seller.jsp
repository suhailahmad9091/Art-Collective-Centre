<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String a_id = request.getParameter("a_id");
    String s_id = request.getParameter("s_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from seller where s_id = ?");
    pst.setString(1, s_id);
    pst.executeUpdate();
%>

<script>
    alert("Seller deleted successfully");
    window.location = "./manage_seller.jsp?a_id=<%=a_id%>";
</script>
