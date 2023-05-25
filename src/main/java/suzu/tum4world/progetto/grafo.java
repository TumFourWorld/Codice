package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

@WebServlet(name = "grafo", value = "/grafo")
public class grafo extends HttpServlet {

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
        try {
            ArrayList<DonazioneGrafo> output = new ArrayList<>();
            PrintWriter out = response.getWriter();
            Statement stmt = connection.createStatement();
            LocalDate currentDate = LocalDate.now();
            int year = currentDate.getYear();
            ResultSet donazione = stmt.executeQuery( "SELECT MONTH(DATA_DONAZIONE) as mese, SUM(IMPORTO) as importo FROM DONAZIONI WHERE YEAR(DATA_DONAZIONE)>="+year+" group by MONTH(DATA_DONAZIONE)");
            JsonObject jsonObject = new JsonObject();
            while (donazione.next()) {
                DonazioneGrafo don = new DonazioneGrafo();
                int mese = Integer.parseInt(donazione.getString("mese"));
                switch (mese) {
                    case 1: don.setMese("Gennaio"); break;
                    case 2: don.setMese("Febbraio"); break;
                    case 3: don.setMese("Marzo"); break;
                    case 4: don.setMese("Aprile"); break;
                    case 5: don.setMese("Maggio"); break;
                    case 6: don.setMese("Giugno"); break;
                    case 7: don.setMese("Luglio"); break;
                    case 8: don.setMese("Agosto"); break;
                    case 9: don.setMese("Settembre"); break;
                    case 10: don.setMese("Ottobre"); break;
                    case 11: don.setMese("Novembre"); break;
                    case 12: don.setMese("Dicembre"); break;
                }
                don.setImporto(donazione.getDouble("importo"));
                output.add(don);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("uft-8");
            JsonArray array= new JsonArray();
            for(DonazioneGrafo don : output){
                Gson gson = new Gson();
                array.add(gson.toJson(don));
            }

            out.println(array);
            out.flush();

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