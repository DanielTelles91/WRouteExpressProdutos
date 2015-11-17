<%@ page isELIgnored="false" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Route Express - Pagina nao encontrada</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--css bootstrap-->

        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script><!--js jquery-->
        <script src="js/jquery-1.10.2.js" type="text/javascript"></script><!--js jqueryui-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script><!--js bootstrap-->
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="error-template">
                        <h1>
                            Oops!</h1>
                        <h2>
                            404 Pagina nao encontrada</h2>
                        <div class="error-details">
                            Desculpe, ocorreu um erro, a pagina requesitada nao foi encontrada!
                        </div>
                        <div class="error-actions">
                            <a href="ServletListarProdutos?acao=listar" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                                Volte para a home </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
