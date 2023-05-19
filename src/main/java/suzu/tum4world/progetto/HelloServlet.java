package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    private String message;

    public void init() {
        message = "Hello World!";
    }
    String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
    String username = "prova";
    String password = "prova";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery( "SELECT t.* FROM PROVA.UTENTE t");
            out.println("<html><body>");
            while (rs.next()) {
                String nome = rs.getString("NOME");
                String cognome = rs.getString("COGNOME");
                Date data = rs.getDate("DATA_NASCITA");
                String email = rs.getString("EMAIL");
                String num_tel = rs.getString("NUM_TEL");
                Boolean simp = rs.getBoolean("SIMP");
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");

                out.println("<h1>" + username + "</h1>");
                out.println("<p>" + nome + "</p>");
                out.println("<p>" + cognome + "</p>");
                out.println("<p>" + data + "</p>");
                out.println("<p>" + email + "</p>");
                out.println("<p>" + num_tel + "</p>");
                out.println("<p>" + simp + "</p>");
                out.println("<p>" + password + "</p>");
                out.println("<br>");
            }
            out.println("</body></html>");
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