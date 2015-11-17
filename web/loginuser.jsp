<%-- 
    Document   : loginuser
    Created on : 12/11/2015, 00:52:45
    Author     : DANIEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <style rel="stylesheet" type="text/css">

            .nav-tabs {
                margin-bottom: 15px;
            }
            .sign-with {
                margin-top: 25px;
                padding: 20px;
            }
            div#OR {
                height: 30px;
                width: 30px;
                border: 1px solid #C2C2C2;
                border-radius: 50%;
                font-weight: bold;
                line-height: 28px;
                text-align: center;
                font-size: 12px;
                float: right;
                position: absolute;
                right: -16px;
                top: 40%;
                z-index: 1;
                background: #DFDFDF;
            }
        </style>

    </head>
    <body>
      
        
               
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;</button>
                        <h4 class="modal-title" id="myModalLabel">
                            Login/Registration - <a href="http://www.jquery2dotnet.com">jquery2dotnet.com</a></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-10" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                                    <li><a href="#Registration" data-toggle="tab">Registration</a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="Login">
                                        <form role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Email</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="email1" placeholder="Email" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                                    Password</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Email" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-10">
                                                    <button type="submit" class="btn btn-primary btn-sm">
                                                        Submit</button>
                                                    <a href="javascript:;">Forgot your password?</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="Registration">
                                        <form role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Name</label>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <select class="form-control">
                                                                <option>Mr.</option>
                                                                <option>Ms.</option>
                                                                <option>Mrs.</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <input type="text" class="form-control" placeholder="Name" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Email</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="email" placeholder="Email" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="mobile" class="col-sm-2 control-label">
                                                    Mobile</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="mobile" placeholder="Mobile" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="password" class="col-sm-2 control-label">
                                                    Password</label>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" id="password" placeholder="Password" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-10">
                                                    <button type="button" class="btn btn-primary btn-sm">
                                                        Save & Continue</button>
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        Cancel</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                              
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            </div>
                            
                        </div>
                    </div>
              
         
     

    </body>
</html>
