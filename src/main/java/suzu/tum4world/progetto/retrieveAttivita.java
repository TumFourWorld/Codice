package suzu.tum4world.progetto;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "retrieveAttivita", value = "/retrieveAttivita")
public class retrieveAttivita extends HttpServlet {

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
        processrequest(request, response);
    }

    protected void processrequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ArrayList<USER> output = new ArrayList<USER>();
        HttpSession session = request.getSession(true);
        String user =(String) session.getAttribute("username");

        try {
            Statement stmt = connection.createStatement();
            ResultSet esiste = stmt.executeQuery("select ATT1, ATT2, ATT3 from UTENTE WHERE USERNAME='"+user+"'");
            if(esiste.next()) {
                USER retrieved_user = new USER();
                retrieved_user.setAtt1(esiste.getBoolean("ATT1"));
                retrieved_user.setAtt2(esiste.getBoolean("ATT2"));
                retrieved_user.setAtt3(esiste.getBoolean("ATT3"));

                output.add(retrieved_user); //metto dentro array di user x mandare in output
            }


        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //SENDING JSON RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        try (PrintWriter out = response.getWriter()) {
            JsonArray array = new JsonArray();
            for(USER u : output) {
                Gson gson = new Gson();
                array.add(gson.toJson(u));
            }
            out.println(array);
            out.flush();
        } catch (IOException e) {
            System.out.println("ERRORE IN OUTPUT JSON QUOTES");
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