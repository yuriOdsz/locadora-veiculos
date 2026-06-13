<%@page import="Classes.Locacao"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Veiculo"%>
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
        <%
            int lcodlocacao = Integer.parseInt(request.getParameter("codlocacao"));
            Locacao l = new Locacao();
            l.setCodLocacao(lcodlocacao);
            if (lcodlocacao > 0) {
                l = l.consultarLocacao();
            }
        %>

        <div class="container" >
            <form id="locadora" action="recebeeditaTipoPagamento.jsp" method="POST">
                <h3 class="text-center">Cadastro de Locação</h3>
                <p> </p>
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                        out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                
                <!--- Código -->
                <fieldset>  
                <fieldset>
                    <label>Código</label>
                    <div class="codlocacao">
                    <input id=codlocacao name="codlocacao" readonly="true" value=<%out.write(""+l.getCodLocacao());%>>
                    </div>
                </fieldset><br>

                <!--- Descrição -->
                <fieldset>
                    <label>Placa Veiculo</label>
                    <div class="placaveiculo">
                        <input id=placaveiculo name="placaveiculo" type="text" required maxlength="15" style="text-transform:uppercase"
                               value = <%out.write(""+l.getPlacaVeiculo());%>>
                    </div>
                </fieldset>
                    
                    <fieldset>
                    <label>Código Cliente</label>
                    <div class="codcliente">
                        <input id=codCliente name="codcliente" type="text" required maxlength="15" style="text-transform:uppercase"
                               value = <%out.write(""+l.getCodCliente());%>>
                    </div>
                </fieldset>
                    
                    <fieldset>
                    <label>Data Reserva</label>
                    <div class="datareserva">
                        <input id=datareserva name="datareserva" type="text" required maxlength="15" style="text-transform:uppercase"
                               value = <%out.write(""+l.getDataReserva());%>>
                    </div>
                </fieldset>
                    
                    <fieldset>
                    <label>Data Locacao</label>
                    <div class="datalocacao">
                        <input id=datalocacao name="datalocacao" type="text" required maxlength="15" style="text-transform:uppercase"
                               value = <%out.write(""+l.getDataLocacao());%>>
                    </div>
                </fieldset>
                    
                <div>
                    <div class="form-group col-md-3 h-10">
                        <input type="submit" value="Alterar" class="btn btn-primary " onclick="enviaForm()" />
                    </div>
                </div>
            </form>
        </div>       
    </body>
