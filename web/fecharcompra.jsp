<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
   <head>
      <title>Route Express - Fechar Compra</title>
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
             
             $('.barra-de-notificacao').css({backgroundColor : '#F5F5F5', marginTop : '100px'});  
             $('.icone, notificacao').css({fontSize: '25px', display: 'inline'});
             $('.ativo').css('backgroundColor' , 'white');
             $('.destaque').css('backgroundColor' , '#E5FAFF');
             $('img.pagamento').css({width: '190px', height: '50px',marginLeft: 'auto', marginRight: 'auto'});
             $('img.cartao').css({marginLeft: 'auto', marginRight: 'auto'});
             $('.itens').css('backgroundColor' , '#FFFFE5');
             $('.destaque1').css('backgroundColor' , '#F5F5F5');
             $('.atencao').css('backgroundColor' , '#FFB3B3');
             
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
         <div class="row">
            <div class="col-xs-12">
               <div class="row barra-de-notificacao">
                  <div class="col-xs-4">                        
                  </div>
                  <div class="col-xs-8">
                     <div class="col-xs-6 col-sm-3">
                        <span class="glyphicon glyphicon-shopping-cart icone"></span>
                        <p class="notificacao">Carrinho</p>
                     </div>
                     <div class="col-xs-6 col-sm-3">
                        <span class="glyphicon glyphicon-user icone"></span>
                        <p class="notificacao">Autenticação</p>
                     </div>
                     <div class="col-xs-6 col-sm-3 ativo">
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
            <div class="col-xs-12 destaque">
               <h1>
                  Olá,
                  <c:out value="${sessionScope.usuario.firstNome}" />
               </h1>
               <strong>selecione sua forma de pagamento</strong>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-12">
               <ul class="nav nav-tabs">
                  <li class="active">
                     <a data-toggle="tab" href="#menu1">
                        <h3>Boleto Bancário(10% de desconto)</h3>
                     </a>
                     <img src="img/thumbs/barradecodigo.jpg" alt="not image" class="img-responsive pagamento"/>
                  </li>
                  <li>
                     <a data-toggle="tab" href="#menu2">
                        <h3>Cartões de crédito</h3>
                     </a>
                     <img src="img/thumbs/cartoes.png" alt="not image" class="img-responsive pagamento"/>
                  </li>
               </ul>
               <div class="tab-content">
                  <div id="menu1" class="tab-pane fade in active">
                     <div class="col-xs-12">
                        <p class="lead">
                           Boleto Bancário
                        </p>
                        <p class="lead destaque">
                           À vista 
                           <fmt:setLocale value="pt_BR"/>
                           <fmt:formatNumber value="${sessionScope.totalAPagar.precoTotal - (sessionScope.totalAPagar.precoTotal / 100 * 10)}" type="currency"/>
                        </p>
                        <p>
                           Importante: Verifique a data de vencimento informada no boleto. O prazo para pagamento do boleto é 2 dias úteis. Em caso de não pagamento do boleto até a data de vencimento, o pedido será automaticamente cancelado.
                        <ul>
                           <li>
                              O prazo de entrega informado durante a compra é contado a partir da confirmação do pagamento pelo banco, o que pode levar até 2 dias úteis.
                           </li>
                           <li>
                              O pagamento do boleto pode ser efetuado pela internet, utilizando o código de barras, ou diretamente em bancos, lotéricas e correios, apresentando o boleto impresso.
                           </li>
                        </ul>
                        </p>
                        <form class="form-inline" action="" method="post">
                           <div>
                              <input type="hidden" name="valorTotal" value="${sessionScope.totalAPagar.precoTotal - (sessionScope.totalAPagar.precoTotal / 100 * 10)}" />
                              <input type="submit" class="btn btn-success col-xs-8 col-sm-3" value="FINALIZAR O PEDIDO" />
                           </div>
                        </form>
                     </div>
                  </div>
                  <div id="menu2" class="tab-pane fade">
                     <div class="col-xs-12 col-md-6">
                        <img src="img/thumbs/cardfrontback.jpg" alt="not image" class="img-responsive cartao"/>       
                     </div>
                     <div class="col-xs-12 col-md-6">
                        <form action="" method="post">
                           <div class="form-group">
                              <label for="">Cartão de Crédito</label>
                              <select name="vezes" class="form-control" required>
                                 <option value="${sessionScope.totalAPagar.precoTotal}">
                                    1x de 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber 
                                       value="${sessionScope.totalAPagar.precoTotal}" 
                                       type="currency"/>
                                 </option>
                                 <option value="">
                                    2x de 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber 
                                       value="${(sessionScope.totalAPagar.precoTotal + (sessionScope.totalAPagar.precoTotal / 100 * 3)) / 2}" 
                                       type="currency"/>
                                 </option>
                                 <option value="">
                                    3x de 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber 
                                       value="${(sessionScope.totalAPagar.precoTotal + (sessionScope.totalAPagar.precoTotal / 100 * 6)) / 3}" 
                                       type="currency"/>
                                 </option>
                                 <option value="">
                                    4x de 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber 
                                       value="${(sessionScope.totalAPagar.precoTotal + (sessionScope.totalAPagar.precoTotal / 100 * 9)) / 4}" 
                                       type="currency"/>
                                 </option>
                                 <option value="">
                                    5x de 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber 
                                       value="${(sessionScope.totalAPagar.precoTotal + (sessionScope.totalAPagar.precoTotal / 100 * 12)) / 5}" 
                                       type="currency"/>
                                 </option>
                                 <option value="">
                                    6x de 
                                    <fmt:setLocale value="pt_BR"/>
                                    <fmt:formatNumber 
                                       value="${(sessionScope.totalAPagar.precoTotal + (sessionScope.totalAPagar.precoTotal / 100 * 15)) / 6}" 
                                       type="currency"/>
                                 </option>
                              </select>
                           </div>
                           <div class="form-group">
                              <label for="">Número do Cartão</label>
                              <input type="text" class="form-control" placeholder="Número do Cartão" maxlength="16" pattern="[0-9]+$">
                           </div>
                           <div class="form-group">
                              <label for="">Nome do Titular</label>
                              <input type="text" class="form-control" placeholder="Nome do Titular" maxlength="50">
                           </div>
                           <div class="form-group col-xs-7">
                              <label for="">Data de Validade</label>
                              <input type="text" class="form-control" placeholder="MM/AA" maxlength="4" pattern="[0-9]+$">
                           </div>
                           <div class="form-group col-xs-5">
                              <label for="">Cód. Segurança</label>
                              <input type="text" class="form-control" placeholder="Cód. Segurança" maxlength="3" pattern="[0-9]+$">
                           </div>
                           <button type="submit" class="btn btn-success col-xs-8 col-sm-6">FINALIZAR O PEDIDO</button>
                           <button type="reset" class="btn btn-danger col-xs-4 col-xs-offset-1 col-sm-3">APAGAR</button>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-12 destaque">
               <h1>
                  <c:out value="${sessionScope.usuario.firstNome}" />
                  ,
               </h1>
               <strong>confirme os dados da sua compra</strong>
            </div>
            <div class="col-xs-12 col-md-9">
               <h3 class="itens">Itens</h3>
               <c:forEach items="${sessionScope.fecharCompra}" var="itemDeCompra" varStatus="item">
                  <p class="lead">
                     Item ${item.count} de 
                     <c:out value="${fn:length(fecharCompra)}" />
                  </p>
                  <div class="row itens">
                     <div class="col-xs-3">
                        <img src="imagens/${itemDeCompra.imagem1}" class="img-responsive"/>
                     </div>
                     <div class="col-xs-3">
                        <p class="lead">${itemDeCompra.rotulo}</p>
                     </div>
                     <div class="col-xs-2">
                        <p class="lead">${itemDeCompra.quantidade}</p>
                     </div>
                     <div class="col-xs-2">
                        <p class="lead">
                           <fmt:setLocale value="pt_BR"/>
                           <fmt:formatNumber value="${itemDeCompra.preco}" type="currency"/>
                        </p>
                     </div>
                     <div class="col-xs-2">
                        <p class="lead">
                           <fmt:setLocale value="pt_BR"/>
                           <fmt:formatNumber value="${itemDeCompra.precoSubTotal}" type="currency"/>
                        </p>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <div class="col-xs-12 col-md-3">
               <h3 class="destaque1">Forma de Envio</h3>
               <h3 class="destaque1">Endereço de Entrega</h3>
               <h1>
                  <c:out value="${sessionScope.usuario.firstNome}" />
               </h1>
               <p class="lead">${sessionScope.endereco.tipoLogradouro}-${sessionScope.endereco.logradouro},</p>
               <p class="lead">${sessionScope.endereco.logradouroNumero}</p>
               <p class="lead">${sessionScope.endereco.bairro},</p>
               <p class="lead">${sessionScope.endereco.estado}-${sessionScope.endereco.cidade}</p>
            </div>
         </div>
         <div class="row">
            <p class="lead col-xs-12 atencao">Atenção a quantidade do produto escolhido pode ser diferente 
               da quantidade escolhida no carrinho de compras, devido a disponibilidade em estoque!
            </p>
         </div>
      </div>
   </body>
</html>

