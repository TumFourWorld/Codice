package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet(name = "singInServlet", value = "/singInServlet")
public class singInServlet extends HttpServlet {

    private String message;

    public void init() {
        message = "Hello World!";
    }
    String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
    String username = "prova";
    String password = "prova";
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String data = request.getParameter("dataNascita");
        String email = request.getParameter("email");
        String num_tel = request.getParameter("num-tel");
        String simp = request.getParameter("scelta");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Boolean simpBool=false;

        if(simp.equals("simp")){
            simpBool=true;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
            Statement stmt = connection.createStatement();
            stmt.executeUpdate( "INSERT INTO PROVA.UTENTE (NOME, COGNOME, dataNascita, EMAIL, NUM_TEL, SIMP, USERNAME, PASSWORD) VALUES ('"+nome+"','"+cognome+"','"+data+"','"+email+"','"+num_tel+"','"+simpBool+"','"+username+"','"+password+"')");
            response.sendRedirect("index.jsp");
            System.out.println("Inserimento in tabella utente");
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