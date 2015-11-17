<%@ page isELIgnored="false" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Route Express - Lista de desejos</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--css bootstrap-->
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script><!--js jquery-->
        <script src="js/jquery-1.10.2.js" type="text/javascript"></script><!--js jqueryui-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script><!--js bootstrap-->
        <script type="text/javascript">
         $('document').ready(function () {
             $('.table-responsive').css({overflow: 'auto', height: '600px'});
             
             $('img').css({'width': '75px', 'height': '75px'});
             
             $('p').css({'display': 'inline-block', 'margin-left' : '25px'});
             
             $('a:link').css('textDecoration', 'none');
         });
      </script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <a class="btn btn-info" href="ServletCliente?acao=detalhar">VOLTAR PARA MEUS DADOS</a>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive"> 
                        <table class="table table-striped">
                            <thead>
                                <tr>    
                                    <th><p class="lead">LISTA DE DESEJOS</p></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.Lista}" var="lista">
                                    <tr>
                                        <td><img src="imagens/${lista.imagem1}" alt="not image" class="img-circle"/><p class="lead">${lista.rotulo}</p><p class="lead">${lista.familiaEEstilo}</p><p class="lead">${lista.sabor}</p></td> 
                                        <td><p><a class="btn btn-danger" href="ServletListaDeDesejos?acao=remover&cpfcliente=<c:out value="${sessionScope.usuario.cpf}" />&idcerveja=${lista.idCerveja}">REMOVER ITEM</a></p></td>                                                                   
                                    </tr>                              
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
