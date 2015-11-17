/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.endereco;

/**
 *
 * @author DANIEL Telles
 */
public class Endereco {

    private int id_Enderecos;
    private String cep;
    private String tipo_logradouro;
    private String logradouro;
    private String logradouro_numero;
    private String bairro;
    private String cidade;
    private String estado;

    public int getId_Enderecos() {
        return id_Enderecos;
    }

    public void setId_Cliente(int id_Enderecos) {
        this.id_Enderecos = id_Enderecos;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getTipoLogradouro() {
        return tipo_logradouro;
    }

    public void setTipoLogradouro(String tipo_logradouro) {
        this.tipo_logradouro = tipo_logradouro;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getLogradouroNumero() {
        return logradouro_numero;
    }

    public void setLogradouroNumero(String logradouro_numero) {
        this.logradouro_numero = logradouro_numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
