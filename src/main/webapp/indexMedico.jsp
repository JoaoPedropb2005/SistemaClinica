<%-- 
    Document   : indexMedico
    Created on : 13 de nov. de 2025, 18:30:22
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <td>Paciente</td>
                    <td>Data</td>
                    <td>Data de Volta</td>
                    <td>Observação</td>
                    <th>Status</th>
                    <td><span></span></td>
                </tr>

                <%--<c:forEach begin="0" end="10" step="1" varStatus="i">
                    ${i.index}
                </c:forEach>--%>
                <c:forEach var="item" items="${requestScope.consultas}">
                    <tr >
                        <td>${item.paciente.nome}</td>
                        <td>${item.dataHora}</td>
                        <td>${item.dataHoraVolta}</td>
                        <td>${item.observacao}</td>
                        <td>
                            <c:if test="${item.prontuario == null}">
                                <span class="badge bg-warning text-dark">Pendente</span>
                            </c:if>
                            <c:if test="${item.prontuario != null}">
                                <span class="badge bg-success">Realizada</span>
                            </c:if>
                        </td>
                        <td>
                            <a href="ConsultaServlet?op=abrirProntuario&codigo=${item.codigo}"
                               class="btn btn-info btn-sm">
                                Criar Prontuário
                            </a>
                            </a>
                        </td>
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
                                <input type="hidden" name="op" value="marcarConsulta"/>
                                <table class="table">
                                    <tr>
                                        <td>Codigo</td>
                                        <td><input type="text" name="codigo" class="form-control"/></td>
                                    </tr>
                                    <tr><td>Paciente</td>
                                        <td>
                                            <select name="cpf" class="form-select" required>
                                                <option value="">Selecione um paciente...</option>
                                                <c:forEach var="pac" items="${requestScope.pacientes}">
                                                    <option value="${pac.cpf}">${pac.nome}</option>
                                                </c:forEach>
                                        </td>
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
                                </table>
                                <button type="submit" class="btn btn-primary">Marcar</button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>


            <div class="modal fade" id="modalProntuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Prontuario</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="ConsultaServlet">
                                <input type="hidden" name="op" value="cadastrarProntuario"/>
                                <table class="table">
                                    <tr>
                                        <td>Descrição</td>
                                        <td><input type="text" name="descricao" class="form-control"/></td>
                                    </tr>
                                    <tr><td>Observação</td>
                                        <td><input type="text" name="observacao" class="form-control"/></td>
                                    </tr>
                                </table>
                                <button type="submit" class="btn btn-primary">Registrar</button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
