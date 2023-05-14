<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="logo/Logo.ico"/>
</head>
    <header>
        <jsp:include page="sezioni/header.jsp"/>
    </header>
    <body>
    <div class="container">

        <h1><%= "HOME" %></h1>
        <br/>
        <a href="hello-servlet">Hello Servlet</a>
        <br><br><br>
        <a href="./file/volantinotum4world.pdf" download class="button">Download Volantino</a>
    </div>
    </body>


    <jsp:include page="sezioni/footer.jsp"/>

</html>