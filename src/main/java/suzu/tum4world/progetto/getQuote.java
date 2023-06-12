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
import java.util.ArrayList;
import java.util.Random;
import java.sql.*;

@WebServlet(name = "getQuote", value = "/getQuote")
public class getQuote extends HttpServlet {

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

        ArrayList<QUOTES> output = new ArrayList<QUOTES>();

        try {


            Statement stmt = connection.createStatement();
            ResultSet esiste = stmt.executeQuery("select FRASE from QUOTES");

            while(esiste.next()) {
                QUOTES retrieved_quotes = new QUOTES();
                retrieved_quotes.setFrase(esiste.getString("FRASE"));
                output.add(retrieved_quotes); //metto dentro array di QUOTES x mandare in output
            }


        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //SENDING JSON RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        try (PrintWriter out = response.getWriter()) {
            JsonArray array = new JsonArray();
            for(QUOTES q : output) {
                Gson gson = new Gson();
                array.add(gson.toJson(q));
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