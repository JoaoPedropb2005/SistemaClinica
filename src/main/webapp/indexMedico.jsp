<%-- 
    Document   : indexMedico
    Created on : 13 de nov. de 2025, 18:30:22
    Author     : jppb2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas - ${sessionScope.medicoLogado.nome}</title>
    </head>
    <body>
        <jsp:include page="menuMedico.jsp"/> 

        <div class="container mt-4">
            
            <h1>Consultas Agendadas</h1>
            
            <table class="table table-striped" >
            <tr class="table-white">
                <td>Codigo</td>
                <td>Data</td>
                <td>Data de Volta</td>
                <td>Observação</td>
                <td>Paciente</td>
            </tr>
            
            <%--<c:forEach begin="0" end="10" step="1" varStatus="i">
                ${i.index}
            </c:forEach>--%>
            <c:forEach var="item" items="${requestScope.Consultas}">
                <tr >
                    <td>${item.codigo}</td>
                    <td>${item.dataHora}</td>
                    <td>${item.dataHoraVolta}</td>
                    <td>${item.observacao}</td>
                    <td>${item.paciente}
                </tr>
            </c:forEach>
            
        </table>
        
            
            <div class="modal fade" id="modalConsulta" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cadastro de Consulta</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="ConsultaServlet">
                            <table class="table">
                                <tr>
                                    <td>Código</td>
                                    <td><input type="text" name="codigo" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Data</td>
                                    <td><input type="text" name="data" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Data de Volta</td>
                                    <td><input type="text" name="dataVolta" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Observação</td>
                                    <td><input type="text" name="observacao" class="form-control"/></td>
                                </tr>
                                <tr><td>Paciente</td>
                                    <td>
                                        <select name="cpfPaciente" class="form-select" required>
                                                <option value="">Selecione um paciente...</option>
                                                <c:forEach var="pac" items="${requestScope.pacientes}">
                                                    <option value="${pac.cpf}">${pac.nome}</option>
                                                </c:forEach>
                                    </td>
                                </tr>
                            </table>
                            <button class="btn btn-primary">Marcar</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        </div>
    </body>
</html>
