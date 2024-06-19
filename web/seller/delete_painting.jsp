<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String p_id = request.getParameter("p_id");
    String s_id = request.getParameter("s_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from painting where p_id = ?");
    pst.setString(1, p_id);
    pst.executeUpdate();
%>

<script>
    alert("Painting deleted successfully");
    window.location = "./painting.jsp?s_id=<%=s_id%>";
</script>
