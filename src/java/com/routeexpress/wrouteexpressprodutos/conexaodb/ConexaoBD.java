/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.conexaodb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * ******************************
 * Aula 02
 *
 * Objetivo desta classe: Classe abstrata com funções para conexão com banco de
 * dados. Deve ser especializada conforme o banco de dados a ser usado.
 *
 * Objetivo do exercício: Revisar conceitos de integração da aplicação Java com
 * banco de dados
 *
 * @author Fernando
 * @version 1.0
 * @since 19/02/2015 ******************************
 */
public abstract class ConexaoBD {

    /**
     * Método que retorna o nome do Driver a ser usado na conexão
     *
     * @return driver a ser usada na conexão
     */
    protected abstract String getJDBCDriver();

    /**
     * Obtém a URL de conexão com banco de dados
     *
     * @return URL de conexão com banco de dados
     */
    protected abstract String getBancoUrl();

    /**
     * Obtém as credenciais de acesso ao banco de dados
     *
     * @return usuário no índice 0 e senha no índice 1
     */
    protected abstract String[] getCredenciaisAcesso();

    /**
     * Método usado para obter uma conexão com o banco de dados, considerando
     * que o fluxo é igual independentemente do SGBD usado.
     *
     * @return Objeto de conexão
     * @throws SQLException Erro ao conectar com banco de dados
     * @throws ClassNotFoundException Erro ao obter a classe do driver
     */
    public Connection obterConexao() throws SQLException,
            ClassNotFoundException {
        Connection conn = null;
        // Passo 1: Registrar driver JDBC.
        Class.forName(getJDBCDriver());

        // Passo 2: Abrir a conexão
        System.out.println("Connecting to database...");
        String[] credenciais = getCredenciaisAcesso();
        if (credenciais.length == 2) {
            conn = DriverManager.getConnection(getBancoUrl(),
                    credenciais[0], credenciais[1]);
        }
        return conn;
    }
}
