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
            <form id="locadora" action="recebedadoscliente.jsp" method="POST">
                <h3 class="text-center">Cadastro de Clientes</h3>
                <br>
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                        out.write(request.getParameter("pmensagem"));
                    %>
                </label>

                <!--- COD --->
                <fieldset>  
                    <fieldset>
                    <label>Código</label>
                    <div class="codcliente">
                        <input id=codcliente name="codcliente" type="integer" required maxlength="11">
                    </div>
                </fieldset><br>
                <!--- CPF -->
                <fieldset>
                    <label>Cpf</label>
                    <div class="cpfcliente">
                        <input id=cpfcliente name="cpfcliente" type="text" required maxlength="11">
                    </div>
                </fieldset><br>

                <!--- NOME -->
                <fieldset>
                    <label>Nome</label>
                    <div class="nomecliente">
                        <input id=nomecliente name="nomecliente" type="text" required maxlength="40" style="text-transform:uppercase">
                    </div>
                </fieldset>

                <!--- EMAIL -->
                <fieldset>  
                <fieldset>
                    <label>eMail</label>
                    <div class="emailcliente">
                        <input id=emailcliente name="emailcliente" type="email" required maxlength="60">
                    </div>
                </fieldset><br>

                <!--- NR CARTÃO -->
                <fieldset>  
                <fieldset>
                    <label>Nr Cartão</label>
                    <div class="nrcartao">
                    <input id=nrcartao name="nrcartao" type="text" pattern="[0-9]{16}" required maxlength="16"
                           title="NR DO CARTÃO SÓ PODE TER CARACTERES NUMÉRICOS">
                    </div>
                </fieldset><br>

                <div>
                    <div class="form-group col-md-3 h-10">
                        <input type="submit" value="Cadastrar" class="btn btn-primary " onclick="enviaForm()" />
                    </div>
                    <div class="form-group col-md-3 h-10">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
        </div>
    </body>    
 </html>
