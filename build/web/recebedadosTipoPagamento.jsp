<%@page import="Classes.TipoPagamento"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">                  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        //recebe os valores da tela HTML  
        String vdesctipopagamento   = request.getParameter("desctipopagamento").toUpperCase();;

        TipoPagamento t = new TipoPagamento();
        t.setDescTipoPagamento(vdesctipopagamento);
        if(t.incluirTipoPagamento()){
            response.sendRedirect("cadastraTipoPagamento.jsp?pmensagem=Tipo de Pagamento incluido com sucesso");
        } else {
            response.sendRedirect("cadastraTipoPagamento.jsp?pmensagem=Problemas ao salvar Tipo de Pagamento");
        }
    %>
</html>