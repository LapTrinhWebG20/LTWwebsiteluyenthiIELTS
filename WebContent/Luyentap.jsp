<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Trang luyện tập</title>
<link href="css/luyentap.css" rel="stylesheet" type="text/css">
</head>
<body>
<%    //Lấy session người dùng đăng nhập
        Object ten_nd = session.getAttribute("_user");
        Object log = session.getAttribute("_islogin");
        boolean bLog = false;
        if(log!=null)
        {
            bLog = true;
        }
        //Nếu nhấn nút đăng xuất thì xóa session người dùng đăng nhập
        if(request.getParameter("btnThoat") != null)
        {
            session.removeAttribute("_user");
            session.removeAttribute("_islogin");         
            session.invalidate();
     
        }
        
        if (bLog==true)
        {
%>
	<div id="contener">
	</br>
        	<legend style="color:blue">LUYỆN TẬP</legend>
        	<ul>
        		<li><a href="index.jsp?f=PracticeDesiredSection">PracticeDesiredSection</a></li>
                <li><a href="index.jsp?f=PracticeFullTest">PracticeFullTest</a></li>
        	</ul>
        	</div>
                 <%}
        else
        {%>
        	<script language="JavaScript">
    function KiemTraDangNhap()
    {
        
            if(document.formDangNhap.username.value == "")
            {
                alert("Vui lòng nhập Username");
                document.formDangNhap.username.focus();
                return false;
            }
            
            if(document.formDangNhap.password.value == "")
            {
                alert("Vui lòng nhập Password");
                document.formDangNhap.password.focus();
                return false;
            }
            
            return true;
        
    }
</script>

    <%@include  file="yeucaudangnhap.html" %>
        	
        	
        <%}
       %>
</body>
</html>