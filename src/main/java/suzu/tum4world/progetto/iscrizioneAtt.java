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
            String user = (String) session.getAttribute("username");

            String updateQuery = null;

            String img = request.getParameter("img-att");
            System.out.println(img);
            System.out.println(user);
            if(img==null) {
                System.out.println("ERRORE - NULLL");
            }
            switch(img) {
                case "img1":
                    updateQuery = "UPDATE PROVA.UTENTE t SET t.ATT1 = true WHERE t.USERNAME LIKE '"+user+"' ";
                    break;
                case "img2":
                    updateQuery = "UPDATE PROVA.UTENTE t SET t.ATT2 = true WHERE t.USERNAME LIKE '"+user+"' ";

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

            connection.close();
            System.out.println("Connection closed.");

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