package suzu.tum4world.progetto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "disiscrizioneAtt", value = "/disiscrizioneAtt")
public class disiscrizioneAtt extends HttpServlet {

    private String message;
    Connection connection;
    public void init() {
        String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
        String username = "prova";
        String password = "prova";
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Statement stmt = connection.createStatement();
            HttpSession session = request.getSession(true);
            String user = (String) session.getAttribute("username");
            String updateQuery = null;
            String img = request.getParameter("img-att");
            System.out.println(img);
            System.out.println(user);
            if(img==null) {
                System.out.println("ERRORE - NULL");
            }
            switch(img) {
                case "img1":
                    updateQuery = "UPDATE PROVA.UTENTE t SET t.ATT1 = false WHERE t.USERNAME LIKE '"+user+"' ";
                    request.getSession().setAttribute("att1",false);
                    break;
                case "img2":
                    updateQuery = "UPDATE PROVA.UTENTE t SET t.ATT2 = false WHERE t.USERNAME LIKE '"+user+"' ";
                    request.getSession().setAttribute("att2",false);
                    break;
                case "img3":
                    updateQuery = "UPDATE PROVA.UTENTE t SET t.ATT3 = false WHERE t.USERNAME LIKE '"+user+"' ";
                    request.getSession().setAttribute("att3",false);
                    break;
                default:
                    System.out.println("ERRORE IN GET");
                    break;
            }

            PreparedStatement query = connection.prepareStatement(updateQuery);
            int rowsAffected = query.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("DISISCRITTO DALL' ATTIVITA CON SUCCESSO");
                response.getWriter().write("Disiscritto");
            } else {
                System.out.println("UTENTE NON TROVATO - NON DISISCRITTO DALL' ATTIVITA");
                response.getWriter().write("Non Disiscritto");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
        try {
            connection.close();
            System.out.println("Connection closed.");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}