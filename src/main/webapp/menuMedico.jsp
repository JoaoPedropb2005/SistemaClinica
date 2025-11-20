<%-- 
    Document   : menuMedico
    Created on : 13 de nov. de 2025, 18:24:25
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.medicoLogado == null}">
    <script>location.href = "LoginMedico.jsp"</script>
</c:if>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="MedicoServlet">Clínica</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMedico">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMedico">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <button class="btn btn-info" data-bs-toggle="modal"
                            data-bs-target='#modalConsulta'>Marcar Consulta</button>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ConsultaServlet?op=listarRealizadas">Prontuários Realizados</a>
                </li>
            </ul>

            <div class="d-flex">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            Bem vindo, Dr. ${sessionScope.medicoLogado.nome}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="MedicoServlet?op=perfil">Meu Perfil</a></li>
                            <li><a class="dropdown-item" href="#" data-bs-toggle='modal'
                                   data-bs-target="#modalAlterarSenha">Alterar Senha</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="MedicoServlet?op=logout">Sair</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="modal fade" id="modalAlterarSenha" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Alterar Senha</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="MedicoServlet">
                    <input type="hidden" name="op" value="alterarSenha"/>
                    <div class="mb-3">
                        <label for="atual" class="form-label">Senha Atual</label>
                        <input type="password" name="atual" id="atual" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label for="nova" class="form-label">Nova Senha</label>
                        <input type="password" name="nova" id="nova" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label for="confirm" class="form-label">Confirmação</label>
                        <input type="password" name="confirm" id="confirm" class="form-control" required/>
                    </div>
                    <button type_submit" class="btn btn-primary">Alterar</button>
                </form>
            </div>
        </div>
    </div>
</div>
