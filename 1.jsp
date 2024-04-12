<%--
    Document : newjsp
    Created on : Mar 26, 2024, 1:44:32 PM
    Author : Administrator
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/test1");
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("select * from products");
       %>
        <table border="2" style="border-collapse: collapse">
            <tr><th>Product_id</th><th>Name</th><th>Category</th><th>Price</th><th>Quantity</th></tr>
                 <% while(rs.next()){%>
            <tr><td><% out.println(rs.getInt(1));%></td>
             <td><% out.println(rs.getString(2));%></td>
              <td><% out.println(rs.getString(3));%></td>
                <td><% out.println(rs.getDouble(4));%></td>
                <td><% out.println(rs.getInt(5));%></td>
            </tr>
            <%}
             %>
        </table><br><br>
        <%
            ResultSet res=st.executeQuery("select * from products");
           int totalproducts=0;
           while(res.next()){
               totalproducts++;
           } %>
           <%
                 ResultSet r=st.executeQuery("select * from products");
            int totalproduct=0,averageProductValue=0,totalRev=0;
            while (r.next()) {
            int quantity = r.getInt("quantity");
            double price = r.getDouble("price");
            totalRev+= quantity * price;
            totalproduct++;
        }
        if (totalproduct > 0) {
            averageProductValue =totalRev / totalproduct;
        }
            %>
        <table border="2" style="border-collapse: collapse">
              <tr><th>Product_id</th><th>Total Revenue</th><th>Average Revenue</th></tr>
              <tr><td> <%= totalproduct %></td><td><%= totalRev %></td><td><%= averageProductValue %></td></tr>
        </table>
           </body>
</html>
