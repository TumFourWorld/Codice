package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet(name = "registrazioneServlet", value = "/registrazioneServlet")
public class registrazioneServlet extends HttpServlet {

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
        processrequest(request, response);
    }

    protected void processrequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");

        USER u = new USER();


        //campi dal form
        u.setNome(request.getParameter("nome"));
        u.setCognome(request.getParameter("cognome"));
        u.setData_nascita(request.getParameter("data_nascita"));
        u.setEmail(request.getParameter("email"));
        u.setNum_tel(request.getParameter("num_tel"));
        Boolean scelta = false;
        if(request.getParameter("scelta").equals("simp")) {
             scelta = true;
        }
        u.setSimp(scelta);
        u.setUsername(request.getParameter("uname"));
        u.setPassword(request.getParameter("psw"));

        try {
            Statement stmt = connection.createStatement();
            stmt.executeUpdate( "INSERT INTO PROVA.UTENTE (NOME, COGNOME, DATA_NASCITA, EMAIL, NUM_TEL, SIMP, USERNAME, PASSWORD) VALUES ('"+u.getNome()+"','"+u.getCognome()+"','"+u.getData_nascita()+"','"+ u.getEmail()+"','"+u.getNum_tel()+"','"+u.getSimp()+"','"+u.getUsername()+"','"+u.getPassword()+"')");
            System.out.println("Inserito user con successo");
            response.getWriter().write("success");

        } catch (SQLException e) {
            System.out.println("registrazione non effettuata");
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
        try {
            System.out.println("Connection closed.");
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}