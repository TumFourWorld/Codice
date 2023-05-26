package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {

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


        String user = request.getParameter("username");
        String psw = request.getParameter("password");

        try {
            Statement stmt = connection.createStatement();
            ResultSet esiste = stmt.executeQuery( "select * from UTENTE where USERNAME = '"+user+"' ");

            if(esiste.next()) {
                if(esiste.getString("PASSWORD").equals(psw)){
                    String usr= esiste.getString("USERNAME");
                    System.out.println("LOGGATO");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("username", usr);

                    /* prendo valori da DB */
                    String nome = esiste.getString("NOME");
                    String cognome = esiste.getString("COGNOME");
                    String dob = esiste.getString("DATA_NASCITA");
                    String email = esiste.getString("EMAIL");
                    String tel = esiste.getString("NUM_TEL");
                    Boolean simp = esiste.getBoolean("SIMP");
                    Boolean amm = esiste.getBoolean("ADMIN");

                    /* metto valori in session */
                    session.setAttribute("nome", nome);
                    session.setAttribute("cognome", cognome);
                    session.setAttribute("dob", dob);
                    session.setAttribute("email", email);
                    session.setAttribute("tel", tel);
                    session.setAttribute("simp", simp);
                    session.setAttribute("admin", amm);
                    response.sendRedirect("index.jsp");
                }
                else{
                    System.out.println("ESISTE MA HAI SBAGLIATO LA PSW");
                    response.sendRedirect("login.jsp");
                }
            }else{
                System.out.println("NON ESISTE L'USER");
                response.sendRedirect("login.jsp");
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