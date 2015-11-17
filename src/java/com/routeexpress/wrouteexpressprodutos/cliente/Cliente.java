package com.routeexpress.wrouteexpressprodutos.cliente;

import java.util.Date;

/**
 *
 * @author DANIEL Telles
 */
public class Cliente {

    private int id_cliente;
    private String first_Name;
    private String last_name;
    private String email;
    private String telefone;
    private String cpf;
    private String senha;
    private String sexo;
    private Date data_nascimento;

    public int getId_Cliente() {
        return id_cliente;
    }

    public void setId_Cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getfirstNome() {
        return first_Name;
    }

    public void setfirstNome(String first_Name) {
        this.first_Name = first_Name;
    }

    public String getlastNome() {
        return last_name;
    }

    public void setlastNome(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getDataNascimento() {
        return data_nascimento;
    }

    public void setDataNascimento(Date data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

}

