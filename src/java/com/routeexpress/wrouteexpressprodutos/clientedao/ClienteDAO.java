package com.routeexpress.wrouteexpressprodutos.clientedao;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import com.routeexpress.wrouteexpressprodutos.conexaodb.ConexaoBDJavaDB;
import static com.routeexpress.wrouteexpressprodutos.ferramentas.SHA1.gerarHashSenhaPBKDF2;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DANIEL Telles
 */
public class ClienteDAO {

    /**
     * CadastrarCliente recebe uma instância de cliente ja com seus devidos
     * valores setados e salva esse cliente como registro na tabela cliente do
     * banco.
     *
     * @param cliente
     */
    public Boolean cadastrarCliente(Cliente cliente) throws NoSuchAlgorithmException, InvalidKeySpecException {

        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "insert into cliente (first_name, last_name, email, telefone, cpf, senha, sexo, data_nasci_cliente) values (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getfirstNome());
            stmt.setString(2, cliente.getlastNome());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getTelefone());
            stmt.setString(5, cliente.getCpf());
            stmt.setString(6, String.copyValueOf(gerarHashSenhaPBKDF2(cliente.getSenha())));
            stmt.setString(7, cliente.getSexo());
            stmt.setDate(8, new java.sql.Date(cliente.getDataNascimento().getTime()));

            stmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
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
        return true;
    }

    /**
     * consultarCliente quando executado o método, o mesmo retorna em uma
     * ArrayList todos os clientes cadastrados no banco de dados, incluindo
     * todas as informaçoes
     *
     * @param
     *
     */
    public ArrayList<Cliente> consultarCliente() {
        ConexaoBDJavaDB conexaoBD = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Cliente> clientes = new ArrayList<>();
        Cliente cliente;
        String sql = "SELECT ID_CLIENTE, FIRST_NAME, LAST_NAME, EMAIL, \n"
                + "TELEFONE, CPF, SENHA, SEXO, DATA_NASCI_CLIENTE FROM CLIENTE";
        try {
            conn = conexaoBD.obterConexao();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setfirstNome(rs.getString("FIRST_NAME"));
                cliente.setlastNome(rs.getString("LAST_NAME"));
                cliente.setCpf(rs.getString("CPF"));
                clientes.add(cliente);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return clientes;
    }

    /**
     * consultarClienteEdit quando executado o método, o mesmo retorna em uma
     * ArrayList de um cliente especifico, ou seja, é seleiconado apenas o
     * cliente pelo CPF e retorna todas as informações do mesmo.
     *
     * @param cpf
     *
     *
     * @return
     */
    public Cliente consultarClienteEdit(String cpf) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Cliente client = null;

        String sql = "SELECT ID_CLIENTE, FIRST_NAME, LAST_NAME, EMAIL, \n"
                + "TELEFONE, CPF, SENHA, SEXO, DATA_NASCI_CLIENTE FROM CLIENTE WHERE CPF = '" + cpf + "'";

        try {
            ConexaoBDJavaDB conexaoBD = new ConexaoBDJavaDB("routeexpress");
            conn = conexaoBD.obterConexao();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                client = new Cliente();
                client.setId_Cliente(rs.getInt("id_cliente"));
                client.setfirstNome(rs.getString("FIRST_NAME"));
                client.setlastNome(rs.getString("LAST_NAME"));
                client.setEmail(rs.getString("EMAIL"));
                client.setTelefone(rs.getString("TELEFONE"));
                client.setCpf(rs.getString("CPF"));
                client.setSexo(rs.getString("SEXO"));
                client.setDataNascimento(rs.getDate("DATA_NASCI_CLIENTE"));
                System.out.println(client.getfirstNome());
            } else {
                return client;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return client;
    }

    /**
     * alterarCliente quando executado o método, o mesmo altera qualquer
     * informação pessoal do cliente. O método possui dois parâmetros, tendo o
     * primeiro como o CPF(busca o cliente desejado no banco de dados) e
     * cliente(passando todas as informações para a edição.
     *
     * @param cpf, cliente
     * @param cliente
     *
     */
    public void alterarCliente(String cpf, Cliente cliente) {

        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "UPDATE CLIENTE SET FIRST_NAME = ?, LAST_NAME = ?, EMAIL = ?, TELEFONE = ?, CPF = ?, SEXO = ?  WHERE CPF = '" + cpf + "'";

        try {
            conn = conexaoDB.obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getfirstNome());
            stmt.setString(2, cliente.getlastNome());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getTelefone());
            stmt.setString(5, cliente.getCpf());
            stmt.setString(6, cliente.getSexo());
            stmt.executeUpdate();

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

    public void apagarCliente(String cpf) {

        ConexaoBDJavaDB conexaoDB = new ConexaoBDJavaDB("routeexpress");
        Connection conn = null;
        Statement stmt = null;
        String sql = "DELETE FROM CLIENTE  WHERE CPF = '" + cpf + "'";

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

    /**
     * stringParaDate recebe com parametro uma String com uma data e a formata
     * para Date.
     *
     * @param data
     * @return
     */
    public Date stringParaDate(String data) {
        Date dt;
        DateFormat formatadorData = new SimpleDateFormat("dd-MM-yyyy");
        try {
            dt = formatadorData.parse(data);
        } catch (ParseException ex) {
            dt = new Date();
        }
        return dt;
    }
}
