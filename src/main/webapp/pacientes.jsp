<%-- 
    Document   : pacientes
    Created on : 5 de nov. de 2025, 21:51:28
    Author     : jppb2
--%>

<%@page import="com.mycompany.sistemadeclinica.negocio.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Pacientes</title>
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
            
                List<Paciente> pacientes = (List) session.getAttribute("pacientes");
            %>

            <h1>Pacientes Cadastrados</h1>
            <a href="#" class="btn btn-success"
               data-bs-toggle="modal" data-bs-target="#modalPaciente">
                Cadastrar Novo Paciente
            </a>
            
            <%
                if (pacientes == null || pacientes.isEmpty()) {
            %>
            <h4 class="mt-3">Não existem pacientes cadastrados</h4>
            <%
                } else {
            %>
            <table class="table table-striped mt-3">
                <tr>
                    <th>CPF</th>
                    <th>Nome</th>
                    <th>Endereço</th>
                    <th>Contato</th>
                    <th>Plano de Saúde</th>
                    <th>Ações</th>
                </tr>

                <%
                    for (Paciente p : pacientes) {
                %>
                <tr>
                    <td><%= p.getCpf()%></td>
                    <td><%= p.getNome()%></td>
                    <td><%= p.getEndereco()%></td>
                    <td><%= p.getContato()%></td>
                    <td><%= p.getPlanoSaude()%></td>
                    <td>
                        <a href="PacienteServlet?cpf=<%= p.getCpf()%>&op=alterar"
                           class="btn btn-info btn-sm">alterar</a>
                        <a href="PacienteServlet?cpf=<%= p.getCpf()%>&op=deletar"
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

            <div class="modal fade" id="modalPaciente" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastropaciente.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
