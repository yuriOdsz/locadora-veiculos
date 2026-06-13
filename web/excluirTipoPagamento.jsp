<%@page import="Classes.TipoPagamento"%>
        <%
          int vcodtipopagamento = Integer.parseInt(request.getParameter("codtipopagamento"));
          TipoPagamento t = new TipoPagamento();
          t.setCodTipoPagamento(vcodtipopagamento);
          if(t.excluirTipoPagamento()){
            response.sendRedirect("consultaTipoPagamento.jsp?pmensagem=Tipo de Pagamento excluido com sucesso"+" Tipo de Pagamento = " + vcodtipopagamento);
          }
          else
          {
              response.sendRedirect("consultaTipopagamento.jsp?pmensagem=Problemas ao excluir o Tipo de Pagamento");
          }
        %>
    </body>
</html>