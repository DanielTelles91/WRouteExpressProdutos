<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Route Express Beer - Sua loja de cervejas online!</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/footer.css">
        <!-- jQuery lib -->		
        <script type="text/javascript" src="js/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <link href="css/barra.css" rel="stylesheet" >

        <link href="css/style.css" rel="stylesheet">       
        <script defer src="js/custom.js"></script>


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

        <style rel="stylesheet" type="text/css">
            #wrapper {
                padding-left: 0;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;

            }
            #wrapper.toggled {
                padding-left: 250px;

            }
            #sidebar-wrapper {
                z-index: 1000;
                position: fixed;
                left: 250px;
                width: 0;
                height: 90%;

                margin-left: -250px;
                overflow-y: auto;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }
            #wrapper.toggled #sidebar-wrapper {
                width: 250px;
            }
            #page-content-wrapper {
                width: 100%;
                position: absolute;
                padding: 15px;
            }
            #wrapper.toggled #page-content-wrapper {
                position: relative;
                margin-right: -250px;
            }


            @media(min-width:992px) {
                #wrapper {
                    padding-left: 250px;
                }
                #wrapper.toggled {
                    padding-left: 0;
                }
                #sidebar-wrapper {
                    width: 250px;
                }
                #wrapper.toggled #sidebar-wrapper {
                    width: 0;
                }
                #page-content-wrapper {
                    padding: 20px;
                    position: relative;
                }
                #wrapper.toggled #page-content-wrapper {
                    position: relative;
                    margin-right: 0;
                }



                .navbar-login
                {
                    width: 305px;
                    padding: 10px;
                    padding-bottom: 0px;
                }

                .navbar-login-session
                {
                    padding: 10px;
                    padding-bottom: 0px;
                    padding-top: 0px;
                }

                .icon-size
                {
                    font-size: 87px;
                }
            }
        </style>
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

                $("#menu-toggle").click(function (e) {
                    e.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                });



                $('img').css({'margin-left': 'auto', 'margin-right': 'auto'});

                $('figcaption').css('height', '45px');

                $('div.cor').css({width: '10px', height: '10px', display: 'inline-block'});

                $('div.cor').css({'border-radius': '50%', '-moz-border-radius': '50%', '-webkit-border-radius': '50%'});

                $('.title, .desc').css({height: '55px', color: '#002447'});

                $('.list-group').css('margin-bottom', '0px');

                $('.letra-destaque').css('fontWeight', 'bold');

                $('a:link').css('textDecoration', 'none');

                $('.voltar-ao-topo').css('marginTop', '50px');

                $(window).scroll(function () {
                    if ($(this).scrollTop() > 1) {
                        $('header').addClass("sticky");
                    }
                    else {
                        $('header').removeClass("sticky");
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

                    <a href="#menu-toggle" id="menu-toggle" class="col-xs-2">
                        <h3><span class="glyphicon glyphicon-menu-hamburger"></span></h3>                      
                    </a>
                    <a class="col-xs-10" href="ServletListarProdutos?acao=listar">
                        <h3>Route Express Beer</h3>
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


        <div class="container">
            <div id="wrapper">
                <!-- Coluna pesquisa -->               
                <div id="sidebar-wrapper">
                    <div class="list-group">
                        <a href="" class="list-group-item letra-destaque">Cervejarias</a>
                        <!-- Button trigger modal -->
                        <button type="button" class="list-group-item letra-destaque" data-toggle="modal" data-target="#myModal1">
                            Veja mais
                        </button>
                        <c:forEach items="${cervejarias}" var="listaCervejarias" begin="0" end="4">
                            <a href="ServletListarProdutos?acao=cervejaria&cervejaria=${listaCervejarias}" class="list-group-item">${listaCervejarias}</a>
                        </c:forEach>
                    </div>
                    <div class="list-group">
                        <a href="" class="list-group-item letra-destaque">Pais</a>
                        <!-- Button trigger modal -->
                        <button type="button" class="list-group-item letra-destaque" data-toggle="modal" data-target="#myModal2">
                            Veja mais
                        </button>
                        <c:forEach items="${paises}" var="listaPaises" begin="0" end="4">
                            <a href="ServletListarProdutos?acao=pais&pais=${listaPaises}" class="list-group-item">${listaPaises}</a>
                        </c:forEach>
                    </div>
                    <ul class="list-group">
                        <a href="" class="list-group-item letra-destaque">Preco</a>
                        <!-- Button trigger modal -->
                        <button type="button" class="list-group-item letra-destaque" data-toggle="modal" data-target="#myModal3">
                            Filtrar
                        </button>
                        <a href="ServletListarProdutos?acao=preco&preco=1" class="list-group-item">Menor que R$ 15</a>
                        <a href="ServletListarProdutos?acao=preco&preco=2" class="list-group-item">Entre R$ 15 e R$ 30</a>
                        <a href="ServletListarProdutos?acao=preco&preco=3" class="list-group-item">Entre R$ 30 e R$ 50</a>
                        <a href="ServletListarProdutos?acao=preco&preco=4" class="list-group-item">Entre R$ 50 e R$ 100</a>
                        <a href="ServletListarProdutos?acao=preco&preco=5" class="list-group-item">Maior que R$ 100</a>
                    </ul>
                    <ul class="list-group">
                        <a href="" class="list-group-item letra-destaque">Volume ml</a>
                        <!-- Button trigger modal -->
                        <button type="button" class="list-group-item letra-destaque" data-toggle="modal" data-target="#myModal4">
                            Veja mais
                        </button>
                        <c:forEach items="${volume}" var="listaVolume" begin="0" end="4">
                            <a href="ServletListarProdutos?acao=volume&volume=${listaVolume}" class="list-group-item">${listaVolume} ml</a>
                        </c:forEach>
                    </ul>
                </div>
                <!-- Conteudo pagina -->
                <div id="page-content-wrapper">
                    <br>
                    <br>
                    <div class="row">
                        <c:forEach items="${cervejas}" var="produtos">
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <!-- img -->
                                <img src="imagens/${produtos.imagem1}" class="img-responsive" alt="imagens/" title=""/>
                                <div>
                                    Pais <span class="pais">${produtos.pais}</span> 
                                    Cor 
                                    <div class="cor" style="background-color:${produtos.cor}"></div>
                                    Teor <span class="teor">${produtos.teor}</span>% Temp <span class="temperatura">${produtos.temperatura}</span>°C
                                </div>
                                <!-- data -->
                                <p class="title">${produtos.cervejaria}</p>
                                <p class="desc">${produtos.rotulo}</p>
                                <c:set var="valorDe" value="${produtos.preco + (produtos.preco / 100 * 5)}" />
                                <c:set var="valorPara" value="${produtos.preco}" />
                                <p class="col-xs-6">
                                    De: 
                                <s>
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber value="${valorDe}" type="currency"/>
                                </s>
                                </p>
                                <p class="col-xs-6">
                                    Para: 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber value="${valorPara}" type="currency"/>
                                </p>
                                <a class="btn btn-primary col-xs-5" href="ServletListarProdutos?acao=detalhar&id=${produtos.idCerveja}" role="button">Detalhes</a>
                            </div>
                        </c:forEach>
                    </div>
                    <footer>
                        <div class="container">
                            <div class="row">
                                <a href="#page-content-wrapper" class="btn btn-warning voltar-ao-topo" role="button">Voltar ao topo!</a>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Cervejarias</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <c:forEach items="${cervejarias}" var="listaCervejarias">
                                <a href="ServletListarProdutos?acao=cervejaria&cervejaria=${listaCervejarias}" class="list-group-item col-xs-4">${listaCervejarias}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Paises</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <c:forEach items="${paises}" var="listaPaises">
                                <a href="ServletListarProdutos?acao=pais&pais=${listaPaises}" class="list-group-item col-xs-4">${listaPaises}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Preco</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ServletListarProdutos" method="get" class="form-inline">
                            <input type="hidden" name="acao" value="preco">
                            <input type="hidden" name="preco" value="6">
                            <div class="form-group">
                                <label for="minimo">Minimo</label>                        
                                <input type="number" class="form-control" id="minimo" name="precominimo" min="0" max="999" required=""/>
                            </div>
                            <div class="form-group">
                                <label for="maximo">Maximo</label>                        
                                <input type="number" class="form-control" id="maximo" name="precomaximo" min="1" max="1000" required=""/>
                            </div>
                            <hr />
                            <div class="form-group">
                                <button type="reset" class="btn btn-danger" role="button">Apagar</button>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success" role="button">Pesquisar</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Volume</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <c:forEach items="${volume}" var="listaVolume">
                                <a href="ServletListarProdutos?acao=volume&volume=${listaVolume}" class="list-group-item col-xs-4">${listaVolume} ml</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        
        <footer style="background-color: #000000">
              <div class=" menuopcoes">
                <a href="errorpage.jsp">| Tela inicial</a>
                <a href="LoginSuccess.jsp">|Meus Pedidos</a>
                <a href="errorpage.jsp">|Carrinho|</a>


            </div>

            <div class="container">
                <div class="row">
                    <div class="col-xs-12" style="text-align: center">
                        <p >RouteExpress © - 2015</p>
                        <p>Powered by <strong><a href="#" target="_blank">Route Express Solutions</a></strong></p>
                        <img class="img-thumbnail imgfoot" src="img/thumbs/cartoes.png">
                        <img class="img-thumbnail imgfoot" src="img/thumbs/barradecodigo.jpg">
                    </div>

                    <div class="container">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                       

                    </div>
                    <div id="coluna">
                        <label>Contatos</label><p>São Paulo : 4002-8922</p>
                    </div>
                    
                </div>
            </div>

          
         </footer>
  
        
    </body>
</html>

