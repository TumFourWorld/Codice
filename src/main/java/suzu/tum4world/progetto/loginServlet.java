package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {

    private String message;

    public void init() {
        message = "Hello World!";
    }
    String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
    String username = "prova";
    String password = "prova";
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String user = request.getParameter("username");
        String psw = request.getParameter("password");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
            Statement stmt = connection.createStatement();

            ResultSet esiste = stmt.executeQuery( "select * from UTENTE where USERNAME = '"+user+"' ");
            if(esiste!=null){
                esiste.next();
                if(esiste.getString("PASSWORD").equals(psw)){
                    String usr= esiste.getString("USERNAME");
                    System.out.println("LOGGATO");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("username", usr);
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