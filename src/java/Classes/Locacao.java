package Classes;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;


public class Locacao {

    private int    codLocacao;
    private String placaVeiculo;
    private int    codCliente;
    private Date   dataReserva;
    private Date   dataDevolucao;
    private Date   dataLocacao;
    private Veiculo veiculo;
    private Cliente cliente;

    public boolean incluirLocacao() throws ClassNotFoundException {
        String sql  ="insert into locacao ";
               sql +=" (placaveiculo, codcliente, datareserva, datalocacao, datadevolucao )";
               sql += " values (?,?,?,?,?) "; 
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placaVeiculo);
            stm.setInt(2, this.codCliente);
            stm.setDate(3, this.dataReserva);
            stm.setDate(4, this.dataLocacao);
            stm.setDate(5, this.dataDevolucao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;  
    }
    
    public boolean alterarLocacao() throws ClassNotFoundException {
        String  sql  = "update locacao       " ;
                sql += "set datareserva = ?, ";
                sql += "    datalocacao = ?  ";
                sql += "where codlocacao = ? ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate(1, this.dataReserva);
            stm.setDate(2, this.dataLocacao);
            stm.setInt(3, this.codLocacao);    
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }
 
    public boolean excluirLocacao() throws ClassNotFoundException {
        String sql  = "delete from locacao ";
               sql += "where codlocacao = ? ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codLocacao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }

    public Locacao consultarLocacao() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select codlocacao,placaveiculo, codcliente, datareserva, ";
               sql += "       datalocacao, datadevolucao ";
               sql += " from locacao ";
               sql += " where codlocacao = ?";

        Locacao loc = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codLocacao);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                loc = new Locacao();
                loc.setCodLocacao(rs.getInt("codlocacao"));
                loc.setPlacaVeiculo(rs.getString("placaveiculo"));
                loc.setCodCliente(rs.getInt("codCliente"));
                loc.setDataReserva(rs.getDate("datareserva"));
                loc.setDataLocacao(rs.getDate("datalocacao"));
                loc.setDataDevolucao(rs.getDate("datadevolucao"));
            }
        } 
        catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return loc;
    }

     public ResultSet consultarTodasLocacoesInner() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT l.codlocacao,    l.placaveiculo, v.marcaveiculo,  ";
                sql += "       v.modeloveiculo, l.codcliente,   c.cpfcliente,    ";
                sql += "       c.nomecliente, "; 
                sql += "       IFNULL(CAST(DATE_FORMAT(l.datareserva,'%d/%m/%Y') AS CHAR),'') datareserva, ";
                sql += "       IFNULL(CAST(DATE_FORMAT(l.datadevolucao,'%d/%m/%Y') AS CHAR),'') datadevolucao, ";
                sql += "       IFNULL(CAST(DATE_FORMAT(l.datalocacao, '%d/%m/%Y') AS CHAR),'') datalocacao ";
                sql += " FROM locacao l ";
                sql += "INNER JOIN veiculo v ";
                sql += "    ON l.placaveiculo = v.placaveiculo ";
                sql += "INNER JOIN cliente c ";
                sql += "    ON l.codcliente   = c.codcliente ";
                sql += "ORDER BY l.codlocacao; ";
        ResultSet rs = null;                
        try {
             PreparedStatement stm = con.prepareStatement(sql);
             rs = stm.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return rs;
    }
     
    public List<Locacao> consultarTodasLocacoes() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select codlocacao,placaveiculo, datareserva, codcliente, datalocacao, ";
               sql += " datadevolucao ";
               sql += " from locacao ";
               sql += " order by codlocacao";
        // criacao da lista que irá conter os dados recuperados do banco de dados
        List<Locacao> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                Locacao loc = new Locacao();
                loc.setCodLocacao(rs.getInt("codlocacao"));
                loc.setPlacaVeiculo(rs.getString("placaveiculo"));
                loc.setCodCliente(rs.getInt("codCliente"));
                loc.setDataReserva(rs.getDate("datareserva"));
                loc.setDataLocacao(rs.getDate("datalocacao"));
                loc.setDataDevolucao(rs.getDate("datadevolucao"));              
                lista.add(loc);
            }
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
        }
        return lista;
    }

    public void devolverVeiculo() {
        
    }

    public void realizarAcertoFinanceiro() {
        
    }

    public int getCodLocacao() {
        return codLocacao;
    }

    public void setCodLocacao(int codLocacao) {
        this.codLocacao = codLocacao;
    }

    public String getPlacaVeiculo() {
        return placaVeiculo;
    }

    public void setPlacaVeiculo(String placaVeiculo) {
        this.placaVeiculo = placaVeiculo;
    }

    public int getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(int codCliente) {
        this.codCliente = codCliente;
    }

    public Date getDataReserva() {
        return dataReserva;
    }

    public void setDataReserva(Date dataReserva) {
        this.dataReserva = dataReserva;
    }

    public Date getDataDevolucao() {
        return dataDevolucao;
    }

    public void setDataDevolucao(Date dataDevolucao) {
        this.dataDevolucao = dataDevolucao;
    }

    public Date getDataLocacao() {
        return dataLocacao;
    }

    public void setDataLocacao(Date dataLocacao) {
        this.dataLocacao = dataLocacao;
    }

}