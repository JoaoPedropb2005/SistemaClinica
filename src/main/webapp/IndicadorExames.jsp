<%-- 
    Document   : IndicadorExames
    Created on : 5 de nov. de 2025, 21:53:50
    Author     : jppb2
--%>

<%@page import="com.mycompany.sistemadeclinica.negocio.IndicadorExame"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Indicadores de Exame</title>
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
            
                // CORREÇÃO: Pega a lista de indicadores da SESSÃO
                List<IndicadorExame> indicadorExames = (List) session.getAttribute("IndicadorExames");
            %>

            <h1>Indicadores de Exame Cadastrados</h1>
            <a href="#" class="btn btn-success"
               data-bs-toggle="modal" data-bs-target="#modalIndicadorExame">
                Cadastrar Novo Indicador
            </a>
            
            <%
                if (indicadorExames == null || indicadorExames.isEmpty()) {
            %>
            <h4 class="mt-3">Não existem indicadores cadastrados</h4>
            <%
                } else {
            %>
            <table class="table table-striped mt-3">
                <tr>
                    <th>Código</th>
                    <th>Indicador</th>
                    <th>Descrição</th>
                    <th>Valor Mín.</th>
                    <th>Valor Máx.</th>
                    <th>Ações</th>
                </tr>

                <%
                    for (IndicadorExame i : indicadorExames) {
                %>
                <tr>
                    <td><%= i.getCodigo()%></td>
                    <td><%= i.getIndicador()%></td>
                    <td><%= i.getDescricao()%></td>
                    <td><%= i.getMinValorReferencia()%></td>
                    <td><%= i.getMaxValorReferencia()%></td>
                    <td>
                        <a href="IndicadorExameServlet?codigo=<%= i.getCodigo()%>&op=alterar"
                           class="btn btn-info btn-sm">alterar</a>
                        <a href="IndicadorExameServlet?codigo=<%= i.getCodigo()%>&op=deletar"
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

            <div class="modal fade" id="modalIndicadorExame" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastroIndicadorExame.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
