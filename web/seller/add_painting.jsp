<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String s_id = request.getParameter("s_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String category = request.getParameter("category");
        String name = request.getParameter("name");
        String height = request.getParameter("height");
        String width = request.getParameter("width");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        
        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("insert into painting(s_id, p_category, p_name, p_size, p_price, p_image) values(?,?,?,?,?,?)");
        pst.setString(1, s_id);
        pst.setString(2, category);
        pst.setString(3, name);
        pst.setString(4, height + "x" + width);
        pst.setString(5, price);
        pst.setString(6, image);
        pst.executeUpdate();
%>

<script>
    alert("Painting added successfully");
    window.location = "./painting.jsp?s_id=<%=s_id%>";
</script>

<%
    }
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Add Painting</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Add Painting</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">

                        <div class="input-box">
                            <span class="details">Category</span>
                            <select name="category" id="category" required>
                                <option value="Abstract Art">Abstract Art</option>
                                <option value="Landscape Art">Landscape Art</option>
                                <option value="Portrait Art">Portrait Art</option>
                                <option value="Still Life">Still Life</option>
                                <option value="Modern Art">Modern Art</option>
                                <option value="Impressionism">Impressionism</option>
                                <option value="Surrealism">Surrealism</option>
                                <option value="Minimalism">Minimalism</option>
                                <option value="Pop Art">Pop Art</option>
                                <option value="Classical Art">Classical Art</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                name="name"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct name"
                                placeholder="Enter name"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Size</span>
                            <input
                                type="number"
                                name="height"
                                min="0"
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
                                required
                                />
                        </div>
                    </div>
                    <div class="input-box">
                        <span class="details">Choose Image</span>
                        <input
                            type="file"
                            name="image"
                            accept="image/*"
                            required
                            />
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Add" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
