/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-04-14 01:51:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"zh-CN\">\r\n");
      out.write("  <head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"keys\" content=\"\">\r\n");
      out.write("    <meta name=\"author\" content=\"\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/font-awesome.min.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/login.css\">\r\n");
      out.write("\t<style>\r\n");
      out.write("\r\n");
      out.write("\t</style>\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\r\n");
      out.write("      <div class=\"container\">\r\n");
      out.write("        <div class=\"navbar-header\">\r\n");
      out.write("          <div><a class=\"navbar-brand\" href=\"index.html\" style=\"font-size:32px;\">管理平台</a></div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("      <h1 style=\"color:red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.errorMsg}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</h1>\r\n");
      out.write("      <form id=\"loginForm\" action=\"doLogin\" method=\"post\" class=\"form-signin\" role=\"form\">\r\n");
      out.write("        <h2 class=\"form-signin-heading\"><i class=\"glyphicon glyphicon-user\"></i> 用户登录</h2>\r\n");
      out.write("\t\t  <div class=\"form-group has-success has-feedback\">\r\n");
      out.write("\t\t\t<input type=\"text\" class=\"form-control\" id=\"username\" name=\"username\" placeholder=\"请输入登录账号\" autofocus>\r\n");
      out.write("\t\t\t<span class=\"glyphicon glyphicon-user form-control-feedback\"></span>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"form-group has-success has-feedback\">\r\n");
      out.write("\t\t\t<input type=\"text\" class=\"form-control\" id=\"password\" name=\"password\" placeholder=\"请输入登录密码\" style=\"margin-top:10px;\">\r\n");
      out.write("\t\t\t<span class=\"glyphicon glyphicon-lock form-control-feedback\"></span>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"input-group\">\r\n");
      out.write("\t\t\t<input type=\"text\" class=\"form-control\" placeholder=\"请输入验证码\" id=\"vCode\">\r\n");
      out.write("\t\t\t\t\t<span class=\"input-group-btn\">\r\n");
      out.write("\t\t\t\t\t\t<button class=\"btn btn-default\" type=\"button\" onclick=\"chageCode()\" >\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${APP_PATH}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/getGifCode\" id=\"codeImage\" height=\"30px\"/>\r\n");
      out.write("\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("        <div class=\"checkbox\">\r\n");
      out.write("          <label>\r\n");
      out.write("            <input type=\"checkbox\" value=\"remember-me\"> 记住我\r\n");
      out.write("          </label>\r\n");
      out.write("          <br>\r\n");
      out.write("          <label>\r\n");
      out.write("            忘记密码\r\n");
      out.write("          </label>\r\n");
      out.write("          <label style=\"float:right\">\r\n");
      out.write("            <a href=\"reg.html\">我要注册</a>\r\n");
      out.write("          </label>\r\n");
      out.write("        </div>\r\n");
      out.write("        <a class=\"btn btn-lg btn-success btn-block\" onclick=\"dologin()\" > 登录</a>\r\n");
      out.write("      </form>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script src=\"jquery/jquery-2.1.1.min.js\"></script>\r\n");
      out.write("    <script src=\"bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"layer/layer.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("    function chageCode(){\r\n");
      out.write("        $('#codeImage').attr('src','");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${APP_PATH}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/getGifCode?abc='+Math.random());//链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。\r\n");
      out.write("    };\r\n");
      out.write("    function dologin() {\r\n");
      out.write("        // 非空校验\r\n");
      out.write("        var username = $(\"#username\").val();\r\n");
      out.write("        // 表单元素的value取值不会为null, 取值是空字符串\r\n");
      out.write("        if ( username == \"\" ) {\r\n");
      out.write("        \t//alert(\"用户登录账号不能为空，请输入\");\r\n");
      out.write("            layer.msg(\"用户登录账号不能为空，请输入\", {time:2000, icon:5, shift:6}, function(){ });\r\n");
      out.write("        \treturn;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        var password = $(\"#password\").val();\r\n");
      out.write("        if ( password == \"\" ) {\r\n");
      out.write("        \t//alert(\"用户登录密码不能为空，请输入\");\r\n");
      out.write("            layer.msg(\"用户登录密码不能为空，请输入\", {time:2000, icon:5, shift:6}, function(){ });\r\n");
      out.write("        \treturn;\r\n");
      out.write("        }\r\n");
      out.write("        var vCode = $(\"#vCode\").val();\r\n");
      out.write("        if ( vCode == \"\" ) {\r\n");
      out.write("        \t//alert(\"用户登录密码不能为空，请输入\");\r\n");
      out.write("            layer.msg(\"验证码不能为空，请输入\", {time:2000, icon:5, shift:6}, function(){ });\r\n");
      out.write("        \treturn;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        // 使用AJAX提交数据\r\n");
      out.write("        var loadingIndex = null;\r\n");
      out.write("        console.log(username)\r\n");
      out.write("        $.ajax({\r\n");
      out.write("        \ttype : \"POST\",\r\n");
      out.write("        \turl  : \"doAJAXLogin\",\r\n");
      out.write("        \tdata : {\r\n");
      out.write("        \t\t\"username\":username,\r\n");
      out.write("        \t\t\"password\":password,\r\n");
      out.write("        \t\t\"vCode\" : vCode\r\n");
      out.write("        \t},\r\n");
      out.write("        \tbeforeSend : function(){\r\n");
      out.write("        \t\tloadingIndex = layer.msg('处理中', {icon: 16});\r\n");
      out.write("        \t},\r\n");
      out.write("        \tsuccess : function(result) {\r\n");
      out.write("        \t\tconsole.log(result)\r\n");
      out.write("        \t\tlayer.close(loadingIndex);\r\n");
      out.write("        \t\tresult = JSON.parse(result);\r\n");
      out.write("        \t\tif (result.flag) {\r\n");
      out.write("        \t\t\twindow.location.href = \"index\";\r\n");
      out.write("        \t\t} else {\r\n");
      out.write("        \t\t\tchageCode();\r\n");
      out.write("                    layer.msg(result.msg, {time:2000, icon:5, shift:6}, function(){});\r\n");
      out.write("        \t\t}\r\n");
      out.write("        \t}\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    </script>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
