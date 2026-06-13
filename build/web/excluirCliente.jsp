<%@page import="Classes.Cliente"%>
        <%
          int vcodcliente   = Integer.parseInt(request.getParameter("codcliente"));
          Cliente c = new Cliente();
          c.setCodCliente(vcodcliente);
          if(c.excluirCliente()){
            response.sendRedirect("consultaCliente.jsp?pmensagem=Cliente excluido com sucesso"+" Cliente = " + vcodcliente);
          }
          else
          {
              response.sendRedirect("consultamarca.jsp?pmensagem=Problemas ao excluir o Cliente");
          }
        %>
    </body>
</html>