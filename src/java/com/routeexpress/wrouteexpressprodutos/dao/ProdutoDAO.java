package com.routeexpress.wrouteexpressprodutos.dao;

import com.routeexpress.wrouteexpressprodutos.conexaodb.ConexaoBDJavaDB;
import com.routeexpress.wrouteexpressprodutos.produto.Estoque;
import com.routeexpress.wrouteexpressprodutos.produto.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Henrique Fogaça, DANIEL Telles
 */
public class ProdutoDAO {

    //Comando sql responsavel por recupera uma lista de todos os produtos "cervejas" presentes no sistema
    String sqlListar = "SELECT TBL_CERVEJARIA.ID_CERVEJARIA, TBL_CERVEJARIA.CERVEJARIA, TBL_CERVEJARIA.PAIS, "
            + "TBL_CERVEJA.ID_CERVEJA, TBL_CERVEJA.ID_CERVEJARIA AS \"FK_CERVEJARIA\", "
            + "TBL_CERVEJA.ROTULO, TBL_CERVEJA.PRECO, TBL_CERVEJA.VOLUME, TBL_CERVEJA.TEOR, TBL_CERVEJA.COR, TBL_CERVEJA.TEMPERATURA, "
            + "TBL_CERVEJA.FAMILIA_E_ESTILO, TBL_CERVEJA.DESCRICAO, TBL_CERVEJA.SABOR, TBL_CERVEJA.IMAGEM_1, TBL_CERVEJA.IMAGEM_2, TBL_CERVEJA.IMAGEM_3 "
            + "FROM TBL_CERVEJARIA "
            + "INNER JOIN TBL_CERVEJA "
            + "ON TBL_CERVEJARIA.ID_CERVEJARIA = TBL_CERVEJA.ID_CERVEJARIA";

    //Comando sql responsavel por recupera uma lista de todos os produtos "cervejas" presentes no sistema a parti de determinada cervejaria
    String sqlCervejaria = "SELECT TBL_CERVEJARIA.ID_CERVEJARIA, TBL_CERVEJARIA.CERVEJARIA, TBL_CERVEJARIA.PAIS, "
            + "TBL_CERVEJA.ID_CERVEJA, TBL_CERVEJA.ID_CERVEJARIA AS \"FK_CERVEJARIA\", "
            + "TBL_CERVEJA.ROTULO, TBL_CERVEJA.PRECO, TBL_CERVEJA.VOLUME, TBL_CERVEJA.TEOR, TBL_CERVEJA.COR, TBL_CERVEJA.TEMPERATURA, "
            + "TBL_CERVEJA.FAMILIA_E_ESTILO, TBL_CERVEJA.DESCRICAO, TBL_CERVEJA.SABOR, TBL_CERVEJA.IMAGEM_1, TBL_CERVEJA.IMAGEM_2, TBL_CERVEJA.IMAGEM_3 "
            + "FROM TBL_CERVEJARIA "
            + "INNER JOIN TBL_CERVEJA "
            + "ON TBL_CERVEJARIA.ID_CERVEJARIA = TBL_CERVEJA.ID_CERVEJARIA "
            + "WHERE TBL_CERVEJARIA.CERVEJARIA = ";
    
    //Comando sql responsavel por recupera uma lista de todos os produtos "cervejas" presentes no sistema a parti de determinado pais
    String sqlPais = "SELECT TBL_CERVEJARIA.ID_CERVEJARIA, TBL_CERVEJARIA.CERVEJARIA, TBL_CERVEJARIA.PAIS, "
            + "TBL_CERVEJA.ID_CERVEJA, TBL_CERVEJA.ID_CERVEJARIA AS \"FK_CERVEJARIA\", "
            + "TBL_CERVEJA.ROTULO, TBL_CERVEJA.PRECO, TBL_CERVEJA.VOLUME, TBL_CERVEJA.TEOR, TBL_CERVEJA.COR, TBL_CERVEJA.TEMPERATURA, "
            + "TBL_CERVEJA.FAMILIA_E_ESTILO, TBL_CERVEJA.DESCRICAO, TBL_CERVEJA.SABOR, TBL_CERVEJA.IMAGEM_1, TBL_CERVEJA.IMAGEM_2, TBL_CERVEJA.IMAGEM_3 "
            + "FROM TBL_CERVEJARIA "
            + "INNER JOIN TBL_CERVEJA "
            + "ON TBL_CERVEJARIA.ID_CERVEJARIA = TBL_CERVEJA.ID_CERVEJARIA "
            + "WHERE TBL_CERVEJARIA.PAIS = ";

