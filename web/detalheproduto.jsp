<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
   <head>
      <title>Route Express - Detalhe produto</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- Optional theme -->
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
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
         
             $('.navbar-inverse').css("color", "#eee");
         
             $('p.titulo').css('margin-top', '20px');
         
             $('div.cor').css({width: '40px', height: '40px', display: 'inline-block'});
         
             $('div.cor').css({'border-radius': '50%', '-moz-border-radius': '50%', '-webkit-border-radius': '50%'});
         
             $('quantidade').css('margin-top', '40px');
         
             $('input#quant').css('width', '100px');
               
         
         });
      </script>
   </head>
   <body>
      <header>
         <div class="navbar navbar-default  navbar-fixed-top" role="navigation">
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
         </div>
      </header>
      <div class="container">
         <div class="page-header">
            <br>
            <br>
         </div>
      </div>
      <jsp:useBean id="cerveja" scope="request" class="com.routeexpress.wrouteexpressprodutos.produto.Produto">
      </jsp:useBean>
      <jsp:useBean id="disponibilidade" scope="request" class="com.routeexpress.wrouteexpressprodutos.produto.Estoque">
      </jsp:useBean>
      <div class="row">
         <nav class="navbar navbar-inverse">
            <div class="container-fluid">
               <h1 class="text-center text-uppercase col-xs-12 col-md-9 titulo"><strong>${cerveja.cervejaria}</strong></h1>
               <p class="titulo lead col-xs-11 col-xs-offset-1 col-md-3 col-md-offset-0"><span class="glyphicon glyphicon-globe" aria-hidden="true"> ${cerveja.pais}</span></p>
            </div>
         </nav>
      </div>
      <div class="row">
         <div class="col-xs-12 col-md-4">
            <h2 class="text-center col-xs-12">
            ${cerveja.rotulo}
            <h2>
            <p class="text-center lead col-xs-12">${cerveja.descricao}</p>
         </div>
         <div class="col-xs-12 col-md-5">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
               <!-- Indicators -->
               <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
               </ol>
               <!-- Wrapper for slides -->
               <div class="carousel-inner" role="listbox">
                  <div class="item active">
                     <img src="imagens/${cerveja.imagem1}" alt="img 1">
                     <div class="carousel-caption">
                        <h3>${cerveja.cervejaria}</h3>
                        <p>${cerveja.pais}</p>
                     </div>
                  </div>
                  <div class="item">
                     <img src="imagens/${cerveja.imagem2}" alt="img 2">
                     <div class="carousel-caption">
                        <h3>${cerveja.rotulo}</h3>
                        <p>${cerveja.sabor}</p>
                     </div>
                  </div>
                  <div class="item">
                     <img src="imagens/${cerveja.imagem3}" alt="img 3">
                     <div class="carousel-caption">
                        <h3>${cerveja.familiaEEstilo}</h3>
                        <p>${cerveja.volume} ml</p>
                     </div>
                  </div>
               </div>
               <!-- Controls -->
               <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
               </a>
               <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
               </a>
            </div>
         </div>
         <div class="col-xs-12 col-md-3">
            <div class="col-xs-12">
               <c:set var="valorDe" value="${cerveja.preco + (cerveja.preco / 100 * 5)}" />
               <c:set var="valorPara" value="${cerveja.preco}" />
               <h2 class="text-center">
                  De: 
                  <s>
                     <fmt:setLocale value="pt_BR"/>
                     <fmt:formatNumber value="${valorDe}" type="currency"/>
                  </s>
               </h2>
               <h2 class="text-center">
                  Para: 
                  <fmt:setLocale value="pt_BR"/>
                  <fmt:formatNumber value="${valorPara}" type="currency"/>
               </h2>
            </div>
            <div class="col-xs-12">
               <c:choose>
                  <c:when test="${disponibilidade.disponibilidade=='1'}">
                     <div>
                        <form class="form-inline" action="ServletCarrinho?acao=adicionar" method="post">
                           <div class="form-group">
                              <input type="hidden" name="id" value="${cerveja.idCerveja}" />
                              <input class="btn btn-success btn-lg center-block" type="submit" value="Comprar" />
                           </div>
                        </form>
                              <br/>
                        <form class="form-inline" action="ServletListaDeDesejos" method="post">
                           <div>
                              <input type="hidden" name="cpfCliente" value="<c:out value="${sessionScope.usuario.cpf}" />" />
                              <input type="hidden" name="idcerveja" value="${cerveja.idCerveja}" />
                              <input class="btn btn-info btn-sm center-block" type="submit" value="Adicionar a lista de desejos!" />
                           </div>
                        </form>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <form class="form-inline" action="ServletListaDeDesejos" method="post">
                        <div class="form-group col-xs-10 col-xs-offset-1">
                           <h1 class="text-center">Indisponivel</h1>
                           <input type="hidden" name="cpfCliente" value="<c:out value="${sessionScope.usuario.cpf}" />" />
                           <input type="hidden" name="idcerveja" value="${cerveja.idCerveja}" />
                           <input class="btn btn-info btn-sm center-block" type="submit" value="Adicionar a lista de desejos!" />
                        </div>
                     </form>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-xs-3 col-xs-offset-1">
            <p class="text-left lead">Cor </p>
            <div class="cor" style="background-color:${cerveja.cor}"></div>
         </div>
         <div class="col-xs-3 col-xs-offset-1">
            <p class="text-left lead">Teor ${cerveja.teor}</p>
            <img src="img/thumbs/te.jpg" class="img-responsive" alt="#"/>
         </div>
         <div class="col-xs-3 col-xs-offset-1">
            <p class="text-left lead">${cerveja.temperatura} °C</p>
            <img src="img/thumbs/t.jpg" class="img-responsive" alt="#"/>
         </div>
      </div>
      <div class="row">
         <div class="col-xs-12 col-sm-4">
            <h2 class="text-center"><b>${cerveja.volume} ML</b></h2>
         </div>
         <div class="col-xs-12 col-sm-4">
            <h2 class="text-center"><b>${cerveja.familiaEEstilo}</b></h2>
         </div>
         <div class="col-xs-12 col-sm-4">
            <h2 class="text-center"><b>${cerveja.sabor}</b></h2>
         </div>
      </div>
      </div>
   </body>
</html>

