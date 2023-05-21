package suzu.tum4world.progetto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "iscrizioneAtt", value = "/iscrizioneAtt")
public class iscrizioneAtt extends HttpServlet {

    private String message;

    public void init() {
        message = "Hello World!";
    }
    String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
    String username = "prova";
    String password = "prova";
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
            Statement stmt = connection.createStatement();

            HttpSession session = request.getSession(true);
            String user = (String) session.getAttribute("user");

            String updateQuery = null;

            String img = request.getParameter("img-att");
            System.out.println(img);
            if(img==null) {
                System.out.println("ERRORE - NULLL");
            }
            switch(img) {
                case "img-att1":
                    updateQuery = "update UTENTE set ATT1 =  true where USERNAME = '"+user+"' ";
                    break;
                default:
                    System.out.println("ERRORE IN GET");
                    break;
            }

            PreparedStatement query = connection.prepareStatement(updateQuery);
            int rowsAffected = query.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("ISCRITTO AD ATTIVITA CON SUCCESSO");
                response.sendRedirect("login.jsp");
            } else {
                System.out.println("UTENTE NON TROVATO - NON ISCRITTO AD ATTIVITA");
                response.sendRedirect("login.jsp");
            }


        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // Hello

    }

    public void destroy() {
    }
}