<%-- 
    Document   : index
    Created on : 11 de abr. de 2021, 11:33:41
    Author     : andersons
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db.User"%>
<%@page import="db.Disciplinas"%>
<%@page import="web.DbListener"%>
<%@page import="java.util.ArrayList"%>
<%
    String indexRequestError = null;
    ArrayList<Disciplinas> list = new ArrayList<>();
    try{
        if(request.getParameter("insert")!=null){
            String diaSemana = request.getParameter("diaSemana");
            String name = request.getParameter("name");
            String codDisciplina = request.getParameter("codDisciplina");
            String horario = request.getParameter("horario");
            String aulas = request.getParameter("aulas");
            String professor = request.getParameter("professor");
            String notaP1 = request.getParameter("notaP1");
            String notaP2 = request.getParameter("notaP2");
            Disciplinas.insert(diaSemana ,
                                name ,
                                codDisciplina ,
                                horario ,
                                aulas ,
                                professor ,
                                notaP1 ,
                                notaP2 );
            
            response.sendRedirect(request.getRequestURI());
           
        
        }else if (request.getParameter("delete")!=null){
            String name = request.getParameter("name");
            Disciplinas.delete(name);
            response.sendRedirect(request.getRequestURI());
        }
        list = Disciplinas.getList();
    }catch(Exception ex){
        indexRequestError = ex.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INDEX -  P2 - JdbcDisciplinasWebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>INDEX</h2>
        <P> <b> P2 ANDERSON SOARES DOS SANTOS</b></P>
        <fieldset>
         <legend>MEUS DADOS</legend>
         <table  border="15">
            <tr>
                <th>NOME DO ALUNO</th>
                <th>MATRICULA(RA)</th>
                <th>SEMESTRE INGRESSANTE</th>
                <th>PERFIL - GitHub</th>             
            </tr>  
            <tr>
                <td>ANDERSON SOARES DOS SANTOS</td>
                <td>1290481923017</td>
                <td>2° SEMESTRE/2019</td>
                <td><a href='https://github.com/anderson-soares-dos-santos'>github.com/anderson-soares-dos-santos</a></td>
            </tr>
        </table>
        </fieldset>
<hr/>    
        <fieldset>
        <legend>MINHAS DISCIPLINAS </legend>
        <table border="15">
            <tr>
                <th>DISCIPLINA</th>
                <th>CODIGO DA DISCIPLINA</th>
                <th>NOTA - P1</th>
                <th>NOTA - P2</th>
                <th>MÉDIA</th>
            </tr>
            <%for(Disciplinas c: list ){%>
                <tr>                    
                    <td><%= c.getName() %></td>
                    <td><%= c.getCodDisciplina() %></td>
                    <td><%= c.getNotaP1() %></td> 
                    <td><%= c.getNotaP2() %></td> 
                    <%-- CALCULO DA MEDIA  --%>
                    <%-- CONVERTER DE STRING PARA INT --%>
                    <%-- Integer.parseInt --%>
                   <td><%= ((Integer.parseInt( c.getNotaP1())) 
                          + (Integer.parseInt( c.getNotaP2())) )
                          / 2%>
                   </td> 
                </tr>
            <%}%>  
            </table>
            </fieldset>
<hr/>
                
         <fieldset>
         <legend>LINK DO PERFIL DO ALUNO</legend>
            <h3><a href="AndersonSoaresDosSantos.html">ANDERSON SOARES DOS SANTOS </a> </h3>
        </fieldset>
                    
        <%@include file="WEB-INF/jspf/footer.jspf"  %>
    </body>
</html>
