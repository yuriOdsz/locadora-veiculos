package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Veiculo {

    private String  placaVeiculo;
    private String  marcaVeiculo;
    private String  modeloVeiculo;
    private Double  kmVeiculo;
    private boolean temArCondicionado;
    private boolean temDirHidraulica;
    private boolean veiculoRevisado;
    private char voperacao;
    public boolean incluirVeiculo() throws ClassNotFoundException {
        String sql  ="insert into veiculo ";
               sql +=" (placaveiculo, marcaveiculo, modeloveiculo, kmveiculo, ";
               sql +="  temarcondicionado, temdirecaohidraulica, veiculorevisado) ";
               sql += " values (?,?,?,?,?,?,?) "; 
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placaVeiculo);
            stm.setString(2, this.marcaVeiculo);
            stm.setString(3, this.modeloVeiculo);
            stm.setDouble(4, this.kmVeiculo);
            stm.setBoolean(5, this.temArCondicionado);
            stm.setBoolean(6, this.temDirHidraulica);
            stm.setBoolean(7, this.veiculoRevisado);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;  
    }

    public boolean alterarVeiculo() throws ClassNotFoundException {
           String sql  = "update veiculo " ;
                  sql += "set marcaveiculo         = ?, ";
                  sql += "    modeloveiculo        = ?, ";
                  sql += "    kmveiculo            = ?, ";
                  sql += "    temarcondicionado    = ?, ";
                  sql += "    temdirecaohidraulica = ?, ";
                  sql += "    veiculorevisado      = ?  ";
                  sql += "where placaveiculo = ?        ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString (1, this.marcaVeiculo);
            stm.setString (2, this.modeloVeiculo);
            stm.setDouble (3, this.kmVeiculo);
            stm.setBoolean(4, this.temArCondicionado);
            stm.setBoolean(5, this.temDirHidraulica);
            stm.setBoolean(6, this.veiculoRevisado); 
            stm.setString (7, this.placaVeiculo);            
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirVeiculo() throws ClassNotFoundException {
        System.out.println("entrou");
        String sql  = "delete from veiculo ";
               sql += "where placaveiculo = ? ";      
        Connection con = Conexao.conectar();
        try { 
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placaVeiculo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
            return false;
        }
        return true;
    }

    public Veiculo consultarVeiculo() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select placaveiculo, marcaveiculo, modeloveiculo, kmveiculo,";
               sql += " temarcondicionado, temdirecaohidraulica, veiculorevisado ";
               sql += " from veiculo ";
               sql += " where placaveiculo = ?";

        Veiculo vei = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placaVeiculo);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                vei = new Veiculo();
                vei.setPlacaVeiculo(rs.getString("placaveiculo"));
                vei.setMarcaVeiculo(rs.getString("marcaveiculo"));
                vei.setModeloVeiculo(rs.getString("modeloveiculo"));
                vei.setKmVeiculo(rs.getDouble("kmveiculo"));
                vei.setTemArCondicionado(rs.getBoolean("temarcondicionado"));
                vei.setTemDirHidraulica(rs.getBoolean("temdirecaohidraulica"));
                vei.setVeiculoRevisado(rs.getBoolean("veiculorevisado"));
            }
        } 
        catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return vei;
    }

    public List<Veiculo> consultarTodosVeiculos() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select placaveiculo, marcaveiculo, modeloveiculo, kmveiculo,";
               sql += " temarcondicionado, temdirecaohidraulica, veiculorevisado ";
               sql += " from veiculo ";
               sql += " order by placaveiculo";
        // criacao da lista que irá conter os dados recuperados do banco de dados
        List<Veiculo> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                Veiculo vei = new Veiculo();
                vei.setPlacaVeiculo(rs.getString("placaveiculo"));
                vei.setMarcaVeiculo(rs.getString("marcaveiculo"));
                vei.setModeloVeiculo(rs.getString("modeloveiculo"));
                vei.setKmVeiculo(rs.getDouble("kmveiculo"));
                vei.setTemArCondicionado(rs.getBoolean("temarcondicionado"));
                vei.setTemDirHidraulica(rs.getBoolean("temdirecaohidraulica"));
                vei.setVeiculoRevisado(rs.getBoolean("veiculorevisado"));               
                lista.add(vei);
            }
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
        }
        return lista;
    }

    public List<Veiculo> lovVeiculos() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql  = "select placaveiculo, concat(modeloveiculo,' - ',marcaveiculo) modeloveiculo ";
               sql += " from veiculo ";
               sql += " order by placaveiculo";
        // criacao da lista que irá conter os dados recuperados do banco de dados
        List<Veiculo> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                Veiculo vei = new Veiculo();
                vei.setPlacaVeiculo(rs.getString("placaveiculo"));
                vei.setModeloVeiculo(rs.getString("modeloveiculo"));               
                lista.add(vei);
            }
        } catch (SQLException ex) {
            System.out.println("Erro de execução/montagem de comando " + ex + " Comando = " + sql);
        }
        return lista;
    }
    
    // area de getters e setters
    public void desativarVeiculo() {
        
    }

    public void listarVeiculos() {
        
    }

    /*
    // area de getters e setters
    */
    
    public String getPlacaVeiculo() {
        return placaVeiculo;
    }

    public void setPlacaVeiculo(String placaVeiculo) {
        this.placaVeiculo = placaVeiculo;
    }

    public String getMarcaVeiculo() {
        return marcaVeiculo;
    }

    public void setMarcaVeiculo(String marcaVeiculo) {
        this.marcaVeiculo = marcaVeiculo;
    }

    public String getModeloVeiculo() {
        return modeloVeiculo;
    }

    public void setModeloVeiculo(String modeloVeiculo) {
        this.modeloVeiculo = modeloVeiculo;
    }

    public Double getKmVeiculo() {
        return kmVeiculo;
    }

    public void setKmVeiculo(Double kmVeiculo) {
        this.kmVeiculo = kmVeiculo;
    }

    public boolean isTemArCondicionado() {
        return temArCondicionado;
    }

    public void setTemArCondicionado(boolean temArCondicionado) {
        this.temArCondicionado = temArCondicionado;
    }

    public boolean isTemDirHidraulica() {
        return temDirHidraulica;
    }

    public void setTemDirHidraulica(boolean temDirHidraulica) {
        this.temDirHidraulica = temDirHidraulica;
    }

    public boolean isVeiculoRevisado() {
        return veiculoRevisado;
    }

    public void setVeiculoRevisado(boolean veiculoRevisado) {
        this.veiculoRevisado = veiculoRevisado;
    }

    public char getVoperacao() {
        return voperacao;
    }

    public void setVoperacao(char voperacao) {
        this.voperacao = voperacao;
    }

}