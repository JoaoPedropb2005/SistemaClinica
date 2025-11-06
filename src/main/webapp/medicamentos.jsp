<%-- 
    Document   : medicamentos
    Created on : 5 de nov. de 2025, 21:53:20
    Author     : jppb2
--%>

<%@page import="com.mycompany.sistemadeclinica.negocio.Medicamento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Medicamentos</title>
    </head>
    <body>
        <div class="container">
            <%
                String msg = (String) session.getAttribute("msg");
                if (msg != null) {
            %>
            <div class="alert alert-success mt-2"><%= msg %></div>
            <%
                    session.removeAttribute("msg");
                }
            
                // CORREÇÃO: Pega a lista de medicamentos da SESSÃO
                List<Medicamento> medicamentos = (List) session.getAttribute("medicamentos");
            %>

            <h1>Medicamentos Cadastrados</h1>
            <a href="#" class="btn btn-success"
               data-bs-toggle="modal" data-bs-target="#modalMedicamento">
                Cadastrar Novo Medicamento
            </a>
            
            <%
                if (medicamentos == null || medicamentos.isEmpty()) {
            %>
            <h4 class="mt-3">Não existem medicamentos cadastrados</h4>
            <%
                } else {
            %>
            <table class="table table-striped mt-3">
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Dosagem</th>
                    <th>Tipo</th>
                    <th>Observação</th>
                    <th>Ações</th>
                </tr>

                <%
                    for (Medicamento m : medicamentos) {
                %>
                <tr>
                    <td><%= m.getCodigo()%></td>
                    <td><%= m.getNome()%></td>
                    <td><%= m.getDosagem()%></td>
                    <td><%= m.getTipoDosagem()%></td>
                    <td><%= m.getObservacao()%></td>
                    <td>
                        <a href="MedicamentoServlet?codigo=<%= m.getCodigo()%>&op=alterar"
                           class="btn btn-info btn-sm">alterar</a>
                        <a href="MedicamentoServlet?codigo=<%= m.getCodigo()%>&op=deletar"
                           class="btn btn-warning btn-sm">deletar</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                }
            %>

            <div class="modal fade" id="modalMedicamento" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastroMedicamento.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
