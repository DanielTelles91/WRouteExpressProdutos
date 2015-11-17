/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.enderecoDAO;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import com.routeexpress.wrouteexpressprodutos.clientedao.ClienteDAO;
import com.routeexpress.wrouteexpressprodutos.conexaodb.ConexaoBDJavaDB;
import com.routeexpress.wrouteexpressprodutos.endereco.Endereco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DANIEL Telles
 */
public class EnderecoDAO {

    public void cadastrarEndereco(Endereco endereco, String cpf) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "insert into enderecos (cpf, cep, tipo_logradouro, logradouro, logradouro_numero, bairro, cidade, estado) values (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cpf);
            stmt.setString(2, endereco.getCep());
            stmt.setString(3, endereco.getTipoLogradouro());
            stmt.setString(4, endereco.getLogradouro());
            stmt.setString(5, endereco.getLogradouroNumero());
            stmt.setString(6, endereco.getBairro());
            stmt.setString(7, endereco.getCidade());
            stmt.setString(8, endereco.getEstado());
            stmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public ArrayList<Endereco> consultarEnderecoEdit(String cpf) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Endereco> enderecos = new ArrayList<>();
        Endereco endereco;

        String sql = "SELECT ID_ENDERECOS, CPF, CEP, TIPO_LOGRADOURO, \n"
                + "LOGRADOURO, LOGRADOURO_NUMERO, BAIRRO, CIDADE, ESTADO FROM ENDERECOS WHERE CPF = '" + cpf + "'";

        try {
            ConexaoBDJavaDB conexaoBD = new ConexaoBDJavaDB("routeexpress");
            conn = conexaoBD.obterConexao();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                endereco = new Endereco();
                endereco.setCep(rs.getString("CEP"));
                endereco.setTipoLogradouro(rs.getString("TIPO_LOGRADOURO"));
                endereco.setLogradouro(rs.getString("LOGRADOURO"));
                endereco.setLogradouroNumero(rs.getString("LOGRADOURO_NUMERO"));
                endereco.setBairro(rs.getString("BAIRRO"));
                endereco.setCidade(rs.getString("CIDADE"));
                endereco.setEstado(rs.getString("ESTADO"));
                System.out.println("testeeee" + endereco.getCep());
                enderecos.add(endereco);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return enderecos;
    }

    public void alterarEndereco(String cpf, Endereco endereco) {

        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "UPDATE ENDERECOS SET CEP = ?, TIPO_LOGRADOURO = ?, LOGRADOURO = ?, LOGRADOURO_NUMERO = ?, BAIRRO = ?, CIDADE = ?, ESTADO = ?  WHERE CPF = '" + cpf + "'";

        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, endereco.getCep());
            stmt.setString(2, endereco.getTipoLogradouro());
            stmt.setString(3, endereco.getLogradouro());
            stmt.setString(4, endereco.getLogradouroNumero());
            stmt.setString(5, endereco.getBairro());
            stmt.setString(6, endereco.getCidade());
            stmt.setString(7, endereco.getEstado());
            stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void apagarEndereco(String cpf) {

        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        Statement stmt = null;
        String sql = "DELETE FROM ENDERECOS  WHERE CPF = '" + cpf + "'";

        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.createStatement();
            stmt.execute(sql);

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
