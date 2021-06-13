<%-- 
    Document   : disciplinas
    Created on : 11 de abr. de 2021, 11:34:04
    Author     : andersons
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("session.notap1") != null || request.getParameter("session.notap2") != null)
    {
        if(!request.getParameter("session.notap1").isEmpty() || !request.getParameter("session.notap2").isEmpty())
        {
            String p1ilpP007 = request.getParameter("session.p1ilpP007");
            String p2ilpP007 = request.getParameter("session.p2ilpP007");
            session.setAttribute("session.p1ilpP007", p1ilpP007);
            session.setAttribute("session.p2ilpP007", p2ilpP007);
            String p1ies300 = request.getParameter("session.p1ies300");
            String p2ies300 = request.getParameter("session.p2ies300");
            session.setAttribute("session.p1ies300", p1ies300);
            session.setAttribute("session.p2ies300", p2ies300); 
            String p1iso200 = request.getParameter("session.p1iso200");
            String p2iso200 = request.getParameter("session.p2iso200");
            session.setAttribute("session.p1iso200", p1iso200);
            session.setAttribute("session.p2iso200", p2iso200); 
            String p1ilp512 = request.getParameter("session.p1ilp512");
            String p2ilp512 = request.getParameter("session.p2ilp512");
            session.setAttribute("session.p1ilp512", p1ilp512);
            session.setAttribute("session.p2ilp512", p2ilp512); 
            String p1ttg001 = request.getParameter("session.p1ttg001");
            String p2ttg001 = request.getParameter("session.p2ttg001");
            session.setAttribute("session.p1ttg001", p1ttg001);
            session.setAttribute("session.p2ttg001", p1ttg001); 
            String p1isg003 = request.getParameter("session.p1isg003");
            String p2isg003 = request.getParameter("session.p2isg003");
            session.setAttribute("session.p1isg003", p1isg003);
            session.setAttribute("session.p2isg003", p2isg003); 
            String p1ibd002 = request.getParameter("session.p1ibd002");
            String p2ibd002 = request.getParameter("session.p2ibd002");
            session.setAttribute("session.p1ibd002", p1ibd002);
            session.setAttribute("session.p2ibd002", p2ibd002);
            //remover parametros da url
            response.sendRedirect(request.getRequestURI());            
        } 
        else 
        {
            out.println("NOTA NÃO INSERIDA");
        }
    }
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISCIPLINAS - SessionWebAppp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if (session.getAttribute("session.username") == null) {%>
             <div style="color:red">
                 CONTEÚDO RESTRITO.VOCÊ PRECISA ESTAR IDENTIFICADO PARA TER ACESSO.
            
             </div>
         
           <%}else{%>
            <h2>DISCIPLINAS</h2>
            <B><P>Horário com as DISCIPLINAS cursadas neste semestre. </P></B>
            
            <<form>                                             
                                        
                <table id="tabela-disciplinas" border="15">
                                <%--Linha pricipal --%>
                                <tr>
                                    <th>DIA DA SEMANA</th>
                                    <th> DISCIPLINA</th>
                                    <th>CODIGO DA DISCIPLINA</th>
                                    <th>HORÁRIO</th>
                                    <th>PROFESSOR</th>
                                    <th>NOTA - P1</th>
                                    <th>NOTA - P2</th>
                                </tr>
                                <%--Primeira linha --%>
         
                                <tr>
                                <td>Segunda- feira </td>
                                <td>Programação Orientada a Objetos </td>
                                <td>ILP007</td>
                                <td>19:00-22:30 </td>
                                <td>RICARDO PUPO LARQUESA </td>
                                <td><input type="number" name="session.p1ilpP007" value="<%= session.getAttribute("session.p1ilpP007")%>"/></td>                               
                                <td><input type="number" name="session.p2ilpP007" value="<%= session.getAttribute("session.p2ilpP007")%>"/> </td>
                                                              
                                </tr>
                        
                                <%--2ª linha --%>
         
                                <tr>
                                <td>Terça- feira </td>
                                <td>Engenharia de Software III </td>
                                <td>IES300</td>
                                <td>19:00-22:30 </td>
                                <td>RENATA NEVES FERREIRA </td>
                                <td><input type="number" name="session.p1ies300" value="<%= session.getAttribute("session.p1ies300")%>"/></td>                               
                                <td><input type="number" name="session.p2ies300" value="<%= session.getAttribute("session.p2ies300")%>"/> </td>
                                </tr>
                                
                                 <%--3ª linha --%>
         
                                <tr>
                                <td>Quarta- feira </td>
                                <td>Sistemas Operacionais II </td>
                                <td>ISO200</td>
                                <td>19:00-22:30 </td>
                                <td>FÁBIO PESSOA DE SÁ </td>
                                <td><input type="number" name="session.p1iso200" value="<%= session.getAttribute("session.p1iso200")%>"/></td>                               
                                <td><input type="number" name="session.p2iso200" value="<%= session.getAttribute("session.p2iso200")%>"/> </td>
                                
                                </tr>
                                
                                <%--4ª linha --%>
         
                                <tr>
                                <td>Quinta - feira </td>
                                <td>Linguagem de Programação IV-INTERNET </td>
                                <td>ILP512</td>
                                <td>19:00-22:30 </td>
                                <td>PAULO ROBERTO TAZINAZO CANDIDO </td>
                                <td><input type="number" name="session.p1ilp512" value="<%= session.getAttribute("session.p1ilp512")%>"/></td>                               
                                <td><input type="number" name="session.p2ilp512" value="<%= session.getAttribute("session.p2ilp512")%>"/> </td>
                                </tr>
                                
                                <%--5ª linha --%>
         
                                <tr>
                                <td>Sexta - feira </td>
                                <td>Metodologia da Pesquisa Científico-Tecnológica </td>
                                <td>TTG001</td>
                                <td>19:00-20:40 </td>
                                <td>EDMÍLSON DE EIRÓS OLIVEIRA </td>
                                <td><input type="number" name="session.p1ttg001" value="<%= session.getAttribute("session.p1ttg001")%>"/></td>                               
                                <td><input type="number" name="session.p2ttg001" value="<%= session.getAttribute("session.p2ttg001")%>"/> </td>
                                </tr>
                                
                                <%--6ª linha --%>
         
                                <tr>
                                <td>Sexta - feira </td>
                                <td>Segurança da Informação  </td>
                                <td>ISG003</td>
                                <td>20:50-22:30 </td>
                                <td>VAGNER DOS SANTOS MACEDO </td>
                                <td><input type="number" name="session.p1isg003" value="<%= session.getAttribute("session.p1isg003")%>"/></td>                               
                                <td><input type="number" name="session.p2isg003" value="<%= session.getAttribute("session.p2isg003")%>"/> </td>
                                </tr>
                                
                                
                                <%--7ª linha --%>
         
                                <tr>
                                <td>Sábado </td>
                                <td>Banco de Dados  </td>
                                <td>IBD002</td>
                                <td>08:00-11:30 </td>
                                <td>SIMONE MARIA VIANA ROMANO </td>
                                <td><input type="number" name="session.p1ibd002" value="<%= session.getAttribute("session.p1ibd002")%>"/></td>                               
                                <td><input type="number" name="session.p2ibd002" value="<%= session.getAttribute("session.p2ibd002")%>"/> </td>
                                </tr>
           
                </table>
                                
                <input type="submit" value="SALVAR NOTAS">
        </form>             
                    
            
            
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf"  %>
        
        
        
    </body>
</html>