<%@page import="Classes.Locacao"%>
        <%
          int vcodlocacao       = Integer.parseInt(request.getParameter("codlocacao"));    
          Locacao l = new Locacao();
          l.setCodLocacao(vcodlocacao);        
          if(l.excluirLocacao()){
            response.sendRedirect("consultaLocacao.jsp?pmensagem=Locação excluida com sucesso"+" Locacao = " + (vcodlocacao));
          }
          else
          {
              response.sendRedirect("consultaLocacao.jsp?pmensagem=Problemas ao excluir a Locacao");
          }
        %>
    </body>
</html>