<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DataProvider"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/luyentap.css" rel="stylesheet" type="text/css">
<title>Trang chủ</title>
</head>
<body>

        	</br>
        	<div id="contener">
        	<legend style="color:blue">Reading</legend>
                <div id="q">
                <%
		     		String ma_nd=(String)request.getSession().getAttribute("_user");
		     		String query="select lesson from dethi where manguoidung='"+ma_nd+"' group by lesson";
		     		
		     		ResultSet rs=DataProvider.getResultFromSqlQuery(query);
		     		int count=0;
		     		while (rs.next())
		     		{
		     			count++;
		     			out.print("<ul><li>");
		     			out.println("<a href='index.jsp?lesson="+rs.getString(1)+"'>Lesson "+rs.getString(1)+"  </a>&nbsp;&nbsp;&nbsp;&nbsp;");
		     			String sql="select status from done where lesson='"+rs.getString(1)+"'";
		     			ResultSet rs1=DataProvider.getResultFromSqlQuery(sql);
		     			if(rs1.next())
		     			{
		     				String status="0";
		     				status=rs1.getString(1);
		     				if (status.equals("1"))
		     						out.print("<td>Đã hoàn thành!...</td>");
		     				else
		     					out.print("<td>Chưa hoàn thành!...</td>");
		     			}
		     			out.println("</li></ul>");
		     			out.println("</br>");
	
		     		}
		     		 if(count==0)
		     		 {
		     		    out.println("<tr><td colspan='4'> Bạn chưa tải bài tập lên..!! </td></tr>");
		     		 }

     			%>
                </div>
        </div>
    </div>
</body>
</html>