    //Comando sql responsavel por recupera uma lista de todos os produtos "cervejas" presentes no sistema a parti de determinado volume
    String sqlVolume = "SELECT TBL_CERVEJARIA.ID_CERVEJARIA, TBL_CERVEJARIA.CERVEJARIA, TBL_CERVEJARIA.PAIS, "
            + "TBL_CERVEJA.ID_CERVEJA, TBL_CERVEJA.ID_CERVEJARIA AS \"FK_CERVEJARIA\", "
            + "TBL_CERVEJA.ROTULO, TBL_CERVEJA.PRECO, TBL_CERVEJA.VOLUME, TBL_CERVEJA.TEOR, TBL_CERVEJA.COR, TBL_CERVEJA.TEMPERATURA, "
            + "TBL_CERVEJA.FAMILIA_E_ESTILO, TBL_CERVEJA.DESCRICAO, TBL_CERVEJA.SABOR, TBL_CERVEJA.IMAGEM_1, TBL_CERVEJA.IMAGEM_2, TBL_CERVEJA.IMAGEM_3 "
            + "FROM TBL_CERVEJARIA "
            + "INNER JOIN TBL_CERVEJA "
            + "ON TBL_CERVEJARIA.ID_CERVEJARIA = TBL_CERVEJA.ID_CERVEJARIA "
            + "WHERE TBL_CERVEJA.VOLUME = ";

    //Lista de comandos
    String[] consultas = {sqlListar, sqlCervejaria, sqlPais, sqlVolume};
    
