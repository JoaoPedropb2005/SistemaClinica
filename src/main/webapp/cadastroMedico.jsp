<%-- 
    Document   : cadastroMedico
    Created on : 5 de nov. de 2025, 21:56:46
    Author     : jppb2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<h1 class="mb-3">${(requestScope.medico ne null)?'Alterar':'Cadastro de novo'} Médico!</h1>
        
<form method="post" action="MedicoServlet">
    
    ${(requestScope.medico ne null)?'<input type="hidden" name="op" value="alterar"/>':''}

    <div class="mb-2">
        CRM: <input type="text" name="crm" class="form-control"
                    ${(requestScope.medico ne null)?'readonly="true" value="'
                            .concat(requestScope.medico.crm).concat('"'):''} />
    </div>
    <div class="mb-2">
        Nome: <input type="text" name="nome" class="form-control" 
                     value="${(requestScope.medico ne null)?requestScope.medico.nome:''}" />
    </div>
    <div class="mb-2">
        Especialidade: <input type="text" name="especialidade" class="form-control" 
                              value="${(requestScope.medico ne null)?requestScope.medico.especialidade:''}" />
    </div>
    <div class="mb-2">
        Contato: <input type="text" name="contato" class="form-control" 
                       value="${(requestScope.medico ne null)?requestScope.medico.contato:''}" />
    </div>

    <button class="btn btn-primary">${(requestScope.medico ne null)?'Alterar':'Cadastrar'}</button>
</form>
