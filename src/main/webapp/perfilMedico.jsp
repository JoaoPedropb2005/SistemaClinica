<%-- 
    Document   : perfilMedico
    Created on : 13 de nov. de 2025, 18:07:29
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu Perfil</title>
    </head>
    <body>
        <jsp:include page="menuMedico.jsp"/>

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2>Meus Dados</h2>
                    <form method="Post" action="MedicoServlet">
                        <input type='hidden' name='op' value='alterarPerfil'/>
                        
                        <div class="mb-3">
                            <label for="crm" class="form-label">CRM</label>
                            <input type="text" name="crm" id="crm" class="form-control" readonly="true"
                                   value='${sessionScope.medicoLogado.crm}'/>
                        </div>
                        <div class="mb-3">
                            <label for="nome" class="form-label">Nome</label>
                            <input type="text" name="nome" id="nome" class="form-control"
                                   value='${sessionScope.medicoLogado.nome}'/>
                        </div>
                        <div class="mb-3">
                            <label for="especialidade" class="form-label">Especialidade</label>
                            <input type="text" name="especialidade" id="especialidade" class="form-control"
                                   value='${sessionScope.medicoLogado.especialidade}'/>
                        </div>
                        <div class="mb-3">
                            <label for="contato" class="form-label">Contato</label>
                            <input type="text" name="contato" id="contato" class="form-control"
                                   value='${sessionScope.medicoLogado.contato}'/>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
