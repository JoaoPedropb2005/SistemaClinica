<%-- 
    Document   : Prontuario
    Created on : 14 de nov. de 2025, 09:53:24
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastrar Prontuário</title>
    </head>
    <body>
        <jsp:include page="menuMedico.jsp"/> 
        
        <div class="container mt-4">
            <h2>Cadastrar Prontuário</h2>
            <p>
                <b>Paciente:</b> ${requestScope.consulta.paciente.nome} <br/>
                <b>Data:</b> ${requestScope.consulta.dataHora}
            </p>
            
            <form method="post" action="ConsultaServlet">
                <input type="hidden" name="op" value="cadastrarProntuario"/>
                
                <input type="hidden" name="codigoConsulta" value="${requestScope.consulta.codigo}"/>
                
                <div class="mb-3">
                    <label for="desc" class="form-label">Descrição</label>
                    <input type="text" name="descricao" id="desc" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="obs" class="form-label">Observação</label>
                    <input type="text" name="observacao" id="obs" class="form-control"/>
                </div>
                
                <button type="submit" class="btn btn-primary">Registrar</button>
            </form>
        </div>
    </body>
</html>
