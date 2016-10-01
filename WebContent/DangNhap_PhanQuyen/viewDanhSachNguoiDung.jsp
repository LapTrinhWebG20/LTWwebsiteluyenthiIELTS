<%@page import="java.sql.SQLException"%>
<%@page import="model.NguoiDungModel"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="pojo.NguoiDung"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 </br>
        	<legend style="color:blue">DANH SÁCH NGƯỜI DÙNG</legend>

<%
%>

<table width="730px" height="46px" border="0">
  
    <tr bgcolor="grey" height="43px">
        <td> <b>STT</td> <td>&nbsp;<b>Mã người dùng</td> <td>&nbsp;<b>Họ tên</td> <td>&nbsp;<b>Email</td> <td>&nbsp;<b>Giới tính</td>        
        <%
            ArrayList<NguoiDung> arr = NguoiDungModel.layDanhSachNguoiDung();
            int i = 0;
            for (NguoiDung n : arr) {
                i++;
               
        %>
    </tr>
    <tr bgcolor="#CCFFFF" height="27px" >
        <td><%= i%></td>
        <td><%= n.getMaNguoiDung()%> </td>
        <td><%= n.getHoten()%></td>
        <td><%= n.getEmail()%></td>
        <td><%= n.getGioiTinh()%></td>
    </tr>
    <%
        }
    %>
</table>

<div>
    <br/>
</div>
    
    <div>
        <a id="link1" href="index.jsp?f=QuanTri"><b style="color:blue">* </b>Quay về Trang quản trị</a>
    </div>