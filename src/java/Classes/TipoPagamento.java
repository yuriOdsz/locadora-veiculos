package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class TipoPagamento {

    private int    codTipoPagamento;
    private String descTipoPagamento;

    
    public boolean incluirTipoPagamento() throws ClassNotFoundException {
        String sql  = "insert into tipopagamento (desctipopagamento) ";
               sql += "values (?) ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descTipoPagamento);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
        
    }

    public boolean alterarTipoPagamento() throws ClassNotFoundException {
        String sql  = "update tipopagamento " ;
               sql += "set desctipopagamento = ? ";
               sql += "where codtipopagamento = ? ";      
        Connection con = Conexao.conectar();
        
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descTipoPagamento);
            stm.setInt(2, this.codTipoPagamento);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        
        return true;        
    }

    public boolean excluirTipoPagamento() throws ClassNotFoundException {
        String sql  = "delete from tipopagamento ";
               sql += "where codtipopagamento = ? ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codTipoPagamento);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        
        return true;
    }

    public TipoPagamento consultarTipoPagamento() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select codtipopagamento, desctipopagamento ";
               sql += "from tipopagamento ";
               sql += "where codtipopagamento = ?";
        TipoPagamento tip = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codTipoPagamento);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                tip = new TipoPagamento();
                tip.setCodTipoPagamento(rs.getInt("codtipopagamento"));
                tip.setDescTipoPagamento(rs.getString("desctipopagamento"));
            }
        } 
        catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return null;
        }        
        return tip;
    }

    public List<TipoPagamento> consultarTodosTipoPagamento() throws ClassNotFoundException {
        String sql  = "select codtipopagamento, desctipopagamento ";
               sql += "from tipopagamento ";
               sql += "order by desctipopagamento ";
        Connection con = Conexao.conectar();
        // criacao da lista que irá conter os dados recuperados do banco de dados
        List<TipoPagamento> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                TipoPagamento tip = new TipoPagamento();
                tip.setCodTipoPagamento(rs.getInt("codtipopagamento"));
                tip.setDescTipoPagamento(rs.getString("desctipopagamento"));
                lista.add(tip);
            }
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return null;
        }
        return lista;
    }

    public void listarTiposPagamento() {
        
    }
        
    public String getDescTipoPagamento() {
        return descTipoPagamento;
    }

    public void setDescTipoPagamento(String descTipoPagamento) {
        this.descTipoPagamento = descTipoPagamento;
    }

    public int getCodTipoPagamento() {
        return codTipoPagamento;
    }

    public void setCodTipoPagamento(int codTipoPagamento) {
        this.codTipoPagamento = codTipoPagamento;
    }

}