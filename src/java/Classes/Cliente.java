package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Cliente {

    private int    codCliente;
    private String cpfCliente;
    private String nomeCliente;
    private String emailCliente;
    private String  nrcartao;

   public boolean incluirCliente() throws ClassNotFoundException{
        String sql  = "insert into cliente ( codcliente, cpfcliente, nomecliente, emailcliente, nrcartao) ";
               sql += "values (?,?,?,?,?) ";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codCliente);
            stm.setString(2, this.cpfCliente);
            stm.setString(3, this.nomeCliente);
            stm.setString(4, this.emailCliente);
            stm.setString(5, this.nrcartao);
            stm.execute();
            
        } catch (SQLException ex){
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }
    public boolean alterarCliente() throws ClassNotFoundException{
        String sql  = "update cliente " ;
               sql += "set codcliente   = ?, ";
               sql += "    cpfcliente   = ?, ";
               sql += "    nomecliente  = ?, ";
               sql += "    emailcliente = ?, ";
               sql += "    nrcartao     = ?  ";
               sql += "where codcliente = ?  ";      
        Connection con = Conexao.conectar();
        
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codCliente);
            stm.setString(2, this.cpfCliente);
            stm.setString(3, this.nomeCliente);
            stm.setString(4, this.emailCliente);
            stm.setString(5, this.nrcartao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }
    
     public boolean excluirCliente() throws ClassNotFoundException{
        String sql  = "delete from cliente ";
               sql += "where codcliente = ? ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codCliente);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }
     
    public Cliente consultarCliente() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select codcliente, cpfcliente,nomecliente, ";
               sql += "emailcliente, nrcartao ";
               sql += "from cliente ";

        Cliente cli = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codCliente);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                cli = new Cliente();
                cli.setCodCliente(rs.getInt("codcliente"));
                cli.setCpfCliente(rs.getString("cpfcliente"));
                cli.setNomeCliente(rs.getString("nomecliente"));
                cli.setEmailCliente(rs.getString("emailcliente"));
                cli.setNrcartao(rs.getString("nrcartao"));
            }
        } 
        catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cli;
    }
    
    public List<Cliente> consultarTodosClientes() throws ClassNotFoundException{
        String sql  = "select codcliente, cpfcliente,nomecliente, ";
               sql += "emailcliente, nrcartao ";
               sql += "from cliente ";
               sql += "order by nomecliente ";
        Connection con = Conexao.conectar();
        // criacao da lista que irá conter os dados recuperados do banco de dados
        List<Cliente> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setCodCliente(rs.getInt("codcliente"));
                cli.setCpfCliente(rs.getString("cpfcliente"));
                cli.setNomeCliente(rs.getString("nomecliente"));
                cli.setEmailCliente(rs.getString("emailcliente"));
                cli.setNrcartao(rs.getString("nrcartao"));
                lista.add(cli);
            }
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
        }
        return lista;
    }
    
    public List<Cliente> lovClientes() throws ClassNotFoundException{
        String sql  = "select codcliente, concat(nomecliente,' - ',cpfcliente) nomecliente ";
               sql += "from cliente ";
               sql += "order by nomecliente ";
        Connection con = Conexao.conectar();
        // criacao da lista que irá conter os dados recuperados do banco de dados
        List<Cliente> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setCodCliente(rs.getInt("codcliente"));
                cli.setNomeCliente(rs.getString("nomecliente"));
                lista.add(cli);
            }
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
        }
        return lista;
    }
    
    // areas de getters e setters
     public int getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(int codCliente) {
        this.codCliente = codCliente;
    }
    
    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public String getNrcartao() {
        return nrcartao;
    }

    public void setNrcartao(String nrcartao) {
        this.nrcartao = nrcartao;
    }

   

}