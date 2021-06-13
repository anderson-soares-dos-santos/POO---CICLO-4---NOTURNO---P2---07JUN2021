<%-- 
    Document   : disciplinas
    Created on : 11 de abr. de 2021, 11:34:04
    Author     : andersons
--%>
<%@page import="web.DbListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
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
        requestError = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Disciplinas -  P2 - JdbcDisciplinasWebApp</title>
    </head>
     <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <!-- CADASTRO/EXCLUSÃO DISCIPLINAS -->
        <h2>Disciplinas</h2>
        
        <%if(requestError!=null){%>
        <div style="color: red"><%= requestError %></div>
        <%}%>
        
        <%if(session.getAttribute("user.login") == null){%>
            <div>Página restrita a usuários logados</div>
        <%}else{%>
         <!-- UTLIZANDO A CLASSE .form-horizontal PARA ALINHAMENTO -->
         
         <fieldset>
            <legend>CADASTRO DE DISCIPLINAS</legend>
         
        <form class="form-horizontal" role="form" method="post">
	<div class="form-group">
                
		<label for="diaSemana" class="col-lg-2 control-label">Dia da semana</label>
		<div class="col-lg-10">
                        
			<input type="text"
                               class="form-control"
                               name="diaSemana"
                               placeholder="Segunda-feira">
		</div>
	</div>
	<div class="form-group">
                
		<label for="name" class="col-lg-2 control-label">Disciplina</label>
		<div class="col-lg-10">
			<input type="text" 
                               class="form-control"
                                maxlength="199"
                               name="name"
                               placeholder="Sistemas Operacionais">
		</div>
	</div>
	<div class="form-group">
                
		<label for="codDisciplina" class="col-lg-2 control-label">Codigo da Disciplina</label>
		<div class="col-lg-10">
			<input type="text" 
                               class="form-control"
                               maxlength="9"
                               name="codDisciplina"
                               placeholder="ISO200">
		</div>
	</div>
        <div class="form-group">
                
                
		<label for="horario" class="col-lg-2 control-label">Horário</label>
		<div class="col-lg-10">
			<input type="text" 
                               class="form-control"
                               maxlength="14"
                               name="horario"
                               placeholder="19:00-22:30">
		</div>
	</div>
        <div class="form-group">
                
		<label for="aulas" class="col-lg-2 control-label">Aulas</label>
		<div class="col-lg-10">
			<input type="text" 
                               class="form-control"
                               maxlength="1"
                               name="aulas"
                               placeholder="4">
		</div>
	</div>
        <div class="form-group">
                
		<label for="professor" class="col-lg-2 control-label">Professor</label>
		<div class="col-lg-10">
			<input type="text" 
                                maxlength="199"
                               class="form-control"
                               name="professor"
                               placeholder="RICARDO PUPO LARQUESA">
		</div>
	</div>
        <div class="form-group">
                  
		<label for="notaP1" class="col-lg-2 control-label">Nota da P1</label>
		<div class="col-lg-10">
			<input type="text" 
                               class="form-control"
                               maxlength="3"
                               name="notaP1"
                               placeholder="8.8">
		</div>
	</div>
        <div class="form-group">
                  
		<label for="notaP2" class="col-lg-2 control-label">Nota da P2</label>
		<div class="col-lg-10">
			<input type="text" 
                               class="form-control"
                               maxlength="3"
                               name="notaP2"
                               placeholder="0">
		</div>
	</div>
        <hr/>
         <input type="submit" name="insert" value="CADASTRAR"/>
	</form>
         
        </fieldset>
        
     
        <hr/>  
        <h2>Disciplinas - CADASTRADAS </h2>
        <hr/>
        <table border="15">
            <tr>
                <th>DIA DA SEMANA</th>
                <th>DISCIPLINA</th>
                <th>CODIGO DA DISCIPLINA</th>
                <th>HORÁRIO</th>
                <th>AULAS</th>
                <th>PROFESSOR</th>
                <th>NOTA - P1</th>
                <th>NOTA - P2</th>
                <th>SALVAR</th>
                <th>EXCLUIR</th>
            </tr>
            <%for(Disciplinas c: list){%>
                <tr>
                    <td><%= c.getDiaSemana() %></td>
                    <td><%= c.getName() %></td>
                    <td><%= c.getCodDisciplina() %></td>
                    <td><%= c.getHorario() %></td>
                    <td><%= c.getAulas() %></td>
                    <td><%= c.getProfessor() %></td>
                    <td><input maxlength="3" type="text" name="notaP1" value="<%= c.getNotaP1() %>"/></td> 
                    <td><input maxlength="3" type="text" name="notaP2" value="<%= c.getNotaP2() %>"/></td>
                    <td>
                        
                        <form method="post">
                           
                           
                          <input type="submit" name="insert" value="SALVAR"/>
                            
                        </form>
                    </td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="name" value="<%= c.getName() %>"/>
                            <input type="submit" name="delete" value="EXCLUIR"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        
        <form method="post">
            
        <input type="submit" name="insert" value="SALVAR NOTAS"/>
        </form>
        </table>
        
        
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf"  %>
        
        
        
    </body>
</html>