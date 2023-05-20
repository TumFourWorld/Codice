<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 11/05/2023
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../css/header.css" rel="stylesheet" type="text/css">


<%
    // prendo URL
    String url = request.getRequestURI();

    // estraggo ultima parte di url con .jsp
    String currentPage = url.substring(url.lastIndexOf("/") + 1);
%>

<%--
<a href="index.jsp" class="<%= currentPage.equals("index.jsp") ? "active" : "" %>">HOME</a>
<a href="info.jsp" class="<%= currentPage.equals("info.jsp") ? "active" : "" %>">CHI SIAMO</a>
<a href="contatti.jsp" class="<%= currentPage.equals("contatti.jsp") ? "active" : "" %>">CONTATTI</a>
<a href="attivita.jsp" class="<%= currentPage.equals("attivita.jsp") || currentPage.equals("attivita_spec.jsp") ? "active" : "" %>">ATTIVITÀ</a>
<a href="registrazione.jsp" class="<%= currentPage.equals("registrazione.jsp") ? "active" : "" %>">SIGN-UP</a>
<a href="login.jsp" class="<%= currentPage.equals("login.jsp") ? "active" : "" %>">LOGIN</a>
--%>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<%@ page import="javax.servlet.http.HttpSession" %>


<header>
    <h1 class="textlogo">TUM<span>4</span>WORLD</h1>
    <nav>
        <ul class="nav__links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="info.jsp">Chi Siamo</a></li>
            <li><a href="contatti.jsp">Contatti</a></li>
            <li><a href="attivita.jsp">Attivitá</a></li>
            <li><a href="registrazione.jsp">Sign Up</a></li>
        </ul>
    </nav>
<% String ses = (String) session.getAttribute("username");
out.print(ses);
if(ses == null){
    out.print("<a class='cta' href='login.jsp'>Login</a>");
}else{
    out.print("<form method=\"GET\" action=\"logoutServlet\" >\n" +
            "        <button class=\"cta\" type=\"submit\">Logout</button>\n" +
            "    </form>");
}%>



</header>
