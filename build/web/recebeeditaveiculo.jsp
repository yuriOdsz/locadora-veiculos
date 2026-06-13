<%@page import="Classes.Veiculo"%>
<%
        String  vplacaveiculo      = request.getParameter("placaveiculo");
        String  vmarcaveiculo      = request.getParameter("marcaveiculo");
        String  vmodeloveiculo     = request.getParameter("modeloveiculo");
        double  vkmveiculo         = Double.parseDouble(request.getParameter("kmveiculo"));
        boolean vtemarcondicionado = Boolean.parseBoolean(request.getParameter("temarcondicionado"));
        boolean vtemdirhidraulica  = Boolean.parseBoolean(request.getParameter("temdirhidraulica"));
        boolean vveiculorevisado   = Boolean.parseBoolean(request.getParameter("veiculorevisado"));
        
        Veiculo v = new Veiculo();
        v.setPlacaVeiculo(vplacaveiculo);
        v.setMarcaVeiculo(vmarcaveiculo);
        v.setModeloVeiculo(vmodeloveiculo);
        v.setKmVeiculo(vkmveiculo);
        v.setTemArCondicionado(vtemarcondicionado);
        v.setTemDirHidraulica(vtemdirhidraulica);
        v.setVeiculoRevisado(vveiculorevisado);
        if (v.alterarVeiculo()) {
        out.write("Veiculo alterado com sucesso");
        response.sendRedirect("consultaVeiculo.jsp");
    } else {
        out.write("Problemas ao salvar Veiculo");
        response.sendRedirect("consultaVeiculo.jsp");
    }
        %> 
