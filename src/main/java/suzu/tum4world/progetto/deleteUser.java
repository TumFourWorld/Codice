package suzu.tum4world.progetto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "deleteUser", value = "/deleteUser")
public class deleteUser extends HttpServlet {

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

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        processrequest(request, response);
    }

    protected void processrequest(HttpServletRequest request, HttpServletResponse response) {

        //prendo username da session
        HttpSession session = request.getSession(true);
        String user = (String) session.getAttribute("username");

        //sql delete user
        try {
            Statement stmt = connection.createStatement();

            String deleteQuery = "DELETE FROM UTENTE WHERE USERNAME = '"+user+"' ";
            PreparedStatement query = connection.prepareStatement(deleteQuery);

            int rowsAffected = query.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("UTENTE ELIMINATO CON SUCCESSO");
                //chiudo sessione lmao
                session.invalidate();
                response.getWriter().write("success");
            } else {
                System.out.println("UTENTE NON TROVATO");
                response.getWriter().write("failure");
            }
        } catch (SQLException | IOException e) {
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