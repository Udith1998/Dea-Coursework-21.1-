package newpackage;

public class Flight {
    protected String FlightID;
    protected String DepCity;
    protected String DepAirport;
    protected String DepTime;
    protected String ArrCity;
    protected String ArrAirport;
    protected String ArrTime;
    protected String AirTime;
    protected double AirFare;
    protected double Business;
    protected double First;    
 
    public Flight() {
    }
 
    public Flight(String FlightID) {
        this.FlightID = FlightID;
    }
    
    public Flight(String FlightID, String DepCity, String DepAirport, 
            String DepTime, String ArrAirport, String ArrCity, String ArrTime, 
            String AirTime, double AirFare, double Business, double First){
        this.FlightID = FlightID;
        this.DepCity = DepCity;
        this.DepAirport = DepAirport;
        this.DepTime = DepTime;
        this.ArrCity = ArrCity;
        this.ArrAirport = ArrAirport;
        this.ArrTime = ArrTime;
        this.AirFare = AirFare;
        this.AirTime = AirTime;
        this.Business = Business;
        this.First = First;        
    }
    
    public Flight(String DepCity, String DepAirport, 
            String DepTime, String ArrAirport, String ArrCity, String ArrTime, 
            String AirTime, double AirFare, double Business, double First){
        this.DepCity = DepCity;
        this.DepAirport = DepAirport;
        this.DepTime = DepTime;
        this.ArrCity = ArrCity;
        this.ArrAirport = ArrAirport;
        this.ArrTime = ArrTime;
        this.AirFare = AirFare;
        this.AirTime = AirTime;
        this.Business = Business;
        this.First = First;        
    }
    
    public Flight(String FlightID, String DepCity, String DepAirport, 
            String DepTime, String ArrAirport, String ArrCity, String ArrTime,String AirTime,double AirFare){
        this.FlightID = FlightID;
        this.DepCity = DepCity;
        this.DepAirport = DepAirport;
        this.DepTime = DepTime;
        this.ArrCity = ArrCity;
        this.ArrAirport = ArrAirport;
        this.ArrTime = ArrTime;
        this.AirTime = AirTime;
        this.AirFare = AirFare;        
    }
 
 
    public String getFlightID() {
        return FlightID;
    }
 
    public void setFlightID(String FlightID) {
        this.FlightID = FlightID;
    }
 
    public String getDepCity() {
        return DepCity;
    }
 
    public void setDepCity(String DepCity) {
        this.DepCity = DepCity;
    }
    
    public String getDepAirport() {
        return DepAirport;
    }
 
    public void setDepAirport(String DepAirport) {
        this.DepAirport = DepAirport;
    }
    
    public String getDepTime() {
        return DepTime;
    }
 
    public void setDepTime(String DepTime) {
        this.DepTime = DepTime;
    }
    
    public String getArrCity() {
        return ArrCity;
    }
 
    public void setArrCity(String ArrCity) {
        this.ArrCity = ArrCity;
    }
    
    public String getArrAirport() {
        return ArrAirport;
    }
 
    public void setArrAirport(String ArrAirport) {
        this.ArrAirport = ArrAirport;
    }
    
    public String getArrTime() {
        return ArrTime;
    }
 
    public void setArrTime(String ArrTime) {
        this.ArrTime = ArrTime;
    }
    
    public String getAirTime() {
        return AirTime;
    }
 
    public void setAirTime(String AirTime) {
        this.AirTime = AirTime;
    }
    
    public double getAirFare() {
        return AirFare;
    }
 
    public void setAirFare(double AirFare) {
        this.AirFare = AirFare;
    }
    
}
