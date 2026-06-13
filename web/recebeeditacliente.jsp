<%@page import="Classes.Cliente"%>
<%
    int    vcodcliente   = Integer.parseInt(request.getParameter("codcliente"));
    String vcpfcliente   = request.getParameter("cpfcliente");
    String vnomcliente   = request.getParameter("nomecliente");
    String vemailcliente = request.getParameter("emailcliente");
    String vnrcartao     = request.getParameter("nrcartao");

    Cliente c = new Cliente(); 
    c.setCodCliente(vcodcliente);
    c.setCpfCliente(vcpfcliente);
    c.setNomeCliente(vnomcliente);
    c.setEmailCliente(vemailcliente);
    c.setNrcartao(vnrcartao);
    if (c.alterarCliente()) {
        out.write("Cliente alterado com sucesso");
        response.sendRedirect("consultaCliente.jsp");
    } else {
        out.write("Problemas ao salvar cliente");
        response.sendRedirect("consultaCliente.jsp");
    }
        %> 