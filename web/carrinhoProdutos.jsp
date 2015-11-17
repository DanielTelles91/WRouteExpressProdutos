<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
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
             $('.barra-de-notificacao').css({backgroundColor : '#F5F5F5', marginTop : '35px'});
             $('.icone, notificacao').css({fontSize: '25px', display: 'inline'});
             $('.ativo').css('backgroundColor' , 'white');
             $('table, .pull-left, .botao').css('margin-top', '5px');
             
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
      <br>
      <br>
      <br>
      <div class="container">
         <div class="row">
            <div class="col-xs-12">
               <div class="row barra-de-notificacao">
                  <div class="col-xs-4">               
                  </div>
                  <div class="col-xs-8">
                     <div class="col-xs-6 col-sm-3  ativo">
                        <span class="glyphicon glyphicon-shopping-cart icone"></span>
                        <p class="notificacao">Carrinho</p>
                     </div>
                     <div class="col-xs-6 col-sm-3">
                        <span class="glyphicon glyphicon-user icone"></span>
                        <p class="notificacao">Autenticação</p>
                     </div>
                     <div class="col-xs-6 col-sm-3">
                        <span class="glyphicon glyphicon-th icone"></span>
                        <p class="notificacao">Confirmação</p>
                     </div>
                     <div class="col-xs-6 col-sm-3">
                        <span class="glyphicon glyphicon-ok icone"></span>
                        <p class="notificacao">Pedido</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-12">
               <div class="table-responsive">
                  <table id="cart" class="table " >
                     <thead>
                        <tr class="success">
                           <th>
                              <p class="lead">CERVEJARIA</p>
                           </th>
                           <th>
                              <p class="lead">PREÇO</p>
                           </th>
                           <th>
                              <p class="lead">QUANTIDADE</p>
                           </th>
                           <th>
                              <p class="lead">SUBTOTAL</p>
                           </th>
                           <th></th>
                        </tr>
                     </thead>
                     <tfoot>
                        <tr>
                           <td>
                              <div class="row">
                                 <div class="col-xs-12 col-sm-7">
                                    <a href="ServletListarProdutos?acao=listar" class="btn btn-info"><i class="fa fa-angle-left"></i> CONTINUE COMPRANDO</a>
                                 </div>
                                 <div class="col-xs-12 col-sm-4">
                                    <p class="lead">
                                       Total 
                                       <fmt:setLocale value="pt_BR"/>
                                       <fmt:formatNumber value="${total1}" type="currency"/>
                                    </p>
                                 </div>
                                 <div class="col-xs-12 col-sm-1">
                                    <a href="ServletFecharCompra?acao=finalizar" class="btn btn-success">FECHAR COMPRA <i class="fa fa-angle-right"></i></a>
                                 </div>
                              </div>
                           </td>
                        </tr>
                     </tfoot>
                     <tbody>
                        <c:forEach items="${sessionScope.carrinho}" var="prodCarr">
                           <tr class="warning">
                              <td>
                                 <div class="col-sm-2 hidden-xs">
                                    <img src="imagens/${prodCarr.imagem1}" alt="..." class="img-responsive img-circle" />
                                 </div>
                                 <div class="col-sm-10">
                                    <p class="lead rotulo">${prodCarr.rotulo}</p>
                                 </div>
                              </td>
                              <td>
                                 <p class="lead text-center">R$:${prodCarr.preco}</p>
                              </td>
                              <form action="ServletCarrinho?acao=alterar" method="post" enctype="application/x-www-form-urlencoded">
                                 <td data-th="Quantity">
                                     <input  name="quant" type="number" class="form-control text-center" value=${prodCarr.quantidade} min="1" max="50">
                                 </td>
                                 <td>
                                    <p class="lead text-center">
                                       <fmt:setLocale value="pt_BR"/>
                                       <fmt:formatNumber value="${prodCarr.precoSubTotal}" type="currency"/>
                                    </p>
                                 </td>
                                 <td class="actions" data-th="">
                                    <input type="hidden" name="id" value="${prodCarr.idCerveja}" />
                                    <button class="btn btn-info btn-sm" type="submit" value="Adicionar ao carrinho"><i class="fa fa-refresh"></i>Atualizar</button>
                              </form>
                              <div class="botao">
                              <form action="ServletCarrinho?acao=apagar" method="post" enctype="application/x-www-form-urlencoded">
                              <input type="hidden" name="id" value="${prodCarr.idCerveja}" />
                              <button class="btn btn-danger btn-sm" type="submit"><i class="fa fa-trash-o"></i>Apagar</button>
                              </form>
                              </div>
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="col-xs-12">
               <form class="form-inline">
                  <div class="form-group">
                     <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-road"></span></div>
                        <input type="text" class="form-control" placeholder="00000-00" maxlength="8" pattern="[0-9]+$">
                     </div>
                  </div>
                  <button type="submit" class="btn btn-default">Calcular Frete</button>
               </form>
            </div>
            <div class="col-xs-12">
               <p class="pull-left">Copyright © 2015 Route Express(Beta1.0), Inc. All Right Reserved</p>
            </div>
         </div>
      </div>
   </body>
</html>

