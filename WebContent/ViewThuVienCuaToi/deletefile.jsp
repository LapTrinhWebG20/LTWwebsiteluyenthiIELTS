<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.DataProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <body>
           <%
                String doc_id = request.getParameter("doc_id");     
                String query = "delete from document where doc_id = " + doc_id;
                
                
          		Connection con = DataProvider.getConnection();
                PreparedStatement pr =  con.prepareStatement(query);//Thực hiện xóa
                if(pr.executeUpdate() == 1)//Nếu thực hiện truy vấn thành công
                {
                    response.sendRedirect("../index.jsp?f=TuVung");//Trả về trang từ vựng
                }
                
                
             %>
            
    </body>
</html>
