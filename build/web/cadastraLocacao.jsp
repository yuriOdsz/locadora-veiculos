<%@page import="Classes.Cliente"%>
<%@page import="Classes.Veiculo"%>
<%@page import="Classes.Locacao"%>
<%@page import="java.util.List"%>
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
            <form id="locadora" action="recebedadoslocacao.jsp" method="POST">
            <%
            Cliente cli = new Cliente();
            List<Cliente> lovCliente = cli.lovClientes();
            Veiculo vei = new Veiculo();
            List<Veiculo> lovVeiculo = vei.lovVeiculos();
            %>    
                <input name="operacao" type="hidden" value ="I">
                
                <h3 class="text-center">Gerar Locação</h3> 
                 <%-- label para lançar mensagem de feedback da atualização --%>
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                        out.write(request.getParameter("pmensagem"));
                    %>
                </label>

                <fieldset>
                <div class="codcliente">
                    <label for="codcliente">Cliente</label>
                    <select name="codcliente">
                        <%for(Cliente cliente: lovCliente){ %>
                            <option value="<%out.write(""+ cliente.getCodCliente());%>">
                                           <% out.write(cliente.getNomeCliente()); %>
                            </option>
                        <%}%>
                    </select> 
                </div>
                </fieldset>

                <fieldset>
                    <div class="placaveiculo">
                        <label for="placaveiculo">Veículo</label>
                        <select name="placaveiculo">
                            <%for(Veiculo veiculo: lovVeiculo){ %>
                                <option value="<%out.write(""+veiculo.getPlacaVeiculo());%>">
                                               <% out.write(veiculo.getModeloVeiculo()); %>
                                </option>
                            <%}%>
                        </select> 
                    </div>
                </fieldset>

                <fieldset>
                
                <!-- DATA RESERVA -->
                <div class="datareserva"><br>
                        <label for="datareserva">Data Reserva</label>
                        <label for="datareserva"></label>
                        <input id="datareserva" name="datareserva" type="date"/> 
                    </div>
                </fieldset>                     
                
                <!-- DATA LOCAÇÃO -->
                <div class="datalocacao"><br>
                        <label for="datalocacao">Data Locação</label>
                        <label for="datalocacao"></label>
                        <input id="datalocacao" name="datalocacao" type="date"/> 
                    </div>
                </fieldset>                     
                
                <br>
                <div class="row">
                    <div class="form-group col-md-3 h-10">
                        <input type="submit" value="Cadastrar" class="btn btn-primary" onclick="enviaForm()" />
                    </div>
                    <div class="form-group col-md-3 h-10">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                 </div>
            </form>
        </div>
    </body>   
</html>