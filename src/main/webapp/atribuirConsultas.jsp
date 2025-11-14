<%-- 
    Document   : atribuirConsultas
    Created on : 13 de nov. de 2025, 18:30:41
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas Consultas</title>
    </head>
    <body>
        <jsp:include page="menuMedico.jsp"/>

        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1>Minhas Consultas</h1>
                <button class="btn btn-success" data-bs-toggle="modal"
                        data-bs-target='#modalMarcarConsulta'>
                    Marcar Nova Consulta
                </button>
            </div>
        
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Paciente</th>
                        <th>Data/Hora</th>
                        <th>Observação</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${requestScope.consultas}">
                        <tr>
                            <td>${item.paciente.nome}</td>
                            <td>${item.dataHora}</td>
                            <td>${item.observacao}</td>
                            <td>
                                <c:if test="${item.prontuario == null}">
                                    <span class="badge bg-warning text-dark">Pendente</span>
                                </c:if>
                                <c:if test="${item.prontuario != null}">
                                    <span class="badge bg-success">Realizada</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        
            
            <div class="modal fade" id="modalMarcarConsulta" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Marcar Nova Consulta</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="ConsultaServlet">
                                <input type="hidden" name="op" value="marcar"/>
                                
                                
                                <div class="mb-3">
                                    <label for="paciente" class="form-label">Paciente</label>
                                    <select name="cpfPaciente" id="paciente" class="form-select" required>
                                        <option value="">Selecione um paciente...</option>
                                        <c:forEach var="pac" items="${requestScope.listaPacientes}">
                                            <option value="${pac.cpf}">${pac.nome}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="dataHora" class="form-label">Data e Hora</label>
                                    <input type="datetime-local" name="dataHora" id="dataHora" class="form-control" required/>
                                </div>
                                <div class="mb-3">
                                    <label for="observacao" class="form-label">Observação (Opcional)</label>
                                    <textarea class="form-control" name='observacao' id="observacao"></textarea>
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Salvar Consulta</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>