<%-- 
    Document   : my-profile
    Created on : 13 de jun. de 2021, 17:44:46
    Author     : andersons
--%>

<%@page import="web.DbListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    try{
        if(request.getParameter("changePassword")!=null){
            String login = (String) session.getAttribute("user.login");
            String password = request.getParameter("password");
            String newPassword1 = request.getParameter("newPassword1");
            String newPassword2 = request.getParameter("newPassword2");
            if(User.getUser(login, password) == null){
                requestError = "Senha inválida";
            }else if(!newPassword1.equals(newPassword2)){
                requestError = "Confirmação de nova senha inválida";
            }else{
                User.changePassword(login, newPassword1);
                response.sendRedirect(request.getRequestURI());
            }
        }
    }catch(Exception ex){
        requestError = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - P2 - JdbcDisciplinasWebApp </title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"  %>
      <!-- ALTERAÇÃO DE SENHA DE USUÁRIO -->
    <h2>Meu Perfil</h2>
        
        <%if(session.getAttribute("user.login") == null){%>
            <div>Página restrita a usuários logados</div>
        <%}else{%>
        
              
        <table border="15">
            <tr>
                <th>Login</th>
                <th>Nome</th>
                <th>Papel</th>
               
            </tr>
            
                <tr>
                    <td><%= session.getAttribute("user.login") %></td>
                    <td><%= session.getAttribute("user.name") %></td>
                    <td><%= session.getAttribute("user.role") %></td>
                    
                </tr>
            
        </table>
        
        
        <hr/>
        <fieldset>
            <legend>Alterar senha</legend>
            <form method="post">
                <%if(requestError!=null){%>
                    <div style="color: red"><%= requestError %></div>
                <%}%>
                Senha atual: 
                <br/><input type="password" name="password" placeholder="digite sua senha atual"/>
                <br/>Nova senha:
                <br/><input type="password" name="newPassword1" placeholder="digite sua nova senha"/>
                <br/>Confirmação da nova senha:
                <br/><input type="password" name="newPassword2" placeholder="confirme sua nova senha"/>
                <hr/>
                <input type="submit" name="changePassword" value="ALTERAR SENHA"/>
            </form>
        </fieldset>
        
        <%}%>
    <%@include file="WEB-INF/jspf/footer.jspf"  %>    
    </body>
</html>
