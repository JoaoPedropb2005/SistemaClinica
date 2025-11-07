<%-- 
    Document   : cadastroIndicadorExame
    Created on : 5 de nov. de 2025, 21:58:01
    Author     : jppb2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Este arquivo SÓ deve ser incluído, nunca acessado diretamente --%>
<head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<h1 class="mb-3">${(requestScope.indicadorExame ne null)?'Alterar':'Cadastro de novo'} Indicador!</h1>
        
<form method="post" action="IndicadorExameServlet">
    
    ${(requestScope.indicadorExame ne null)?'<input type="hidden" name="op" value="alterar"/>':''}

    <div class="mb-2">
        Código: <input type="number" name="codigo" class="form-control"
                       ${(requestScope.indicadorExame ne null)?'readonly="true" value="'
                               .concat(requestScope.indicadorExame.codigo).concat('"'):''} />
    </div>
    <div class="mb-2">
        Indicador: <input type="text" name="indicador" class="form-control" 
                          value="${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.indicador:''}" />
    </div>
    <div class="mb-2">
        Descrição: <textarea name="descricao" class="form-control">${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.descricao:''}</textarea>
    </div>
    <div class="mb-2">
        Valor Mín. Referência: <input type="number" step="0.01" name="minValorReferencia" class="form-control" 
                                      value="${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.minValorReferencia:''}" />
    </div>
    <div class="mb-2">
        Valor Máx. Referência: <input type="number" step="0.01" name="maxValorReferencia" class="form-control" 
                                      value="${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.maxValorReferencia:''}" />
    </div>

    <button class="btn btn-primary">${(requestScope.indicadorExame ne null)?'Alterar':'Cadastrar'}</button>
</form>
