<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/luyentap.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Trang luyện tập</title>
</head>
<body>
<%    
        Object ten_nd = session.getAttribute("_user");
        Object log = session.getAttribute("_islogin");
        boolean bLog = false;
        if(log!=null)
        {
            bLog = true;
        }
        
        if(request.getParameter("btnThoat") != null)
        {
            session.removeAttribute("_user");
            session.removeAttribute("_islogin");         
            session.invalidate();
     
        }
        
        if (bLog==true)
        {
%></br>
<div id="contener">
        	<legend style="color:blue">PRACTICE DESIRED SECTION</legend>
        	<ul>
                    	<li><a href="index.jsp?f=Reading">Reading</a></li>
                        <li><a href="index.jsp?f=Writing">Writing</a></li>
                        <li><a href="index.jsp?f=Listening">Listening</a></li>
                        <li><a href="index.jsp?f=Speaking">Speaking</a></li>
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
 
                    
                   