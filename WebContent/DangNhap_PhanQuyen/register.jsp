
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DataProvider"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.NguoiDungModel, pojo.NguoiDung, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script language="JavaScript">
    function kiemTraDangKy(){
        username=document.formDangKy.txtUsername;
        password=document.formDangKy.txtPassword;        
        hoten=document.formDangKy.txtHoTen;
        gioitinh=document.formDangKy.cbxGioiTinh;
        email=document.formDangKy.txtEmail;
        
        reg1=/^[0-9A-Za-z]+[0-9A-Za-z_]*@[\w\d.]+.\w{2,4}$/;
        testmail=reg1.test(email.value);
        
        if(username.value==""){
            alert("Bạn chưa nhập Username");
            username.focus();
            return false;
        }
        if(password.value==""){
            alert("Bạn chưa nhập mật khẩu");
            password.focus();
            return false;
        }
        if(password.value.length < 6){
            alert("Mật khẩu phải lớn hơn 6 kí tự");
            password.focus();
            return false;
        }
        if(hoten.value==""){
            alert("Bạn chưa nhập họ tên");
            hoten.focus();
            return false;
        }
        if(!testmail){
            alert("Địa chỉ email không hợp lệ");
            email.focus();
            return false;
        }
        
        return true;
    }
</script>

<%
    String MESSAGE = "";
    String user = "";
    String pass = "";
    String hoten = "";
    String email = "";
    String gioitinh = "";
    
    if(request.getParameter("btnDangKy")!=null)
    {       
        try
        {
            boolean kq = false;
            //Khởi tạo 1 người dùng mới
            NguoiDung nd = new NguoiDung();    
			//Lấy những thông tin người dùng nhập vào
            user = request.getParameter("txtUsername");
            pass = request.getParameter("txtPassword");
            hoten = request.getParameter("txtHoTen");
            email = request.getParameter("txtEmail");
            gioitinh = request.getParameter("cbxGioiTinh");

            DataProvider pro = new DataProvider();
            pro.Open();
            
            //Kiểm tra tài khoản đã có người sử dụng hay chưa
            String sql = "select * from nguoidung where username = '"+user+"'";
            ResultSet rs = pro.executeQuery(sql);

            if(rs.next())
            {
                MESSAGE = "<h3 style='color:blue'><b style='color:red'>* </b>Username đã có người sử dụng, vui lòng chọn tên khác !!!</h3>";
            }
            else
            {
                nd.setUsername(user);
                nd.setPassword(pass);
                nd.setHoTen(hoten);
                nd.setEmail(email);
                nd.setGioiTinh(gioitinh);
    
                //Gọi phương thức để thêm người dùng
                kq = NguoiDungModel.themNguoiDung(nd); 
                if(kq==true)
                {
                    MESSAGE = "<h3 style='color:blue'><b style='color:red'>* </b> Đăng ký thành công, bạn có thể <a id='link1' href='index.jsp?f=DangNhap'>Đăng nhập</a> vào website ngay bây giờ</h3>";
                }
                else
                {
                    MESSAGE = "<h3 style='color:blue'><b style='color:red'>* </b> Đăng ký không thành công </h3>";  
                }  
            }
        }
        
        catch (SQLException ex)
        {
            MESSAGE = ex.getMessage();
        }
    }
%>
<form name='formDangKy' method="post" onsubmit="return kiemTraDangKy();" margin-top="20px">
    </br>
    <fieldset style='width:500px; align:center; font-size: 18px'>
    <legend style='color:#39F; font-size: 20px; '>ĐĂNG KÝ TÀI KHOẢN</legend>
    <table height="250px" >
       <br/>
        <tr>
            <td align="right">
                Username: &nbsp;
            </td>
            <td>
                <input type="text" name="txtUsername" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Password: &nbsp;
            </td>
            <td>
                <input type="password" name="txtPassword" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Họ tên: &nbsp;
            </td>
            <td>
                <input type="text" name="txtHoTen"/>
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Email: &nbsp;
            </td>
            <td>
                <input type="text" name="txtEmail" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                Giới tính: &nbsp;
            </td>
            <td>
                <select name="cbxGioiTinh" >
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
                <input id="btn" type="submit" name="btnDangKy" value="Đăng ký" />
            </td>
        </tr>
        
    </table>   
    </fieldset>
</form>

        <div>
            <%=MESSAGE%>
        </div>