<%@page import="java.sql.Date"%>
<%@page import="Classes.Locacao"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">                  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        //recebe os valores da tela HTML 
        char voperacao           = request.getParameter("operacao").charAt(0);
        String vcodcliente       = request.getParameter("codcliente");
        String vplacaVeiculo     = request.getParameter("placaveiculo");
        String vdatareserva      = request.getParameter("datareserva");
        String vdatalocacao      = request.getParameter("datalocacao");

        Locacao l = new Locacao();
        l.setCodCliente(Integer.parseInt(vcodcliente));
        l.setPlacaVeiculo(vplacaVeiculo);
        if (vdatareserva != "") {
            l.setDataReserva(Date.valueOf(vdatareserva));
        } else {
            l.setDataReserva(null);
        }
        if (vdatalocacao != "") {
            l.setDataLocacao(Date.valueOf(vdatalocacao));
        } else {
            l.setDataLocacao(null);
        }       
        l.setDataDevolucao(null);
        if (voperacao == 'I') {
            if(l.incluirLocacao()){
                response.sendRedirect("cadastraLocacao.jsp?pmensagem=Locacao incluida com sucesso");
            } else {
                response.sendRedirect("cadastraLocacao.jsp?pmensagem=Problemas ao salvar Locacao");
            }
        } else {
            if(l.alterarLocacao()){
                response.sendRedirect("consultaLocacao.jsp?pmensagem=Locacao alterada com sucesso");
            } else {
                response.sendRedirect("consultaLocacao.jsp?pmensagem=Problemas ao alterar Locacao");
            }
        }
    %>
</html>