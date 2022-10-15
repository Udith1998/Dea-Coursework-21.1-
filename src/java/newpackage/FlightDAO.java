package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 
public class FlightDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

     
    public FlightDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }
     
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
//                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
     
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
     
    public boolean insertFlight(Flight flight) throws SQLException {
        String sql = "INSERT INTO flight VALUES (FlightID,DepCity,DepAirport,DepTime,ArrCity,ArrAirport,ArrTime,AirTime,AirFare) VALUES (?,?,?,?,?,?,?,?,?)";
        connect();
         
        boolean rowInserted;
        try (PreparedStatement ps = jdbcConnection.prepareStatement(sql)) {
            ps.setString(1, flight.getFlightID());
            ps.setString(2, flight.getDepCity());
            ps.setString(3, flight.getDepAirport());
            ps.setString(4, flight.getDepTime());
            ps.setString(5, flight.getArrCity());
            ps.setString(6, flight.getArrAirport());
            ps.setString(7, flight.getArrTime());
            ps.setString(8, flight.getAirTime());
            ps.setDouble(9, flight.getAirFare());
            rowInserted = ps.executeUpdate() > 0;
        }
        disconnect();
        return rowInserted;
    }
     
    public List<Flight> listAllFlights() throws SQLException {
        List<Flight> listFlight = new ArrayList<>();
         
        String sql = "SELECT * FROM flight";
         
        connect();
         
        try (Statement ps = jdbcConnection.createStatement(); ResultSet rs = ps.executeQuery(sql)) {           
            while (rs.next()) {
                String FlightID = rs.getString("FlightID");
                String DepCity = rs.getString("DepCity");
                String DepAirport = rs.getString("DepAirport");
                String DepTime = rs.getString("DepTime");
                String ArrAirport = rs.getString("ArrAirport");
                String ArrCity = rs.getString("ArrCity");
                String ArrTime = rs.getString("ArrTime");
                String AirTime = rs.getString("ArrTime");
                double AirFare = rs.getDouble("AirFare");
                
                Flight flight = new Flight(FlightID,DepCity,DepAirport,DepTime,ArrCity,ArrAirport,ArrTime,AirTime,AirFare);
                listFlight.add(flight);
            }
            
        }         
        disconnect();         
        return listFlight;
    }
     
    public boolean deleteFlight(Flight flight) throws SQLException {
        String sql = "DELETE FROM flight where FlightID = ?";
         
        connect();
         
        boolean rowDeleted;
        try (PreparedStatement ps = jdbcConnection.prepareStatement(sql)) {
            ps.setString(1, flight.getFlightID());
            rowDeleted = ps.executeUpdate() > 0;
        }
        disconnect();
        return rowDeleted;     
    }
     
    public boolean updateFlight(Flight flight) throws SQLException {
        String sql = "UPDATE flight SET DepCity=?, DepAirport=?, DepTime=?, ArrCity=?, ArrAirport=?, ArrTime=?, AirTime=?, AirFare=?";
        sql += " WHERE FlightID = ?";
        connect();
         
        boolean rowUpdated;
        try (PreparedStatement ps = jdbcConnection.prepareStatement(sql)) {            
            ps.setString(1, flight.getDepCity());
            ps.setString(2, flight.getDepAirport());
            ps.setString(3, flight.getDepTime());
            ps.setString(4, flight.getArrCity());
            ps.setString(5, flight.getArrAirport());
            ps.setString(6, flight.getArrTime());
            ps.setString(7, flight.getAirTime());
            ps.setDouble(8, flight.getAirFare());
            ps.setString(9, flight.getFlightID());
            rowUpdated = ps.executeUpdate() > 0;
        }
        disconnect();
        return rowUpdated;     
    }
     
    public Flight getFlight(String FlightID) throws SQLException {
        Flight flight = null;
        String sql = "SELECT * FROM flight WHERE FlightID = ?";
         
        connect();
         
        try (PreparedStatement ps = jdbcConnection.prepareStatement(sql)) {
            ps.setString(1, FlightID);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String DepCity = rs.getString("DepCity");
                    String DepAirport = rs.getString("DepAirport");
                    String DepTime = rs.getString("DepTime");
                    String ArrAirport = rs.getString("ArrAirport");
                    String ArrCity = rs.getString("ArrCity");
                    String ArrTime = rs.getString("ArrTime");
                    String AirTime = rs.getString("ArrTime");
                    double AirFare = rs.getDouble("AirFare");
                    double Business = rs.getDouble("Business");
                    double First = rs.getDouble("First");
                    
                    flight = new Flight(DepCity,DepAirport,DepTime,ArrCity,ArrAirport,ArrTime,AirTime,AirFare,Business,First);
                }
            }
        }
         
        return flight;
    }
}