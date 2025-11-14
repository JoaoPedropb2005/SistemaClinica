<%-- 
    Document   : LoginMedico
    Created on : 13 de nov. de 2025, 17:25:59
    Author     : jppb2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <title>Login - Sistema de Clínica</title>

    </head>
    <body class="text-center">
        
        <c:if test="${sessionScope.medicoLogado ne null}">
            <c:redirect url="MedicoServlet"/>
        </c:if>
        
       <h1>Bem vindo Doutor(a)</h1>
        <section class="w-100 p-4 d-flex justify-content-center pb-4">
            <form method="post" action="MedicoServlet" style="width: 22rem;">
                <input type="hidden" name="op" value="login"/>
                
                <div data-mdb-input-init="" class="form-outline mb-4" data-mdb-input-initialized="true">
                    <input type="text" name="crm" id="form2Example1" class="form-control">
                    <label class="form-label" for="form2Example1" style="margin-left: 0px;">CRM</label>
                    <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 88.8px;"></div><div class="form-notch-trailing"></div></div></div>

                <div data-mdb-input-init="" class="form-outline mb-4" data-mdb-input-initialized="true">
                    <input type="password" name="senha" id="form2Example2" class="form-control">
                    <label class="form-label" for="form2Example2" style="margin-left: 0px;">Password</label>
                    <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 64.8px;"></div><div class="form-notch-trailing"></div></div></div>

             
                <button type="submit" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-primary btn-block mb-4" data-mdb-button-initialized="true">Sign in</button>

                <div class="text-center">
                    <p>Not a member? <a href="#!" 
                            data-bs-toggle="modal" data-bs-target="#modalCadastro">Register</a></p>
                    <p>or sign up with:</p>
                    <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                        <i class="fab fa-facebook-f"></i>
                    </button>

                    <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                        <i class="fab fa-google"></i>
                    </button>

                    <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                        <i class="fab fa-twitter"></i>
                    </button>

                    <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                        <i class="fab fa-github"></i>
                    </button>
                </div>
            </form>
        </section>
        
        <c:if test="${sessionScope.msg ne null}">
            <span class="alert alert-${(sessionScope.svd eq 'ok')?'success':'danger'}">${sessionScope.msg}</span>
            <c:remove var="msg" scope="session"/>
            <c:remove var="svd" scope="session"/>
        </c:if>
        
        
        <div class="modal fade" id="modalCadastro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cadastro de Médico</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="MedicoServlet">
                            <table class="table">
                                <tr>
                                    <td>Crm</td>
                                    <td><input type="text" name="crm" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Nome</td>
                                    <td><input type="text" name="nome" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>especialidade</td>
                                    <td><input type="text" name="especialidade" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Contato</td>
                                    <td><input type="text" name="contato" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Senha</td>
                                    <td><input type="password" name="senha" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Confirmação</td>
                                    <td><input type="password" name="confirm" class="form-control"/></td>
                                </tr>
                            </table>
                            <button class="btn btn-primary">registrar</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
