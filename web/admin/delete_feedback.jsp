<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String a_id = request.getParameter("a_id");
    String f_id = request.getParameter("f_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from feedback where f_id = ?");
    pst.setString(1, f_id);
    pst.executeUpdate();
%>

<script>
    alert("Feedback deleted successfully");
    window.location = "./manage_feedback.jsp?a_id=<%=a_id%>";
</script>
