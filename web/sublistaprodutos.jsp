<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Route Express Beer - Sua loja de cervejas online!</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- font libs -->
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />
        <!-- demo page styles -->
        <link href="css/jplist.demo-pages.min.css" rel="stylesheet" type="text/css" />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <!-- jQuery lib -->		
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <!-- jPList core js and css  -->
        <link href="css/jplist.core.min.css" rel="stylesheet" type="text/css" />
        <script src="js/jplist.core.min.js"></script>	
        <!-- jPList history bundle -->
        <script src="js/jplist.history-bundle.min.js"></script>
        <link href="css/jplist.history-bundle.min.css" rel="stylesheet" type="text/css" />
        <!-- jPList sort bundle -->
        <script src="js/jplist.sort-bundle.min.js"></script>
        <!-- jPList pagination bundle -->
        <script src="js/jplist.pagination-bundle.min.js"></script>
        <link href="css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />
        <!-- jPList textbox filter control -->
        <script src="js/jplist.textbox-filter.min.js"></script>
        <link href="css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />
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

                $('#demo').jplist({
                    itemsBox: '.list'
                    , itemPath: '.list-item'
                    , panelPath: '.jplist-panel'
                });

                $('img').css({'margin-left': 'auto', 'margin-right': 'auto'});

                $('figcaption').css('height', '45px');

                $('div.cor').css({width: '10px', height: '10px', display: 'inline-block'});

                $('div.cor').css({'border-radius': '50%', '-moz-border-radius': '50%', '-webkit-border-radius': '50%'});

                $('.cervejaria, .rotulo').css({height: '55px', color: '#002447'});

                $('a:link').css('textDecoration', 'none');

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

        <div class="container">
            <div class="page-header">
                <div class="row">

                </div>
            </div>
            <div class="box">
                <div class="center">
                    <div id="demo" class="box jplist" style="margin: 20px 0 50px 0">
                        <!-- ios button: show/hide panel -->
                        <div class="jplist-ios-button">
                            <i class="fa fa-sort"></i>
                            Pesquisar
                        </div>
                        <!-- panel -->
                        <div class="jplist-panel box panel-top">
                            <!-- back button button -->
                            <button 
                                type="button" 
                                data-control-type="back-button" 
                                data-control-name="back-button" 
                                data-control-action="back-button">
                                <i class="fa fa-arrow-left"></i> Voltar
                            </button>
                            <!-- reset button -->
                            <button 
                                type="button" 
                                class="jplist-reset-btn"
                                data-control-type="reset" 
                                data-control-name="reset" 
                                data-control-action="reset">
                                Zerar &nbsp;<i class="fa fa-share"></i>
                            </button>
                            <!-- items per page dropdown -->
                            <div 
                                class="jplist-drop-down" 
                                data-control-type="items-per-page-drop-down" 
                                data-control-name="paging" 
                                data-control-action="paging">
                                <ul>
                                    <li><span data-number="12" data-default="true"> 12 por pagina </span></li>
                                    <li><span data-number="24"> 24 por pagina </span></li>
                                    <li><span data-number="36"> 36 por pagina </span></li>
                                    <li><span data-number="48"> 48 por pagina </span></li>
                                    <li><span data-number="all"> Ver tudo </span></li>
                                </ul>
                            </div>
                            <!-- sort dropdown -->
                            <div 
                                class="jplist-drop-down" 
                                data-control-type="sort-drop-down" 
                                data-control-name="sort" 
                                data-control-action="sort"
                                data-datetime-format="{month}/{day}/{year}">
                                <!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->
                                <ul>
                                    <li><span data-path="default">Ordenar</span></li>
                                    <li><span data-path=".title" data-order="asc" data-type="text" data-default="true">ROTULO A-Z</span></li>
                                    <li><span data-path=".title" data-order="desc" data-type="text">ROTULO Z-A</span></li>
                                    <li><span data-path=".price" data-order="asc" data-type="number">PRECO <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".price" data-order="desc" data-type="number">PRECO <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".volume" data-order="asc" data-type="number">VOLUME <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".volume" data-order="desc" data-type="number">VOLUME <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".teor" data-order="asc" data-type="number">TEOR <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".teor" data-order="desc" data-type="number">TEOR <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".temperatura" data-order="asc" data-type="number">TEMPERATURA <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".temperatura" data-order="desc" data-type="number">TEMPERATURA <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                </ul>
                            </div>
                            <!-- filter by title -->
                            <div class="text-filter-box">
                                <i class="fa fa-search  jplist-icon"></i>
                                <!--[if lt IE 10]>
                                <div class="jplist-label">Filter by Title:</div>
                                <![endif]-->
                                <input 
                                    data-path=".cervejaria" 
                                    type="text" 
                                    value="" 
                                    placeholder="Busca por cervejaria" 
                                    data-control-type="textbox" 
                                    data-control-name="title-filter" 
                                    data-control-action="filter"
                                    />
                            </div>
                            <!-- filter by description -->
                            <div class="text-filter-box">
                                <i class="fa fa-search  jplist-icon"></i>
                                <!--[if lt IE 10]>
                                <div class="jplist-label">Filter by Description:</div>
                                <![endif]-->
                                <input 
                                    data-path=".rotulo" 
                                    type="text" 
                                    value="" 
                                    placeholder="Busca por rotulo" 
                                    data-control-type="textbox" 
                                    data-control-name="desc-filter" 
                                    data-control-action="filter"
                                    />	
                            </div>
                            <!-- pagination results -->
                            <div 
                                class="jplist-label" 
                                data-type="Page {current} of {pages}" 
                                data-control-type="pagination-info" 
                                data-control-name="paging" 
                                data-control-action="paging">
                            </div>
                            <!-- pagination control -->
                            <div 
                                class="jplist-pagination" 
                                data-control-type="pagination" 
                                data-control-name="paging" 
                                data-control-action="paging">
                            </div>
                        </div>
                        <div class="list box text-shadow">
                            <div class ="row">
                                <c:forEach items="${cervejas}" var="produtos">
                                    <div class="list-item box col-xs-12 col-sm-6 col-md-3">
                                        <!-- img -->
                                        <img src="imagens/${produtos.imagem1}" class="img-responsive" alt="imagens/" title=""/>
                                        <div>
                                            Pais <span class="pais">${produtos.pais}</span> 
                                            Cor 
                                            <div class="cor" style="background-color:${produtos.cor}"></div>
                                            Teor <span class="teor">${produtos.teor}</span>% Temp <span class="temperatura">${produtos.temperatura}</span>°C
                                        </div>
                                        <!-- data -->
                                        <p class="cervejaria">${produtos.cervejaria}</p>
                                        <p class="rotulo title">${produtos.rotulo}</p>
                                        <p class="hidden volume">${produtos.volume}</p>
                                        <c:set var="valorDe" value="${produtos.preco + (produtos.preco / 100 * 5)}" />
                                        <c:set var="valorPara" value="${produtos.preco}" />
                                        <p class="col-xs-6">
                                            De: 
                                        <s>
                                            <fmt:setLocale value="pt_BR"/>
                                            <fmt:formatNumber value="${valorDe}" type="currency"/>
                                        </s>
                                        </p>
                                        <p class="col-xs-6 price">
                                            Para: 
                                            <fmt:setLocale value="pt_BR"/>
                                            <fmt:formatNumber value="${valorPara}" type="currency"/>
                                        </p>
                                        <a class="btn btn-primary btn-sm col-xs-5" href="ServletListarProdutos?acao=detalhar&id=${produtos.idCerveja}" role="button">Ver detalhes</a>                                       
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="box jplist-no-results text-shadow align-center">
                            <p>Sem Resultados</p>
                        </div>
                        <!-- ios button: show/hide panel -->
                        <div class="jplist-ios-button">
                            <i class="fa fa-sort"></i>
                            Pesquisar
                        </div>
                        <!-- panel -->
                        <div class="jplist-panel box panel-bottom">
                            <!-- items per page dropdown -->
                            <div 
                                class="jplist-drop-down" 
                                data-control-type="items-per-page-drop-down" 
                                data-control-name="paging" 
                                data-control-action="paging"
                                data-control-animate-to-top="true">
                                <ul>
                                    <li><span data-number="12" data-default="true"> 12 por pagina </span></li>
                                    <li><span data-number="24"> 24 por pagina </span></li>
                                    <li><span data-number="36"> 36 por pagina </span></li>
                                    <li><span data-number="48"> 48 por pagina </span></li>
                                    <li><span data-number="all"> Ver tudo </span></li>
                                </ul>
                            </div>
                            <!-- sort dropdown -->
                            <div 
                                class="jplist-drop-down" 
                                data-control-type="sort-drop-down" 
                                data-control-name="sort" 
                                data-control-action="sort"
                                data-control-animate-to-top="true"
                                data-datetime-format="{month}/{day}/{year}">
                                <!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->
                                <ul>
                                    <li><span data-path="default">Ordenar</span></li>
                                    <li><span data-path=".title" data-order="asc" data-type="text" data-default="true">ROTULO A-Z</span></li>
                                    <li><span data-path=".title" data-order="desc" data-type="text">ROTULO Z-A</span></li>
                                    <li><span data-path=".price" data-order="asc" data-type="number">PRECO <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".price" data-order="desc" data-type="number">PRECO <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".volume" data-order="asc" data-type="number">VOLUME <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".volume" data-order="desc" data-type="number">VOLUME <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".teor" data-order="asc" data-type="number">TEOR <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".teor" data-order="desc" data-type="number">TEOR <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".temperatura" data-order="asc" data-type="number">TEMPERATURA <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span></span></li>
                                    <li><span data-path=".temperatura" data-order="desc" data-type="number">TEMPERATURA <span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span></span></li>
                                </ul>
                            </div>
                            <!-- pagination results -->
                            <div 
                                class="jplist-label" 
                                data-type="{start} - {end} of {all}"
                                data-control-type="pagination-info" 
                                data-control-name="paging" 
                                data-control-action="paging">
                            </div>
                            <!-- pagination -->
                            <div 
                                class="jplist-pagination" 
                                data-control-animate-to-top="true"
                                data-control-type="pagination" 
                                data-control-name="paging" 
                                data-control-action="paging">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