    /**
     * ConsultarProdutos metodo utilizado para a consulta de produtos "cervejas" vigentes na base de dados
     * o metodo recebe como parametro valores responsaveis por filtrar a consulta assim podendo
     * retorna diferentes listas de produtos "cervejas"
     * @param consulta Indice para escolhe de determindado comando sql na Lista de comandos chamada consultas
     * @param valor Valor usado na clausula Where para filtrar a pesquisa
     * @return Uma lista de produtos "cervejas"
     */
    public List<Produto> consultarProdutos(int consulta, String valor) {
        ConexaoBDJavaDB conexaoBD = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<Produto> produtos = new ArrayList<>();
        try {
            conn = conexaoBD.obterConexao();
            stmt = conn.createStatement();
            //Se a consulta for igual a zero(0) uma lista de todos os produtos "cervejas" e recuperada
            if (consulta == 0) {
                rs = stmt.executeQuery(consultas[consulta]);
                //Se a consulta for igual a tres(3) uma lista de todos os produtos "cervejas" e recuperada a parti do preco
            } else {
                rs = stmt.executeQuery(consultas[consulta] + "'" + valor + "'");
            }
            Produto produto;
            while (rs.next()) {
                produto = new Produto();
                produto.setIdCervejaria(rs.getInt("ID_CERVEJARIA"));
                produto.setCervejaria(rs.getString("CERVEJARIA"));
                produto.setPais(rs.getString("PAIS"));
                produto.setIdCerveja(rs.getInt("ID_CERVEJA"));
                produto.setIdFkCervajaria(rs.getInt("FK_CERVEJARIA"));
                produto.setRotulo(rs.getString("ROTULO"));
                produto.setPreco(rs.getString("PRECO"));
                produto.setVolume(rs.getString("VOLUME"));
                produto.setTeor(rs.getString("TEOR"));
                produto.setCor(rs.getString("COR"));
                produto.setTemperatura(rs.getString("TEMPERATURA"));
                produto.setFamiliaEEstilo(rs.getString("FAMILIA_E_ESTILO"));
                produto.setDescricao(rs.getString("DESCRICAO"));
                produto.setSabor(rs.getString("SABOR"));
                produto.setImagem1(rs.getString("IMAGEM_1"));
                produto.setImagem2(rs.getString("IMAGEM_2"));
                produto.setImagem3(rs.getString("IMAGEM_3"));
                produtos.add(produto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return produtos;
    }
    
    /**
     * Retorna um produto "cerveja" a parti da sua identificacao na base de dados
     * esse metodo e usado na pagina de descricao do produto
     * @param produto Uma instancia de produto com a sua identificao unica no atributo id
     * @return Um item de produto "cerveja" com todos seus atributos setados
     */
    public Produto consultarProduto(Produto produto) {
        ConexaoBDJavaDB conexaoBD = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Produto cerveja = null;
        String sql = "SELECT TBL_CERVEJARIA.ID_CERVEJARIA, TBL_CERVEJARIA.CERVEJARIA, TBL_CERVEJARIA.PAIS, "
                + "TBL_CERVEJA.ID_CERVEJA, TBL_CERVEJA.ID_CERVEJARIA AS \"FK_CERVEJARIA\", "
                + "TBL_CERVEJA.ROTULO, TBL_CERVEJA.PRECO, TBL_CERVEJA.VOLUME, TBL_CERVEJA.TEOR, TBL_CERVEJA.COR, TBL_CERVEJA.TEMPERATURA, "
                + "TBL_CERVEJA.FAMILIA_E_ESTILO, TBL_CERVEJA.DESCRICAO, TBL_CERVEJA.SABOR, TBL_CERVEJA.IMAGEM_1, TBL_CERVEJA.IMAGEM_2, TBL_CERVEJA.IMAGEM_3 "
                + "FROM TBL_CERVEJARIA "
                + "INNER JOIN TBL_CERVEJA "
                + "ON TBL_CERVEJARIA.ID_CERVEJARIA = TBL_CERVEJA.ID_CERVEJARIA "
                + "WHERE ID_CERVEJA = ?";
        try {
            conn = conexaoBD.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, produto.getIdCerveja());
            rs = stmt.executeQuery();
            if (rs.next()) {
                cerveja = new Produto();
                cerveja.setIdCervejaria(rs.getInt("ID_CERVEJARIA"));
                cerveja.setCervejaria(rs.getString("CERVEJARIA"));
                cerveja.setPais(rs.getString("PAIS"));
                cerveja.setIdCerveja(rs.getInt("ID_CERVEJA"));
                cerveja.setIdFkCervajaria(rs.getInt("FK_CERVEJARIA"));
                cerveja.setRotulo(rs.getString("ROTULO"));
                cerveja.setPreco(rs.getString("PRECO"));
                cerveja.setVolume(rs.getString("VOLUME"));
                cerveja.setTeor(rs.getString("TEOR"));
                cerveja.setCor(rs.getString("COR"));
                cerveja.setTemperatura(rs.getString("TEMPERATURA"));
                cerveja.setFamiliaEEstilo(rs.getString("FAMILIA_E_ESTILO"));
                cerveja.setDescricao(rs.getString("DESCRICAO"));
                cerveja.setSabor(rs.getString("SABOR"));
                cerveja.setImagem1(rs.getString("IMAGEM_1"));
                cerveja.setImagem2(rs.getString("IMAGEM_2"));
                cerveja.setImagem3(rs.getString("IMAGEM_3"));
            } else {
                return cerveja;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cerveja;
    }

    public Estoque consultaExistenciaDeEstoque(Estoque estoque) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from TBL_ESTOQUE where id_cerveja = ?";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, estoque.getIdCerveja());
            rs = stmt.executeQuery();
            if (rs.next()) {
                estoque.setId(rs.getInt("id_estoque"));
                estoque.setIdCerveja(rs.getInt("id_cerveja"));
                estoque.setQuantidade(rs.getInt("quantidade"));
                estoque.setPorcentagem(rs.getDouble("porcentagem"));
                estoque.setEstoqueMinimo(rs.getInt("estoque_minimo"));
                estoque.setEstoqueMaximo(rs.getInt("estoque_maximo"));
                estoque.setPrecoAquisicao(rs.getDouble("preco_aquisicao"));
                estoque.setLucro(rs.getDouble("lucro"));
                estoque.setDisponibilidade(rs.getInt("disponibilidade"));
            } else {
                estoque = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return estoque;
    }
}
