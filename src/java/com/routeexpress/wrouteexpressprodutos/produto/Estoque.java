package com.routeexpress.wrouteexpressprodutos.produto;

public class Estoque {

    private int id;
    private int idCerveja;
    private int quantidade;
    private double porcentagem;
    private int estoqueMinimo;
    private int estoqueMaximo;
    private double precoAquisicao;
    private double lucro;
    private int disponibilidade;

    public Estoque() {
        this.id = 0;
        this.idCerveja = 0;
        this.quantidade = 0;
        this.porcentagem = 0;
        this.estoqueMinimo = 0;
        this.estoqueMaximo = 0;
        this.precoAquisicao = 0;
        this.lucro = 0;
        this.disponibilidade = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCerveja() {
        return idCerveja;
    }

    public void setIdCerveja(int idCerveja) {
        this.idCerveja = idCerveja;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPorcentagem() {
        return porcentagem;
    }

    public void setPorcentagem(double porcentagem) {
        this.porcentagem = porcentagem;
    }

    public int getEstoqueMinimo() {
        return estoqueMinimo;
    }

    public void setEstoqueMinimo(int estoqueMinimo) {
        this.estoqueMinimo = estoqueMinimo;
    }

    public int getEstoqueMaximo() {
        return estoqueMaximo;
    }

    public void setEstoqueMaximo(int estoqueMaximo) {
        this.estoqueMaximo = estoqueMaximo;
    }

    public double getPrecoAquisicao() {
        return precoAquisicao;
    }

    public void setPrecoAquisicao(double precoAquisicao) {
        this.precoAquisicao = precoAquisicao;
    }

    public double getLucro() {
        return lucro;
    }

    public void setLucro(double lucro) {
        this.lucro = lucro;
    }

    public int getDisponibilidade() {
        return disponibilidade;
    }

    public void setDisponibilidade(int disponibilidade) {
        this.disponibilidade = disponibilidade;
    }

    @Override
    public String toString() {
        return "Alteracao Estoque {" + "quantidade=" + quantidade + ", porcentagem=" + porcentagem + ", estoqueMinimo=" + estoqueMinimo + ", estoqueMaximo=" + estoqueMaximo + ", precoAquisicao=" + precoAquisicao + ", lucro=" + lucro + ", disponibilidade=" + disponibilidade + '}';
    }

}
