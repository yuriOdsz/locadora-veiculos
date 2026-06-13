<%@page import="Classes.TipoPagamento"%>
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
            int vcodtipopagamento = Integer.parseInt(request.getParameter("codtipopagamento"));
            TipoPagamento t = new TipoPagamento();
            t.setCodTipoPagamento(vcodtipopagamento);
            if (vcodtipopagamento > 0) {
                t = t.consultarTipoPagamento();
            }
        %>

        <div class="container" >
            <form id="locadora" action="recebeeditaTipoPagamento.jsp" method="POST">
                <h3 class="text-center">Cadastro de Tipo de Pagamento</h3>
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
                    <div class="codtipopagamento">
                    <input id=codtipopagamento name="codtipopagamento" readonly="true" value=<%out.write(""+t.getCodTipoPagamento());%>>
                    </div>
                </fieldset><br>

                <!--- Descrição -->
                <fieldset>
                    <label>Descrição</label>
                    <div class="desctipopagamento">
                        <input id=desctipopagamento name="desctipopagamento" type="text" required maxlength="15" style="text-transform:uppercase"
                               value = <%out.write(""+t.getDescTipoPagamento());%>>
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
