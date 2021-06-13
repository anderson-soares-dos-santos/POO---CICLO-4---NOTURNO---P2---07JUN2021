<%-- 
    Document   : users
    Created on : 13 de jun. de 2021, 15:30:48
    Author     : andersons
--%>

<%@page import="web.DbListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    ArrayList<User> users = new ArrayList<>();
    try{
        if(request.getParameter("insert")!=null){
            String login = request.getParameter("login");
            String name = request.getParameter("name");
            String role = request.getParameter("role");
            String password = request.getParameter("password");
            User.insertUser(login, name, role, password);
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("delete")!=null){
            String login = request.getParameter("login");
            User.deleteUser(login);
            response.sendRedirect(request.getRequestURI());
        }
        users = User.getUsers();
    }catch(Exception ex){
        requestError = ex.getMessage();
    }
%>

<!ALTERAÇÃO DE SENHA DE USUÁRIO>
<%
    //String requestError = null;
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - P2 - JdbcDisciplinasWebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <!-- CADASTRO/EXCLUSÃO DE USUÁRIO -->
        <h2>Usuários - CADASTRO/EXCLUSÃO </h2>
        <%if(requestError!=null){%>
        <div style="color: red"><%= requestError %></div>
        <%}%>
        
        <%if(session.getAttribute("user.login") == null){%>
            <div>Página restrita a usuários logados</div>
        <%}else if(!session.getAttribute("user.role").equals("ADMIN")){%>
            <div>Página restrita a administradores</div>
        <%}else{%>
        
        <form method="post">
            Login: <input type="text" name="login"/>
            Nome: <input type="text" name="name"/>
            Papel: <select name="role">
                <option value="ADMIN">ADMIN</option>
                <option value="USER">USER</option>
            </select>
            Senha: <input type="password" name="password"/>
            <input type="submit" name="insert" value="CADASTRAR"/>
        </form>
        <hr/>
         <h2>Usuários - CADASTRADOS </h2>
        <table border="15">
            <tr>
                <th>Login</th>
                <th>Nome</th>
                <th>Papel</th>
                <th>Exclusão</th>
            </tr>
            <%for(User user: users){%>
                <tr>
                    <td><%= user.getLogin() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getRole() %></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="login" value="<%= user.getLogin() %>"/>
                            <input type="submit" name="delete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
        
        <%}%>
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