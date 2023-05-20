<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>TUM4WORLD</title>
  <link rel="icon" href="logo/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script.js"></script>

  <%
    String ses = (String) session.getAttribute("username");
    Boolean simp = (Boolean) session.getAttribute("simp");
    if(ses == null) {
      out.println("<script>wrongPage()</script>");
    } else if(!simp) {
      out.println("<script>wrongPage()</script>");
    }
  %>

</head>
<jsp:include page="sezioni/header.jsp"/>
<body>

<div class="content">
  <h2>Visualizza Utenti</h2>
  <input class="cta" type="button" value="Utenti Registrati" id="buttonClickMe">
  <br>
  <span id="registrati"></span>


  <br>
  <form method="POST" name="deleteUser" action="deleteUser" class="form">
    <button action="deleteUser" name="submit" class="submit delete" type="submit">CANCELLA ISCRIZIONE</button>
  </form>
</div>


</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {

    $('#buttonClickMe').click(function() {
      $.ajax({
        type : 'GET',
        url : 'utentiServlet',
        success : function(result) {
          $('#registrati').html(result);
        }
      });
    });

  });
</script>
