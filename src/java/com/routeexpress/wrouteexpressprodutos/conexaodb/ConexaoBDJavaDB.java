package com.routeexpress.wrouteexpressprodutos.conexaodb;

/**
 * ******************************
 * Aula 02
 *
 * Objetivo desta classe: Especialização para conexão com JavaDB (ou Derby)
 *
 * Objetivo do exercício: Revisar conceitos de integração da aplicação Java com
 * banco de dados
 *
 * @author Fernando
 * @version 1.0
 * @since 19/02/2015 ******************************
 */
public class ConexaoBDJavaDB extends ConexaoBD {

    private static final String JDBC_DRIVER
            = "org.apache.derby.jdbc.ClientDataSource";

    private static final String CONN_STRING
            = "jdbc:derby://localhost:1527/";

    private String nomeBanco;

    public ConexaoBDJavaDB(String nomeBanco) {
        this.nomeBanco = nomeBanco;
    }

    @Override
    protected String getJDBCDriver() {
        return JDBC_DRIVER;
    }

    @Override
    protected String getBancoUrl() {
        return CONN_STRING + nomeBanco + ";SecurityMechanism=3";
    }

    @Override
    protected String[] getCredenciaisAcesso() {
        String[] credenciais = new String[2];
        credenciais[0] = "app"; // Nome do usuario do BD
        credenciais[1] = "app"; // Senha do BD
        return credenciais;
    }
}
