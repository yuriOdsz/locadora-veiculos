<%@page import="Classes.TipoPagamento"%>
<%
    int    vcodtipopagamento    = Integer.parseInt(request.getParameter("codtipopagamento"));
    String vdesctipopagamento   = request.getParameter("desctipopagamento");

    TipoPagamento t = new TipoPagamento();
    t.setCodTipoPagamento(vcodtipopagamento);
    t.setDescTipoPagamento(vdesctipopagamento);
    if (t.alterarTipoPagamento()) {
        out.write("Tipo de Pagamento alterado com sucesso");
        response.sendRedirect("consultaTipoPagamento.jsp");
    } else {
        out.write("Problemas ao salvar Tipo de Pagamento");
        response.sendRedirect("consultaTipoPagamento.jsp");
    }
        %> 