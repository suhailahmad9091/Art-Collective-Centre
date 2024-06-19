<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String a_id = request.getParameter("a_id");
    String b_id = request.getParameter("b_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from buyer where b_id = ?");
    pst.setString(1, b_id);
    pst.executeUpdate();
%>

<script>
    alert("Buyer deleted successfully");
    window.location = "./manage_buyer.jsp?a_id=<%=a_id%>";
</script>
