package com.routeexpress.wrouteexpressprodutos.dao;

import com.routeexpress.wrouteexpressprodutos.conexaodb.ConexaoBDJavaDB;
import com.routeexpress.wrouteexpressprodutos.produto.ListaDeDesejo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ListaDeDesejoDAO {

    public void cadastrarItemNaListaDeDesejo(ListaDeDesejo item) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "insert into TBL_LISTADEDESEJOS (id_cliente, id_cerveja) values (?, ?)";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, item.getIdCliente());
            stmt.setInt(2, item.getIdCerveja());
            stmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public List<ListaDeDesejo> listarItensDeDesejoDoCliente(ListaDeDesejo idCliente) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select id_item, id_cliente, id_cerveja from TBL_LISTADEDESEJOS where id_cliente = ?";
        List<ListaDeDesejo> itensDaListaDeDesejo = new ArrayList<>();
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente.getIdCliente());
            rs = stmt.executeQuery();
            ListaDeDesejo item;
            while (rs.next()) {
                item = new ListaDeDesejo();
                item.setIdItem(rs.getInt("id_item"));
                item.setIdCliente(rs.getInt("id_cliente"));
                item.setIdCerveja(rs.getInt("id_cerveja"));
                itensDaListaDeDesejo.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return itensDaListaDeDesejo;
    }

    public void removerItemDaListaDeDesejo(ListaDeDesejo item) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "delete from TBL_LISTADEDESEJOS where id_cliente = ? AND id_cerveja = ?";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, item.getIdCliente());
            stmt.setInt(2, item.getIdCerveja());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

    public ListaDeDesejo consultaExistenciaDeUmItemNaListaDeDesejo(ListaDeDesejo item) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from TBL_LISTADEDESEJOS where id_cliente = ? AND id_cerveja = ?";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, item.getIdCliente());
            stmt.setInt(2, item.getIdCerveja());
            rs = stmt.executeQuery();
            if (rs.next()) {
                item.setIdItem(rs.getInt("id_item"));
                item.setIdCliente(rs.getInt("id_cliente"));
                item.setIdCerveja(rs.getInt("id_cerveja"));
            } else {
                item = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ListaDeDesejoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return item;
    }
}
