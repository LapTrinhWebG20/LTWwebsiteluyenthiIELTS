
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DataProvider"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.NguoiDungModel, pojo.NguoiDung, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
	//Lấy session người dùng
    Object ten_nd = session.getAttribute("_user");
    String _username = ten_nd.toString();
%>

<br/>
<fieldset style='width:500px; font-size: 18px'>
<legend style='color:blue';>THÔNG TIN TÀI KHOẢN</legend>
<table width="300px" height="200px" border="0">
        
        <%//In ra thông tin chi tiết người dùng
            ArrayList<NguoiDung> arr = NguoiDungModel.chiTietNguoiDung(_username);
            for (NguoiDung n : arr)
            {               
            %>
                <tr>
                    <td style="color:blue">Username: </td>
                    <td><%= n.getUsername()%></td>
                </tr>  

                <tr>
                    <td style="color:blue">Họ tên: </td>
                    <td><%= n.getHoten()%></td>
                </tr>    

                <tr>
                    <td style="color:blue">Email: </td>
                    <td><%= n.getEmail()%></td>
                </tr> 

                <tr>
                    <td style="color:blue">Giới tính: </td>
                    <td><%= n.getGioiTinh()%></td>
                </tr>    
            <%
            }
    %>
</table>
</fieldset>
<br />
<div>
    <a href="index.jsp?f=NguoiDungCapNhat" id="link1">Chỉnh sửa thông tin </a>  | 
    <a href="index.jsp?f=TrangChu" id="link1">Quay về Trang chủ </a>
</div>