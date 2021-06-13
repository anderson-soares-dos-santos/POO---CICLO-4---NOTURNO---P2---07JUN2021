/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author andersons
 */
public class Disciplinas {
    private String diaSemana;
    private String name;
    private String codDisciplina;
    private String horario;
    private String aulas;
    private String professor;
    private String notaP1;
    private String notaP2;

public static String getCreateStatement(){
        //return "DROP TABLE  disciplinas "; 
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "diaSemana VARCHAR(20) NOT NULL,  "
                + "name VARCHAR(200) NOT NULL, "
                + "codDisciplina VARCHAR(10) PRIMARY KEY, "
                + "horario VARCHAR(15) NOT NULL, "
                + "aulas VARCHAR(2) NOT NULL, "
                + "professor VARCHAR(200) NOT NULL, "
                + "notaP1 VARCHAR(2) NOT NULL, "
                + "notaP2 VARCHAR(2) NOT NULL"
                + ")"; 
        
    }
   
     public static ArrayList<Disciplinas> getList() throws Exception{
               ArrayList<Disciplinas> list = new ArrayList<>();
               Connection con = DbListener.getConnection();
               Statement stmt = con.createStatement();
               ResultSet rs = stmt.executeQuery("SELECT * from disciplinas ");
            while(rs.next()){
                String diaSemana     =  rs.getString("diaSemana");
                String name          =  rs.getString("name");
                String codDisciplina =  rs.getString("codDisciplina");
                String horario       =  rs.getString("horario");
                String aulas         =  rs.getString("aulas");
                String professor     =  rs.getString("professor");
                String notaP1        =  rs.getString("notaP1");
                String notaP2        =  rs.getString("notaP2"); 
                
              
               list.add(new Disciplinas(diaSemana,
                                        name,
                                        codDisciplina,
                                        horario,
                                        aulas,                                        
                                        professor,
                                        notaP1,
                                        notaP2));
               
                      
            } 
            rs.close();
            stmt.close();
            con.close();
            return list;
      }

     public static void insert( String diaSemana ,
                                String name ,
                                String codDisciplina ,
                                String horario ,
                                String aulas ,
                                String professor ,
                                String notaP1 ,
                                String notaP2 ) throws Exception{
       
    
    
            Connection con = DbListener.getConnection();
            String sql = "INSERT INTO disciplinas(diaSemana, "
                       + " name, "
                       + " codDisciplina, "
                       + " horario, "
                       + " aulas, "
                       + " professor, "
                       + " notaP1, "
                       + " notaP2)"
                       + " VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,diaSemana);
            stmt.setString(2,name);
            stmt.setString(3,codDisciplina);
            stmt.setString(4,horario);
            stmt.setString(5,aulas);
            stmt.setString(6,professor);
            stmt.setString(7,notaP1);
            stmt.setString(8,notaP2);
            
            stmt.execute();
            stmt.close();
            con.close();
    
    }
    public static void delete(String name) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "DELETE FROM disciplinas WHERE name = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.execute();
        stmt.close();
        con.close();
               
    }
     
     public static void update( String diaSemana ,
                                String name ,
                                String codDisciplina ,
                                String horario ,
                                String aulas ,
                                String professor ,
                                String notaP1 ,
                                String notaP2) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "UPDATE disciplinas "
                + "SET diaSemana=?, "
                + "name=?, "
                + "codDisciplina=?, "
                + "horario=?, "
                + "aulas=? "
                + "professor=? "
                + "notaP1=? "
                + "notaP2=? "
                + "WHERE name=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,diaSemana);
        stmt.setString(2,name);
        stmt.setString(3,codDisciplina);
        stmt.setString(4,horario);
        stmt.setString(5,aulas);
        stmt.setString(6,professor);
        stmt.setString(7,notaP1);
        stmt.setString(8,notaP2);
        stmt.setString(2,name);
        stmt.execute();
        stmt.close();
        con.close();
    }

    
public Disciplinas(String diaSemana, String name, String codDisciplina, String horario, String aulas, String professor, String notaP1, String notaP2) {
        this.diaSemana = diaSemana;
        this.name = name;
        this.codDisciplina = codDisciplina;
        this.horario = horario;
        this.aulas = aulas;
        this.professor = professor;
        this.notaP1 = notaP1;
        this.notaP2 = notaP2;
    }

    public String getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(String diaSemana) {
        this.diaSemana = diaSemana;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCodDisciplina() {
        return codDisciplina;
    }

    public void setCodDisciplina(String codDisciplina) {
        this.codDisciplina = codDisciplina;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getAulas() {
        return aulas;
    }

    public void setAulas(String aulas) {
        this.aulas = aulas;
    }

    public String getProfessor() {
        return professor;
    }

    public void setProfessor(String professor) {
        this.professor = professor;
    }

    public String getNotaP1() {
        return notaP1;
    }

    public void setNotaP1(String notaP1) {
        this.notaP1 = notaP1;
    }

    public String getNotaP2() {
        return notaP2;
    }

    public void setNotaP2(String notaP2) {
        this.notaP2 = notaP2;
    }

    
    
}
