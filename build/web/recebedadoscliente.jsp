<%@page import="Classes.Cliente"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">                  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        //recebe os valores da tela HTML  
        int    vcodcliente   = Integer.parseInt(request.getParameter("codcliente"));
        String vcpfcliente   = request.getParameter("cpfcliente");
        String vnomcliente   = request.getParameter("nomecliente").toUpperCase();;
        String vemailcliente = request.getParameter("emailcliente");
        String vnrcartao     = request.getParameter("nrcartao");

        Cliente c = new Cliente(); 
        c.setCodCliente(vcodcliente);
        c.setCpfCliente(vcpfcliente);
        c.setNomeCliente(vnomcliente);
        c.setEmailCliente(vemailcliente);
        c.setNrcartao(vnrcartao);
        if(c.incluirCliente()){
            response.sendRedirect("cadastraCliente.jsp?pmensagem=Cliente incluido com sucesso");
        } else {
            response.sendRedirect("cadastraCliente.jsp?pmensagem=Problemas ao salvar Cliente");
        }
    %>
</html>