<%-- 
    Document   : cadastrocliente
    Created on : 25/10/2015, 15:17:05
    Author     : DANIEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link href='css/bootstrap.min.css' rel='stylesheet' type='text/css'>
    <script src='js/jquery.min.js' type='text/javascript'></script>
    <script src='js/bootstrap.min.js' type='text/javascript'></script>
    <script src='js/bootstrap-datepicker.min.js' type='text/javascript'></script>
    <script src='js/bootstrap-switch.min.js' type='text/javascript'></script>
   
 
    <script src="js/plugins/jquery.maskedinput.min.js" type="text/javascript"></script><!--js plugin maskedinput-->
    <link rel="stylesheet" href="/resources/demos/style.css">
    <!-- jQuery CEP Plugin -->
    <script type="text/javascript" src="js/jquery.cep.js"></script>
    

    <script type="text/javascript">
        $(document).ready(function () {
            $("#id_cpf").mask("999.999.999-99");
        });


        jQuery(function ($) {
            $("#datanasc").mask("99/99/9999", {placeholder: " "});
        });
        
          jQuery(function ($) {
            $("#fone").mask("(99)99999-9999", {placeholder: " "});
        });
    </script>
</head>
<body>
    <div id="topheader">
    </div>
    <div class='container'>
        <div class='panel panel-primary dialog-panel'>
            <div class='panel-heading'>
                <h5>Cadastro de Cliente</h5>
            </div>


            <div class='panel-body'>
                <form class='form-horizontal' role='form' action="ServletCliente?acao=cadastro" method="post">

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Nome</label>
                        <div class='col-md-8'>
                            <div class='col-md-2'>
                                <div class='form-group internal'>
                                    <select name="sexo" class='form-control' id='id_title'>
                                        <option value="M">Senhor</option>
                                        <option value="F">Senhora</option>
                                    </select>				 
                                </div>
                            </div>

                            <div class='col-md-3 indent-small'>
                                <div class='form-group internal'>
                                    <input name="fnome" class='form-control' id='id_first_name' placeholder='Primeiro Nome' type='text'>
                                </div>
                            </div>
                            <div class='col-md-3 indent-small'>
                                <div class='form-group internal'>
                                    <input name="lnome" class='form-control' id='id_last_name' placeholder='Sobrenome' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_checkin'>Data de Nascimento</label>
                        <div class='col-md-8'>
                            <div class='col-md-3'>
                                <div class='form-group internal input-group'>
                                    <input name="dataNasc" class='form-control datepicker' id='datanasc' placeholder='25/11/1991' type='text'>
                                    <span class='input-group-addon'>
                                        <i class='glyphicon glyphicon-calendar'></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_email'>CPF</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-11'>
                                    <input name="cpf"  class='form-control' id='id_cpf' placeholder='999.999.999-47' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_email'>Email</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-11'>
                                    <input name="email" class='form-control' id='id_email' placeholder='E-mail' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_email'>Senha</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-11'>
                                    <input name="senha" class='form-control' id='id_email' placeholder='Senha' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_telres'>Telefone Residencial</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-11'>
                                    <input name="telefone" class='form-control' id='fone' placeholder='Phone: (xxx) - xxx xxxx' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='cep'>CEP</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="cep" id="input-demo-cep" class="cep form-control" placeholder='CEP' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='bairro'>Cidade</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="cidade" id="input-demo-cidade" class="form-control" data-cep="cidade" placeholder='Cidade' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='bairro'>Estado</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="estado" id="input-demo-uf" class="form-control" data-cep="uf" placeholder='Estado' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='tipodelog'>Tipo de Logradouro</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="tipo_logradouro" id="input-demo-tipo_logradouro" class="form-control" data-cep="tipo_logradouro" placeholder='Tipo de Logradouro' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='tipodelog'>Logradouro</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="logradouro" id="input-demo-logradouro" class="form-control" data-cep="logradouro" placeholder='Logradouro' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='tipodelog'>Numero</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="numero" id="numero" class="form-control" placeholder='Numero' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='bairro'>Bairro</label>
                        <div class='col-md-6'>
                            <div class='form-group'>
                                <div class='col-md-6'>
                                    <input name="bairro" id="input-demo-bairro" class="form-control" data-cep="bairro" placeholder='Rua' type='text'>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class='form-group'>
                        <div class='col-md-offset-4 col-md-3'>
                            <button class='btn-lg btn-primary' type='submit'>Cadastrar</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>




    <!-- Init Plugin -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('.cep').cep();
            $('#input-demo-cep').focus();
        });
    </script>
</body>
