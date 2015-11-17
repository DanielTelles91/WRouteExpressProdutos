package com.routeexpress.wrouteexpressprodutos.dao;

import com.routeexpress.wrouteexpressprodutos.conexaodb.*;
import com.routeexpress.wrouteexpressprodutos.produto.Estoque;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EstoqueDAO {

    public void cadastrarEstoque(Estoque estoque) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "insert into TBL_ESTOQUE (id_cerveja, quantidade, porcentagem, estoque_minimo, estoque_maximo, "
                + "preco_aquisicao, lucro, disponibilidade) values (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, estoque.getIdCerveja());
            stmt.setInt(2, estoque.getQuantidade());
            stmt.setDouble(3, estoque.getPorcentagem());
            stmt.setInt(4, estoque.getEstoqueMinimo());
            stmt.setInt(5, estoque.getEstoqueMaximo());
            stmt.setDouble(6, estoque.getPrecoAquisicao());
            stmt.setDouble(7, estoque.getLucro());
            stmt.setInt(8, estoque.getDisponibilidade());
            stmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public List<Estoque> listarEstoque() {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "select * from TBL_ESTOQUE";
        List<Estoque> listaDoEstoque = new ArrayList<>();
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            Estoque estoque;
            while (rs.next()) {
                estoque = new Estoque();
                estoque.setId(rs.getInt("id_estoque"));
                estoque.setIdCerveja(rs.getInt("id_cerveja"));
                estoque.setQuantidade(rs.getInt("quantidade"));
                estoque.setPorcentagem(rs.getDouble("porcentagem"));
                estoque.setEstoqueMinimo(rs.getInt("estoque_minimo"));
                estoque.setEstoqueMaximo(rs.getInt("estoque_maximo"));
                estoque.setPrecoAquisicao(rs.getDouble("preco_aquisicao"));
                estoque.setLucro(rs.getDouble("lucro"));
                estoque.setDisponibilidade(rs.getInt("disponibilidade"));
                listaDoEstoque.add(estoque);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listaDoEstoque;
    }

    public void alterarEstoque(Estoque estoque) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "update TBL_ESTOQUE set quantidade = ?, porcentagem = ?,"
                + " estoque_minimo = ?, estoque_maximo = ?, preco_aquisicao = ?, lucro = ?, disponibilidade = ?"
                + " where id_estoque = ?";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, estoque.getQuantidade());
            stmt.setDouble(2, estoque.getPorcentagem());
            stmt.setInt(3, estoque.getEstoqueMinimo());
            stmt.setInt(4, estoque.getEstoqueMaximo());
            stmt.setDouble(5, estoque.getPrecoAquisicao());
            stmt.setDouble(6, estoque.getLucro());
            stmt.setInt(7, estoque.getDisponibilidade());
            stmt.setInt(8, estoque.getId());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void removerEstoque(Estoque estoque) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "delete from TBL_ESTOQUE where id_cerveja = ?";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, estoque.getIdCerveja());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
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
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EstoqueDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return estoque;
    }

}
