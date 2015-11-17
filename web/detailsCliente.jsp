<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detalhes do Cliente</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <div class="container">
        



            <div id="main" class="container-fluid">
                <h3 class="page-header">Detalhes Cadastrais</h3>


                <div id="list" class="row">
                    <div class="row">
                        <div class="col-md-4">

                            <p><strong>Nome</strong></p>
                            <p>${clientes.getfirstNome()}</p>

                        </div>	
                        <div class="col-md-4">
                            <p><strong>Sobrenome</strong></p>
                            <p>${clientes.getlastNome()}</p>
                        </div>

                        <div class="col-md-4">
                            <p><strong>Email</strong></p>
                            <p>${clientes.getEmail()}</p>
                        </div>

                        <div class="col-md-4">
                            <p><strong>CPF</strong></p>
                            <p>${clientes.getCpf()}</p>
                        </div>

                        <div class="col-md-4">
                            <p><strong>Telefone</strong></p>
                            <p>${clientes.getTelefone()}</p>
                        </div>

                        <div class="col-md-4">
                            <p><strong>Sexo</strong></p>
                            <p>${clientes.getSexo()}</p>
                        </div>

                        <div class="col-md-4">

                            <p><strong>Data de Nascimento</strong></p>
                            <p>${clientes.getDataNascimento()}</p>
                        </div>
                    </div>



                    <c:forEach items="${enderecos}" var="enderecos">
                        <div class="row">
                            <div class="col-md-4">
                                <p><strong>CEP</strong></p>
                                <p>${enderecos.getCep()}</p>
                            </div>

                            <div class="col-md-4">
                                <p><strong>Tipo Logradouro</strong></p>
                                <p>${enderecos.getTipoLogradouro()}</p>
                            </div>

                            <div class="col-md-4">
                                <p><strong>Logradouro</strong></p>
                                <p>${enderecos.getLogradouro()}</p>
                            </div>

                            <div class="col-md-4">
                                <p><strong>Número do Logradouro</strong></p>
                                <p>${enderecos.getLogradouroNumero()}</p>
                            </div>

                            <div class="col-md-4">
                                <p><strong>Bairro</strong></p>
                                <p>${enderecos.getBairro()}</p>
                            </div>

                            <div class="col-md-4">
                                <p><strong>Cidade</strong></p>
                                <p>${enderecos.getCidade()}</p>
                            </div>

                            <div class="col-md-4">
                                <p><strong>Estado</strong></p>
                                <p>${enderecos.getEstado()}</p>
                            </div>
                        </div>
                    </c:forEach>



                    <hr />
                    <div id="actions" class="row">
                        <div class="col-md-12">
                            <a href="ServletListarProdutos?acao=listar" class="btn btn-primary">Home</a>
                            <a href="ServletCliente?acao=editar"  class="btn btn-default">Editar</a>
                            <a href="ServletListaDeDesejos?acao=mostralista&idcliente=<c:out value="${sessionScope.usuario.id_Cliente}" />" class="btn btn-info">Minha lista de desejos</a>
                        </div>
                        
                    </div>
                </div>
              
                </body>
                </html>
