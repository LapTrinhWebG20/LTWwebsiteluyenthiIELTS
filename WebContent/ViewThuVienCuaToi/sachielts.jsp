<%@page import="model.DataProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="css/luyentap.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
%>
    <div id="q">
         <form  method="get" action="/FileRead">
    		<table border="0">
	  		<tr>
			    <th id="file" style="color:lightseagreen">File Name</th>
  			    <th id="file" style="color:lightseagreen">File Type</th>
			    <th id="delete" style="color:lightseagreen">Action</th>
			    <th style="color:lightseagreen">View</th>
			</tr>
		<legend style="color:blue">SÁCH IELTS</legend>
<%
    String ma_nd=(String)request.getSession().getAttribute("_user");
  	String query = "select doc_id, filename,tenfile from document where madulieu=11114 and MaNguoiDung='"+ma_nd+"'";
  	ResultSet rs = DataProvider.getResultFromSqlQuery(query);
	int count =0;
	while(rs.next())
	{
		out.println("<tr>"
		        + "<td>"+rs.getString(2)+"</td>"
		        + "<td>"+rs.getString(3)+"</td>"
		        + "<td>"
		        +   "<a href='ViewThuVienCuaToi/deletesach.jsp?doc_id="+rs.getInt(1) +"'> Delete </a>"
		        + "</td>"
		        +"<td>"
		        + "<a target='_blank' href='FileRead?doc_id="+rs.getInt(1)+"'>View</a>"
		        + "</td>"
		        + "</tr>");
		 count++;
	}
	rs.close();
	DataProvider.CloseConnection();
	if(count==0)
	{
	    out.println("<tr><td colspan='4'> Bạn chưa tải lên tài liệu..!! </td></tr>");
	}
%>   
			</table>
         </form>
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

     <div>
        <h3><span class="label label-success">Bạn cần đăng nhập để sử dụng các chức năng của Website !!!</span> </h3>
        <div style='font-size: 18px'>
            <form name='formDangNhap' action='index.jsp?f=XuLyDangNhap' method='post' onsubmit="return KiemTraDangNhap();">
              <fieldset style='width:500px; align:center; font-size: 18px'>
              <legend style='color:#39F; font-size: 12px; '></legend>
              <table height='180px'>
                  
                  <tr>
                      <td align="right" >
                          &nbsp; Tài khoản:
                      </td>
                      <td style="text-align: left">
                          <input type="text" name="username">
                      </td>
                    
                  </tr>
                  
                    <tr>
                      <td align="right" >
                          &nbsp; Mật khẩu: 
                      </td>
                      <td style="text-align: left">
                          <input type="password" name="password">
                      </td>
                    </tr>
                  
                  <tr>
                      <td align="right">
                          &nbsp;
                      </td>
                      <td style="text-align: left">
                          <input id="btn" type="submit" name="btnDangNhap" value="Đăng nhập">
                      </td>
                  </tr>
                  
                  <tr>
                      <td align="right">
                          &nbsp;
                      </td>
                      <td>
                          <a class="btn btn-link" id='link1' href='index.jsp?f=DangKy'><b style="color:blue"></b>Đăng ký nếu chưa có tài khoản</a></div>
                      </td>
                  </tr>
                  
              </table>
             
              
              </fieldset>
          </form>   
      </div>         
    </div>
        <%}
       %>          
    </body>
</html>