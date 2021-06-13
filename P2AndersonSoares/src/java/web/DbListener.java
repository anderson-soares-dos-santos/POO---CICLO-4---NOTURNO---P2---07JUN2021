/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;


import db.Disciplinas;
import db.User;
import java.sql.*;
//import org.sqlite.*;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;


/**
 * Web application lifecycle listener.
 *
 * @author andersons
 */
public class DbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:disciplinas-webapp-p2.db";
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();            
            stmt.execute(User.getCreateStatement());
            if(User.getUsers().isEmpty()){
               User.insertUser("admin", "ADMINISTRADOR", "ADMIN", "1234");
               User.insertUser("javano", "JAVANO DA SILVA", "USER", "1234");
            } 
            stmt.execute(Disciplinas.getCreateStatement());
            //INSERIDO DADOS INICIAIS REFERENTE A DISCIPLINAS CURSADAS NO 4ºCICLO
            if(Disciplinas.getList().isEmpty()){
               Disciplinas.insert("Segunda- feira",
                               "Programação Orientada a Objetos",
                               "ILP007",
                               "19:00-22:30",
                               "4",
                               "RICARDO PUPO LARQUESA",
                               "8",
                               "10");
             
               Disciplinas.insert("Terça- feira",
                               "Engenharia de Software III",
                               "IES300",
                               "19:00-22:30",
                               "4",
                               "RENATA NEVES FERREIRA",
                               "6",
                               "3");
               Disciplinas.insert("Quarta- feira",
                               "Sistemas Operacionais II",
                               "ISO200",
                               "19:00-22:30",
                               "4",
                               "FÁBIO PESSOA DE SÁ",
                               "10",
                               "3");
               Disciplinas.insert("Quinta- feira",
                               "Linguagem de Programação IV-INTERNET",
                               "ILP512",
                               "19:00-22:30",
                               "4",
                               "PAULO ROBERTO TAZINAZO CANDIDO",
                               "2",
                               "8");
                Disciplinas.insert("Sexta- feira",
                               "Metodologia da Pesquisa Científico-Tecnológica",
                               "TTG001",
                               "19:00-20:40",
                               "2",
                               "EDMÍLSON DE EIRÓS OLIVEIRA",
                               "8",
                               "9");
                 Disciplinas.insert("Sábado",
                               "Banco de Dados",
                               "IBD002",
                               "08:00-11:30",
                               "4",
                               "SIMONE MARIA VIANA ROMANO",
                               "10",
                               "2");
            }  
            
          
            stmt.execute(Disciplinas.getCreateStatement());
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}