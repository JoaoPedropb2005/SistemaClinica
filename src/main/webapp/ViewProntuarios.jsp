<%-- 
    Document   : ViewProntuarios
    Created on : 14 de nov. de 2025, 10:40:46
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prontuários Realizados</title>
    </head>
    <body>
        <jsp:include page="menuMedico.jsp"/> 
        
        <div class="container mt-4">
            <h1>Prontuários Realizados</h1>
            <p>Aqui estão todas as consultas que já foram finalizadas.</p>

            <table class="table table-striped">
                <tr class="table-dark">
                    <td>Paciente</td>
                    <td>Data</td>
                    <td>Data de Volta</td>
                    <td>Observação</td>
                    <th>Status</th>
                </tr>
                
                <c:forEach var="item" items="${requestScope.consultasRealizadas}">
                    <tr >
                        <td>${item.paciente.nome}</td>
                        <td>${item.dataHora}</td>
                        <td>${item.dataHoraVolta}</td>
                        <td>${item.observacao}</td>
                        <td>
                            <span class="badge bg-success">Realizada</span>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
