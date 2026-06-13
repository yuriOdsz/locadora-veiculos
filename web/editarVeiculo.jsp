<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Veiculo"%>

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
            String vplacaveiculo = request.getParameter("placaveiculo");
            Veiculo v = new Veiculo();
            v.setPlacaVeiculo(vplacaveiculo);
            if (vplacaveiculo != null) {
                v = v.consultarVeiculo();
            }
        %>

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
                <input name="operacao" type="hidden" value ="A">
                <!--- PLACA -->
                <fieldset>  
                <fieldset>
                    <label>Placa</label>
                    <div class="placaveiculo">
                        <input id=placaveiculo name="placaveiculo" type="text" readonly="true" 
                               value="<% out.write (v.getPlacaVeiculo());%>">
                    </div>
                </fieldset><br>

                <!--- MARCA -->
                <fieldset>
                    <label>Marca</label>
                    <div class="marcaveiculo">
                        <input id=marcaveiculo name="marcaveiculo" type="text" required maxlength="20" style="text-transform:uppercase"
                               value = "<% out.write (v.getMarcaVeiculo());%>">
                    </div>
                </fieldset>

                <!--- MODELO -->
                <fieldset>
                    <label>Modelo</label>
                    <div class="modeloveiculo">
                        <input id=modeloveiculo name="modeloveiculo" type="text" required maxlength="20" style="text-transform:uppercase"
                           value = "<% out.write (v.getModeloVeiculo());%>">    
                    </div>
                </fieldset>
              
                <!--- KM -->
                <fieldset>
                    <label>Km</label>
                    <div class="kmveiculo">
                        <input id=kmveiculo name="kmveiculo" type="number" required
                               value = "<% out.write (""+v.getKmVeiculo());%>">
                    </div>
                </fieldset>
                <br>

                <input type="checkbox" name="temarcondicionado"
                <%
                     if(v.isTemArCondicionado()){
                        out.write("checked");
                     }                    
                %> 
                >Ar condicionado? </input><br>
                <input type="checkbox" name="temdirhidraulica"
                <%
                     if(v.isTemDirHidraulica()){
                        out.write("checked");
                     }                    
                %> >Direção hidráulica? </input><br>

                <input type="checkbox" name="veiculorevisado"
                <%
                     if(v.isVeiculoRevisado()){
                        out.write("checked");
                     }                    
                %>> Veículo Revisado? </input><br>

                </input><br>
                <hr>     
 
                <div>
                    <div class="form-group col-md-3 h-10">
                        <input type="submit" value="Salvar" class="btn btn-primary "/>
                    </div>
                </div>
            </form>
        </div>
    </body>    
 </html>
