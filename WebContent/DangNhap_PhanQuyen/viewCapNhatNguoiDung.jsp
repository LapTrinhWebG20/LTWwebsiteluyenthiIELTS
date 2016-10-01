<%@page import="java.sql.ResultSet"%>
<%@page import="model.DataProvider"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.NguoiDungModel, pojo.NguoiDung, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Lấy thông tin bên trang DanhSachNguoiDung
    Object ten_nd = session.getAttribute("_username");
    String username = ten_nd.toString();
   
    String MESSAGE = "";
    int mand;
    String user = "";
    String pass = "";
    String hoten = "";
    String email = "";
    String gioitinh = "";
    
    //Xử lý khi button Cập Nhật
    if(request.getParameter("btnUpdate")!=null)
    {      
        try
        {
            boolean kq = false;
            NguoiDung nd = new NguoiDung();            
           
            //Lấy dữ liệu từ form Cập nhật
            mand = Integer.parseInt(request.getParameter("txtMa"));
            user = request.getParameter("txtUser");
            pass = request.getParameter("txtPass");
            hoten = request.getParameter("txtTen");
            email = request.getParameter("txtEmailNd");
            gioitinh = request.getParameter("cbxPhai");
 
                    nd.setMaNguoiDung(mand);
                    nd.setUsername(user);
                    nd.setPassword(pass);
                    nd.setHoTen(hoten);
                    nd.setEmail(email);
                    nd.setGioiTinh(gioitinh);

                    kq = NguoiDungModel.capNhatNguoiDung(nd); 
                    if(kq==true)
                    {
                        MESSAGE = "<h3 style='color:blue'><b style='color:red'>* </b>Cập nhật thông tin tài khoản thành công</h3>";             
                    }
                    else
                    {
                        MESSAGE = "Cập nhật không thành công";  
                    }
        }
        
        catch (SQLException ex)
        {
            MESSAGE = ex.getMessage();
        }
    }
%>

<form name='formNguoiDungCapNhat' method="post" margin-top="20px">
<fieldset style='width:500px; font-size: 18px'>
<legend style='color:blue;'>CẬP NHẬT THÔNG TIN</legend>
<table width="300px" height="250px" border="0">
        
        <%//Khởi tạo danh sách chi tiết người dùng, in ra người dùng đã lấy username
            ArrayList<NguoiDung> arr = NguoiDungModel.chiTietNguoiDung(username);
            for (NguoiDung n : arr)
            {
            %>
            
        <tr>
            <td align="right">
                Username: &nbsp;
            </td>
            <td>              
                <input type='hidden' name='txtMa' value="<%= n.getMaNguoiDung() %>" />
                <input type='text' name='txtUser' value="<%= n.getUsername() %>" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Password: &nbsp;
            </td>
            <td>
                <input type="password" name="txtPass"/>
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Họ tên: &nbsp;
            </td>
            <td>
                <input type="text" name="txtTen" value="<%= n.getHoten() %>" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Email: &nbsp;
            </td>
            <td>
                <input type="text" name="txtEmailNd" value="<%= n.getEmail() %>" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Giới tính: &nbsp;
            </td>
            <td>
                <select name="cbxPhai" >
                    <option> Nam </option>
                    <option> Nữ </option>
                </select>
            </td>
        </tr>
                
        <tr>
            <td align="right">
                &nbsp;
            </td>
            <td>
                <input id="btn" type="submit" name="btnUpdate" value="Cập nhật" />
            </td>
        </tr>
            <%
            }
    %>
</table>
</fieldset>
</form>

        <br />
        <div>
            <%=MESSAGE%>
        </div>
        
        <a id="link1" href="index.jsp?f=QuanTri"> <b style="color:blue">* </b>Quay về Trang quản trị </a>