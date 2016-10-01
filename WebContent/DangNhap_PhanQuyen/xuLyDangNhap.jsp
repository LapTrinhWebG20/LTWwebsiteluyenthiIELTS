<%@page import="java.sql.ResultSet"%>
<%@page import="model.DataProvider"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.NguoiDungModel, pojo.NguoiDung, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String MESSAGE="";
    String user="";
    String pass="";
   
    try
    {
    	//Lấy giá trị gửi về từ form đăng nhập
        user=request.getParameter("username");
        pass=request.getParameter("password"); 
        DataProvider pro = new DataProvider();
        pro.Open();
        //Kiểm tra tài khoản hợp lệ
        String sql = "SELECT * FROM nguoidung WHERE username='"+user+"' AND password='"+pass+"'";
        ResultSet rs = pro.executeQuery(sql);
        //Nếu đúng tài khoản thì thông báo đăng nhập thành công và đưa link về Trang Chủ
        if(rs.next())
        {
            session.setAttribute("_user", user);
            session.setAttribute("_islogin", true);
            MESSAGE = "<h3 style='color:blue'><b style='color:red'>* </b> Đăng nhập thành công, click <a id='link1' href='index.jsp?f=TrangChu'>tại đây</a> để trở về Trang chủ</h3>";
        }
        //Nếu sai thì thông báo tài khoản hoặc mật khẩu không đúng, đưa link đăng nhập lại
        else
        {
            MESSAGE = "<h3 style='color:blue'><b style='color:red'>* </b> Tài khoản hoặc mật khẩu không đúng! <a id='link1' href='index.jsp?f=DangNhap'>Thử lại</a></h3>";
    
        }
    }
    catch (SQLException ex)
    {
            MESSAGE = ex.getMessage();
    }
%>

<div>
     <%= MESSAGE %>
</div>
   