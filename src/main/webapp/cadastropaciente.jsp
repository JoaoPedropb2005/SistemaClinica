<%-- 
    Document   : cadastropaciente
    Created on : 5 de nov. de 2025, 21:55:57
    Author     : jppb2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="mb-3">${(requestScope.paciente ne null)?'Alterar':'Cadastro de novo'} Paciente!</h1>
        
<form method="post" action="PacienteServlet">
    
    ${(requestScope.paciente ne null)?'<input type="hidden" name="op" value="alterar"/>':''}

    <div class="mb-2">
        CPF: <input type="text" name="cpf" class="form-control"
                    ${(requestScope.paciente ne null)?'readonly="true" value="'
                            .concat(requestScope.paciente.cpf).concat('"'):''} />
    </div>
    <div class="mb-2">
        Nome: <input type="text" name="nome" class="form-control" 
                     value="${(requestScope.paciente ne null)?requestScope.paciente.nome:''}" />
    </div>
    <div class="mb-2">
        Endereço: <input type="text" name="endereco" class="form-control" 
                        value="${(requestScope.paciente ne null)?requestScope.paciente.endereco:''}" />
    </div>
    <div class="mb-2">
        Contato: <input type="text" name="contato" class="form-control" 
                       value="${(requestScope.paciente ne null)?requestScope.paciente.contato:''}" />
    </div>
    <div class="mb-2">
        Plano de Saúde: <input type="text" name="planoSaude" class="form-control" 
                              value="${(requestScope.paciente ne null)?requestScope.paciente.planoSaude:''}" />
    </div>

    <button class="btn btn-primary">${(requestScope.paciente ne null)?'Alterar':'Cadastrar'}</button>
</form>
