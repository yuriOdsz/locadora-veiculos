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
            <form id="locadora" action="recebedadosTipoPagamento.jsp" method="POST">
                <h3 class="text-center">Cadastro de Tipo de Pagamento</h3>
                <br>
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                        out.write(request.getParameter("pmensagem"));
                    %>
                </label>

                <!--- DESCRIÇÃO -->
                <fieldset>
                    <label>Descrição</label>
                    <div class="desctipopagamento">
                        <input id=desctipopagamento name="desctipopagamento" type="text" required maxlength="15" style="text-transform:uppercase">
                    </div>
                </fieldset>
                <br>

                <div>
                    <div class="form-group col-md-2 h-6">
                        <input type="submit" value="Cadastrar" class="btn btn-primary " onclick="enviaForm()" />
                    </div>
                    <div class="form-group col-md-2 h-6">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
        </div>
    </body>    
 </html>
