<%@ page isELIgnored="false" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Route Express - Relatorios</title>
        <link href="css/cupertino/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
        <!--css jqueryui-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--css bootstrap-->
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script><!--js jquery-->
        <script src="js/jquery-1.10.2.js" type="text/javascript"></script><!--js jqueryui-->
        <script src="js/jquery-ui-1.10.4.custom.js" type="text/javascript"></script><!--js jqueryui-->
        <script src="js/plugins/jquery.maskedinput.min.js" type="text/javascript"></script><!--js plugin maskedinput-->
        <script src="js/bootstrap.min.js" type="text/java<script"></script><!--js bootstrap-->
        <script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart']}]}"></script>
        <script>
                    $(function () {
                        $("#number")
                                .selectmenu()
                                .selectmenu("menuWidget")
                                .addClass("overflow");
                    });
        </script>
        <style>
            fieldset {
                border: 0;
            }
            label {
                display: block;
                margin: 30px 0 0 0;
            }
            select {
                width: 200px;
            }
            .overflow {
                height: 200px;
            }
        </style>

        <script type="text/javascript">

            google.setOnLoadCallback(drawVisualization);

            function drawVisualization() {
                // Some raw data (not necessarily accurate)
                var data = google.visualization.arrayToDataTable([
                    ['Mês', 'Brahma', 'Skol', 'Colorado', 'Heineken', 'Quilmes', 'Média'],
                    ['Janeiro', 165, 938, 522, 998, 450, 614.6],
                    ['Fevereiro', 135, 1120, 599, 700, 288, 682],
                    ['Março', 157, 1167, 587, 807, 397, 623],
                    ['Maio', 139, 1110, 615, 968, 215, 609.4],
                    ['Abril', 136, 691, 629, 1026, 366, 569.6],
                    ['Junho', 165, 938, 522, 998, 450, 614.6],
                    ['Julho', 135, 1120, 599, 700, 288, 682],
                    ['Agosto', 157, 1167, 587, 807, 397, 623],
                    ['Setembro', 139, 1110, 615, 968, 215, 609.4],
                    ['Outubro', 136, 691, 629, 1026, 366, 569.6],
                    ['Novembro', 139, 1110, 615, 968, 215, 609.4],
                    ['Dezembro', 136, 691, 629, 1026, 366, 569.6]
                ]);

                var options = {
                    title: 'Produtos mais vendidos',
                    vAxis: {title: 'Quantidade'},
                    hAxis: {title: 'Mês'},
                    seriesType: 'bars',
                    series: {5: {type: 'line'}}
                };

                var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div class="section">
      <div class="container">
        <!--Comeco da linha-->
        <div class="row">
          <!--Comeco do breadcrumb-->
          <div class="col-xs-8">
            <ul class="breadcrumb">
              <li>
                <a href="home.jsp">Home</a>
              </li>
              <li>
                <a href="controlegrafico.jsp">Controle de Grafico</a>
              </li>
              <li class="active">Controle de Grafico</li>
            </ul>
            <!--Fim do breadcrumb-->
          </div>
          <div class="col-xs-1 col-xs-offset-1">
                <p class="lead">Operador(a) <c:out value="${sessionScope.usuario.nome}" /></p>
            </div>
          <!--Comeco do botao sair-->
          <div class="col-xs-1 col-xs-offset-1">
            <a class="btn btn-warning" href="LoginUsuario" role="button">Sair</a>
            <!--Fim do botao sair-->
          </div>
          </br>
          <div class="demo">
                <form action="#">
                    <fieldset>
                        <label for="number">Escolha um ano</label>
                        <select name="number" id="number">
                            <!--<option selected="selected">2</option> Usar esse cara para receber o ano para o gráfico-->
                            <option>2000</option>
                            <option>2001</option>
                            <option>2002</option>
                            <option>2003</option>
                            <option>2004</option>
                            <option>2005</option>
                            <option>2006</option>
                            <option>2007</option>
                            <option>2008</option>
                            <option>2009</option>
                            <option>2010</option>
                            <option>2011</option>
                            <option>2013</option>
                            <option>2014</option>
                            <option>2015</option>
                            <option>2016</option>
                        </select>
                    </fieldset>
                </form>
            </div>
          <div class="col-ms-12">
            <div class="form-group col-xs-0 col-sm-8">
            </div>
            <div class="form-group col-xs-5 col-sm-2">
                <button type="reset" class="btn btn-danger">APAGAR</button>
            </div>
            <div class="form-group col-xs-5 col-sm-2">
                <button type="submit" class="btn btn-success">ENVIAR</button>
            </div>
        </div>
        </br>
        </br>
           <div id="chart_div" style="width: 1200px; height: 700px;">
         </div>
        </div>
      </div>
    </div>
    </body>
</html>
