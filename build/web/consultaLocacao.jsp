<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/padraotelagrid.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>    </head>
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
        Locacao loc = new Locacao();
        ResultSet rs = loc.consultarTodasLocacoesInner();
      %>
        <h3 class="text-center"> Relação de Locações </h3>
            <table class="table">
                <thead>
                    <tr><th><th><th><th><th><th><th><th colspan="3"> *******************  D a t a s  **********************</th</tr>
                    <tr>        
                        <th scope="col">Cód</th>
                        <th scope="col">Placa</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Modelo</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Cpf</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Reserva</th>
                        <th scope="col">Locação</th>
                        <th scope="col">Devolução</th>
                        
                        <th scope="col">Editar</th>
                        <th scope="col">Excluir</th>
                    </tr>                        
                </thead>                    

                <tbody>
                    <%while(rs.next()){%>
                    <tr>
                        <td><% out.write(""+rs.getInt("codlocacao"));%></td>
                        <td><% out.write(rs.getString("placaveiculo")); %></td>
                        <td><% out.write(rs.getString("marcaveiculo")); %></td>
                        <td><% out.write(rs.getString("modeloveiculo")); %></td>
                        <td><% out.write(""+rs.getInt("codcliente"));%></td>
                        <td><% out.write(rs.getString("cpfcliente")); %></td>
                        <td><% out.write(rs.getString("nomecliente")); %></td>
                        
                        <% if (""+rs.getString("datareserva") == "") {%>
                                <td><% out.write("        - "); %></td>
                        <% } else { %>
                                <td><% out.write(""+rs.getString("datareserva")); %></td>
                        <% } %>
                        
                        <% if (""+rs.getString("datalocacao") == "") {%>
                                <td><% out.write("        - "); %></td>
                        <% } else { %>
                                <td><% out.write(""+rs.getString("datalocacao")); %></td>
                        <% } %>
                        
                        <% if (""+rs.getString("datadevolucao") == "") {%>
                                <td><% out.write("        - "); %></td>
                        <% } else { %>
                                <td><% out.write(""+rs.getString("datadevolucao")); %></td>
                        <% } %>
                                            
                        <td><%out.write("<a href=editarlocacao.jsp?codlocacao="  + ""+rs.getInt("codlocacao")+ ">" + "<i class='far fa-edit' style='color:blue'></i>" + "</a>");%></td>
                        <td>
                            <button type="button" id="botaoexcluir" 
                                    onclick="mostrarExclusao(<%out.write("" + rs.getInt("codlocacao"));%>)">
                                <i class='far fa-trash-alt' style='color:red'></i> 
                            </button>
                        </td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
 <!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                
        
            <div class="msg-popup2">
                <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
                <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
                <div class="text-center">                
                    <a href=""><button class="btn btn-dark" click="cancela()"> Não </button></a>
                    <a id="exclui" href=""><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
                </div>
            </div>                
                
            <script>
                function cancela() {
                    document.getElementsByClassName("msg-popup2")[0].style.display = "none";
                }

                function mostrarExclusao(codlocacao) {
                    document.getElementsByClassName("msg-popup2")[0].style.display = "block";
                    var link = document.getElementById("exclui");
                    link.href = "excluirlocacao.jsp?codlocacao=" + codlocacao;
                }
            </script>                               
    </body>
</html>