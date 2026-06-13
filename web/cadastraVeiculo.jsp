<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/padraotelacadastro.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    
    <body>
        <div class="container" >
            <form id="locadora" action="recebedadosveiculo.jsp" method="POST">
                <h3 class="text-center">Cadastro de Veículos</h3>
                <br>
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                        out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                
                <input name="operacao" type="hidden" value ="I">
                <!--- PLACA -->
                <fieldset>  
                <fieldset>
                    <label>Placa</label>
                    <div class="placaveiculo">
                        <input id=placaveiculo name="placaveiculo" type="text" required maxlength="9">
                    </div>
                </fieldset><br>

                <!--- MARCA -->
                <fieldset>
                    <label>Marca</label>
                    <div class="marcaveiculo">
                        <input id=marcaveiculo name="marcaveiculo" type="text" required maxlength="20" style="text-transform:uppercase">
                    </div>
                </fieldset>

                <!--- MODELO -->
                <fieldset>
                    <label>Modelo</label>
                    <div class="modeloveiculo">
                        <input id=modeloveiculo name="modeloveiculo" type="text" required maxlength="20" style="text-transform:uppercase">
                    </div>
                </fieldset>
              
                <!--- KM -->
                <fieldset>
                    <label>Km</label>
                    <div class="kmveiculo">
                        <input id=kmveiculo name="kmveiculo" type="number" required style="text-transform:uppercase">
                    </div>
                </fieldset>
                <br>

                <input type="checkbox" name="temarcondicionado"    checked="true"> Ar condicionado?</input><br>
                <input type="checkbox" name="temdirhidraulica"     checked="true"> Direção hidráulica?</input><br>
                <input type="checkbox" name="        boolean vtemdirhidraulica  = Boolean.parseBoolean(request.getParameter("temdirhidraulica"));
"                    > Veículo Revisado?</input><br>
                <hr>     
 
                <div>
                    <div class="form-group col-md-3 h-10">
                        <input type="submit" value="Cadastrar" class="btn btn-primary "/>
                    </div>
                    <div class="form-group col-md-3 h-10">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
'
            </form>
        </div>
    </body>    
 </html>
