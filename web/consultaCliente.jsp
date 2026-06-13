<%@page import="java.util.List"%>
<%@page import="Classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles/padraotelagrid.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    
     <style>
    .msg-popup2 {
        z-index: 10;
        width: 30%;
        height: 20vh;
        margin-left:  500px;
        margin-right: 400px;
        top: 250px;
        background-color: rgb(9, 117, 167);
        display: none;
        position: absolute;
        border: 2px solid #b2b2b2;
        -webkit-border-radius: 15px;
        border-radius: 15px;
        -webkit-box-shadow: 0px 1px 4px 0px rgba(43, 40, 40, 0.6) inset;
        box-shadow: 0px 1px 4px 0px rgba(43, 40, 40, 0.6) inset;
        -webkit-transition: all 0.2s linear;
        transition: all 0.2s linear;       
        }
    </style>    
    
    <body>
        <%
        Cliente cliente = new Cliente();
        List<Cliente> listaClientes = cliente.consultarTodosClientes();
        %>
            <h4 class="text-center">Relação de Clientes</h4>
            <%-- label para lançar mensagem de feedback da atualização --%>
            <label class="cabecalho" id="msg"> 
                <%
                    if(request.getParameter("pmensagem") != null)         
                    out.write(request.getParameter("pmensagem"));
                %>
            </label>

        <table id="consulta">
            <thead>
            <th>Código</th>
            <th>CPF</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Nr.Cartão</th>
            
            <th> Editar </th>
            <th> Excluir </th>
        </thead>
        
        <tbody>
            <% for (Cliente c : listaClientes) {%>
            <tr>
                <td><% out.write("" + c.getCodCliente()); %></td>
                <td><% out.write(c.getCpfCliente()); %></td>
                <td><% out.write(c.getNomeCliente()); %></td>
                <td><% out.write(c.getEmailCliente()); %></td>
                <td><% out.write(c.getNrcartao()); %></td>
                <td><%out.write("<a href=editarCliente.jsp?codcliente=" + c.getCodCliente() + ">" + "<i class='far fa-edit'       style='color:blue'></i>" + "</a>");%></td> 
               <td><button type="button" id="botaoexcluir" onclick="mostrarExclusao(<%out.write("" + c.getCodCliente());%>)"><i class='far fa-trash-alt' style='color:red'></i> </button></td></button></td>                         
            </tr> 

            <%}%>
        </tbody>
    </table>
</body>
<!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                
        
        <div class="msg-popup2">
            <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
            <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
            <div class="text-center">                
                <a href=""><button class="btn btn-dark" click="cancela()"> Não </button></a>
                <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
            </div>
        </div>                
                
        <script>
            function cancela() {
                document.getElementsByClassName("msg-popup2")[0].style.display = "none";
            }
        
            function mostrarExclusao(codcliente) {
                document.getElementsByClassName("msg-popup2")[0].style.display = "block";
                var link = document.getElementById("exclui");
                link.href = "excluirCliente.jsp?codcliente=" + codcliente;
            }
        </script>   
</html>
