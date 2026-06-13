<%@page import="Classes.Veiculo"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">                  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        //recebe os valores da tela HTML 
        char voperacao           = request.getParameter("operacao").charAt(0);
        String vplacaVeiculo       = request.getParameter("placaveiculo");
        String vmarcaVeiculo       = request.getParameter("marcaveiculo");
        String vmodeloVeiculo      = request.getParameter("modeloveiculo");
        double vkmVeiculo          = Double.parseDouble(request.getParameter("kmveiculo"));
        String vtemArCondicionado  = request.getParameter("temarcondicionado");
        String vtemDirHidraulica   = request.getParameter("temdirhidraulica");
        String vveiculoRevisado    = request.getParameter("veiculorevisado");

        Veiculo v = new Veiculo(); 
        v.setVoperacao(voperacao);
        v.setPlacaVeiculo(vplacaVeiculo);
        v.setMarcaVeiculo(vmarcaVeiculo);
        v.setModeloVeiculo(vmodeloVeiculo);
        v.setKmVeiculo(vkmVeiculo);
        
        if (vtemArCondicionado!= null) {
            v.setTemArCondicionado(true);
        }
        if (vtemDirHidraulica != null) {
            v.setTemDirHidraulica(true);
        }
        if (vveiculoRevisado != null) {
            v.setVeiculoRevisado(true);
        }
        
        if (voperacao == 'I') {
            if(v.incluirVeiculo()){
                response.sendRedirect("cadastraVeiculo.jsp?pmensagem=Veiculo incluido com sucesso");
            } else {
                response.sendRedirect("cadastraVeiculo.jsp?pmensagem=Problemas ao salvar Veiculo");
            }
        } else {
            if(v.alterarVeiculo()){
                response.sendRedirect("consultaVeiculo.jsp?pmensagem=Veiculo alterado com sucesso");
            } else {
                response.sendRedirect("consultaVeiculo.jsp?pmensagem=Problemas ao alterar Veiculo");
            }
            if(v.excluirVeiculo()) {
            response.sendRedirect("excluirVeiculo.jsp?pmensagem=Veiculo excluido com sucesso");
            } else {
                response.sendRedirect("excluirVeiculo.jsp?pmensagem=Problemas ao Excluir Veiculo");
            }
        }
    %>
</html>