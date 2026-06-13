<%@page import="Classes.Veiculo"%>
        <%
          String vplacaVeiculo       = request.getParameter("placaveiculo");    
          Veiculo v = new Veiculo();
          v.setPlacaVeiculo(vplacaVeiculo);        
          if(v.excluirVeiculo()){
            response.sendRedirect("consultaVeiculo.jsp?pmensagem=Veiculo excluido com sucesso"+" Veiculo = " + (vplacaVeiculo));
          }
          else
          {
              response.sendRedirect("consultaVeiculo.jsp?pmensagem=Problemas ao excluir o veículo");
          }
        %>
    </body>
</html>