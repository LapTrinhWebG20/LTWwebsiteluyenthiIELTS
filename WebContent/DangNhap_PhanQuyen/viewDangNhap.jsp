
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.NguoiDungModel"%>
<%@page import="pojo.NguoiDung"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.ServletResponse"%>

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
