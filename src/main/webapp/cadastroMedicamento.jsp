<%-- 
    Document   : cadastroMedicamento
    Created on : 5 de nov. de 2025, 21:57:18
    Author     : jppb2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="mb-3">${(requestScope.medicamento ne null)?'Alterar':'Cadastro de novo'} Medicamento!</h1>
        
<form method="post" action="MedicamentoServlet">
    
    ${(requestScope.medicamento ne null)?'<input type="hidden" name="op" value="alterar"/>':''}

    <div class="mb-2">
        Código: <input type="number" name="codigo" class="form-control"
                       ${(requestScope.medicamento ne null)?'readonly="true" value="'
                               .concat(requestScope.medicamento.codigo).concat('"'):''} />
    </div>
    <div class="mb-2">
        Nome: <input type="text" name="nome" class="form-control" 
                     value="${(requestScope.medicamento ne null)?requestScope.medicamento.nome:''}" />
    </div>
    <div class="mb-2">
        Dosagem: <input type="number" name="dosagem" class="form-control" 
                        value="${(requestScope.medicamento ne null)?requestScope.medicamento.dosagem:''}" />
    </div>
    <div class="mb-2">
        Tipo Dosagem (ex: mg, ml): <input type="text" name="tipoDosagem" class="form-control" 
                                           value="${(requestScope.medicamento ne null)?requestScope.medicamento.tipoDosagem:''}" />
    </div>
    <div class="mb-2">
        Observação: <textarea name="observacao" class="form-control">${(requestScope.medicamento ne null)?requestScope.medicamento.observacao:''}</textarea>
    </div>

    <button class="btn btn-primary">${(requestScope.medicamento ne null)?'Alterar':'Cadastrar'}</button>
</form>
