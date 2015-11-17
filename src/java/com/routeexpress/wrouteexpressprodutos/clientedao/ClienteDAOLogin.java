/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.clientedao;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import com.routeexpress.wrouteexpressprodutos.conexaodb.ConexaoBDJavaDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DANIEL
 */
public class ClienteDAOLogin {
  /**
     * Este metodo consulta a existencia do atributo email usado como login de
     * usuario do sistema para a sua autentificacao, caso seja existente durante
     * a consulta a senha desse usuario e retornada para que se prossiga a
     * autentificao ao contrario um valor nulo e retornado caracterizando que
     * esse login de usuario nao foi encontrado na base de dados.
     *
     * @param usuario Usuario setado com os parametros vindos da tela de login
     * @return Um valor nulo caso o login desse usuario seja inexistente na base
     * de dados caso contrario a senha desse usuario
     */
    public String consultaAExistenciaDoLoginDeUsuarioDuranteAAutentificacao(Cliente cliente) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        //Comando que retorna a senha do usuario se o login for encontrado na base de usuarios
        String sql = "select senha from cliente where email = ?";
        //Variavel de retorno
        String senha = null;
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            //Atributo email que ira compor a string sql no lugar de ?
            stmt.setString(1, cliente.getEmail());
            rs = stmt.executeQuery();
            if (rs.next()) {
                //Se o login constar na base a senha desse usuario sera retornada aqui
                senha = rs.getString("senha");
                System.out.println("Teste:" +senha);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return senha;
    }
    
    public String consultaAExistenciaDoCPFDoUsuarioQuandoSolicitadoEmEsqueciAMinhaSenha(Cliente cliente) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        //Comando que retorna o email do usuario quando solicitado a ação esqueci a minha senha da tela de login
        String sql = "select email from cliente where cpf = ?";
        
        //Variavel de retorno
        String email = null;
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            //Atributo cpf que ira compor a string sql no lugar de ?
            stmt.setString(1, cliente.getCpf());
            rs = stmt.executeQuery();
            if (rs.next()) {
                //Se o cpf constar na base o email desse usuario sera retornado aqui
                email = rs.getString("email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return email;
    }


    /**
     * Este metodo consulta a existencia de um usuario na base de dados quando,
     * email e senha compoem o mesmo registro sendo isso um registro com todos
     * seus atributos presentes na base de dado e retornado ao contrario e
     * retornado um usuario nulo
     *
     * @param usuario Uma instancia de Usuario com email e senha vindos do login
     * @return Se email e senha pertecerem ao mesmo registro de Usuario uma
     * instancia de Usuario contendo id, nome, email, cpf e senha e retornado
     * caso contrario um usuario nulo e retornado.
     */
    public Cliente autentificaUsuarioDoSistema(Cliente cliente) {
        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from cliente where email = ? and senha = ?";
        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getEmail());
            stmt.setString(2, cliente.getSenha());
            rs = stmt.executeQuery();
            if (rs.next()) {
                cliente.setId_Cliente(rs.getInt("id_cliente"));
                cliente.setfirstNome(rs.getString("first_name"));
                cliente.setlastNome(rs.getString("last_name"));
                cliente.setEmail(rs.getString("email"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setSenha(rs.getString("senha"));
            } else {
                cliente = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAOLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cliente;
    }
}
