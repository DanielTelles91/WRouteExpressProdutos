<%-- 
    Document   : editarCliente
    Created on : 07/09/2015, 00:49:28
    Author     : DANIEL
--%>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar dados cadastrais</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">       
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>	
        <link href="css/style.css" rel="stylesheet">       
        <script defer src="js/custom.js"></script>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/barra.css" rel="stylesheet" type="text/css" />

        <%
            //allow access only if session exists
            String email = "";

            String user = (String) session.getAttribute("user");
            String cpff = (String) session.getAttribute("cpff");
            email = (String) session.getAttribute("email");

            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionID = cookie.getValue();
                    }
                }
            }
        %>

        <script type="text/javascript">
            $('document').ready(function () {

                $(document).ready(function () {
                    x = $(<%=user%>).text();
                    if (x === null) {
                        $("#testeentrar").hide();
                        $("#teste").show();

                    }
                    else {
                        $("#testeentrar").show();
                        $("#teste").hide();


                    }
                });
            });
        </script>
    </head>
    <body>

        <header><div class="navbar navbar-default  navbar-fixed-top" role="navigation">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>


                    <a class="col-xs-14" href="ServletListarProdutos?acao=listar">
                        <h3> Route Express Beer</h3>
                    </a>
                </div>
                <div class="collapse navbar-collapse">

                    <ul class="nav navbar-nav">
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Sobre</a></li>
                    </ul>

                    <div class="col-sm-3 col-md-3 pull-left">
                        <form action="ServletListarProdutos" method="get" role="search">
                            <input type="hidden" name="acao" value="pesquisar">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Procure por cervejaria e rotulo" name="pesquisa">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <ul class="nav navbar-nav">

                        <li class="dropdown" id="testeentrar">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Entrar </a>
                            <ul class="dropdown-menu">
                                <li><a href="loginusuario.html">Login</a></li>
                                <li><a href="cadastrocliente.jsp">Cadastro</a></li>  
                            </ul>
                        </li>

                        <li class="dropdown" id="teste">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user"></span> 
                                <strong><%=user%></strong>
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="navbar-login">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <p class="text-center">
                                                    <span class="glyphicon glyphicon-user icon-size"></span>
                                                </p>
                                            </div>
                                            <div class="col-lg-8">
                                                <p class="text-left"><strong><%=user%></strong></p>
                                                <p class="text-left small"><%=email%></p>
                                                <p class="text-left">
                                                    <a href="ServletCliente?acao=detalhar" class="btn btn-primary btn-block btn-sm">Meu Cadastro</a>
                                                    <a href="#" class="btn btn-primary btn-block btn-sm">Meus Pedidos</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="navbar-login navbar-login-session">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <p>
                                                <form action="LogoutServlet" method="post">
                                                    <input type="submit" class="btn btn-danger btn-block" value="Sair" >
                                                </form>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <ul class="nav navbar-nav navbar-right">

                            <li class="dropdown hover topcart">
                                <a  class="dropdown-toggle" href="#">
                                    <i class="carticon"></i> Meu Carrinho <span class="label label-success font14">${fn:length(sessionScope.carrinho)} item(s)</span><b class="caret"></b></a>
                                <ul class="dropdown-menu topcartopen">
                                    <li>
                                        <div style="overflow: auto; width: 440px; height: 300px; ">
                                            <div class="table-responsive"> 
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>Descrição</th>
                                                            <th>Preço</th>
                                                            <th>Quantidade</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.carrinho}" var="prodCarr">
                                                            <tr>
                                                                <td class="nomargin"> <img src="imagens/${prodCarr.imagem1}" alt="..." class="img-thumbnail" height="100px" width="100px"  />  </td>                                                                   
                                                                <td class="nomargin">${prodCarr.rotulo}</td>                                     
                                                                <td data-th="Price">${prodCarr.preco}</td>
                                                                <td data-th="Price">${prodCarr.quantidade}</td>
                                                            </tr>
                                                        </c:forEach> 
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="well pull-right">
                                            <a href="ServletCarrinho" class="btn btn-success">Ver Carrinho</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                    </ul>


                </div>
            </div></header> 
        <br>
        <br>
        <br>
        <br>

        <div id="main" class="container-fluid">

            <h3 class="page-header">Editar Cadastro</h3>

            <form action="ServletCliente?acao=editar&cpf=${clientes.getCpf()}" method="post">

                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="exampleInputEmail1">Nome</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="enome" value=${clientes.getfirstNome()}>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="exampleInputEmail1">Sobrenome</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="esobrenome" value="${clientes.getlastNome()}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="exampleInputEmail1">Sexo</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="esexo" value="${clientes.getSexo()}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="eemail" value="${clientes.getEmail()}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="exampleInputEmail1">CPF</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="ecpf" value="${clientes.getCpf()} " readonly="readonly">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="exampleInputEmail1">Telefone</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="etelefone" value="${clientes.getTelefone()} ">
                    </div>
                </div>


                <c:forEach items="${enderecos}" var="enderecos">
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">CEP</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="ecep" value="${enderecos.getCep()}">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">Tipo de Logradouro</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="etipologradouro" value="${enderecos.getTipoLogradouro()}">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">Logradouro</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="elogradouro" value="${enderecos.getLogradouro()}">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">Número do Logradouro</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="enumerologradouro" value="${enderecos.getLogradouroNumero()}">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">Bairro</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="ebairro" value="${enderecos.getBairro()}">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">Cidade</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="ecidade" value="${enderecos.getCidade()}">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">Estado</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="eestado" value="${enderecos.getEstado()}">
                        </div>
                    </div>
                </c:forEach>
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Atualizar Dados</button>
                        <a href="ServletListarProdutos?acao=listar" class="btn btn-default">Cancelar</a>
                    </div>
                </div>

            </form>
        </div>
     
    </body>
</html>


