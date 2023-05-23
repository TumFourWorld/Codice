package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet(name = "utentiServlet", value = "/utentiServlet")
public class utentiServlet extends HttpServlet {

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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String user = request.getParameter("username");
        String psw = request.getParameter("password");
        String parameter = request.getParameter("ruolo");

        try {
            Statement stmt = connection.createStatement();

            ResultSet esiste = stmt.executeQuery( "select * from UTENTE");

            PrintWriter out = response.getWriter();
            while(esiste.next()) {
                if(parameter.equals("registrati")) {
                    //tutti gli utenti
                    out.write("<p>" + esiste.getString("USERNAME") + "</p>");
                } else if (parameter.equals("simp")) {
                    //tutti i simp
                    if(esiste.getBoolean("SIMP")){
                        //quelli simp
                        out.write("<p>" + esiste.getString("USERNAME") + "</p>");
                    }
                }else if(parameter.equals("aderenti")){
                    if(!esiste.getBoolean("SIMP")){
                        //solo aderenti
                        out.write("<p>" + esiste.getString("USERNAME") + "</p>");
                    }
                }
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