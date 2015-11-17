package com.routeexpress.wrouteexpressprodutos.produto;

import java.io.Serializable;

/**
 *
 * @author DANIEL Telles, Henrique Fogaça
 */
public class Produto implements Serializable{
   
    private int idCervejaria;
    private String cervejaria;
    private String pais;
    private int idCerveja;
    private int idFkCervajaria;
     private int quantidade;
    private String rotulo;
    private String preco;
    private String volume;
    private String teor;
    private String cor;
    private String temperatura;
    private String familiaEEstilo;
    private String descricao;
    private String sabor;
    private String imagem1;
    private String imagem2;
    private String imagem3;
      private float precoSubTotal;
     private float precoTotal;

    public Produto(){
        
    }

    public int getIdCervejaria() {
        return idCervejaria;
    }

    public void setIdCervejaria(int idCervejaria) {
        this.idCervejaria = idCervejaria;
    }

    public String getCervejaria() {
        return cervejaria;
    }

    public void setCervejaria(String cervejaria) {
        this.cervejaria = cervejaria;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getIdCerveja() {
        return idCerveja;
    }

    public void setIdCerveja(int idCerveja) {
        this.idCerveja = idCerveja;
    }

    public int getIdFkCervajaria() {
        return idFkCervajaria;
    }

    public void setIdFkCervajaria(int idFkCervajaria) {
        this.idFkCervajaria = idFkCervajaria;
    }

    public String getRotulo() {
        return rotulo;
    }

    public void setRotulo(String rotulo) {
        this.rotulo = rotulo;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getTeor() {
        return teor;
    }

    public void setTeor(String teor) {
        this.teor = teor;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(String temperatura) {
        this.temperatura = temperatura;
    }

    public String getFamiliaEEstilo() {
        return familiaEEstilo;
    }

    public void setFamiliaEEstilo(String familiaEEstilo) {
        this.familiaEEstilo = familiaEEstilo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getSabor() {
        return sabor;
    }

    public void setSabor(String sabor) {
        this.sabor = sabor;
    }

    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public String getImagem3() {
        return imagem3;
    }

    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }

    @Override
    public String toString() {
        return "Produto{" + "idCervejaria=" + idCervejaria + ", cervejaria=" + cervejaria + ", pais=" + pais + ", idCerveja=" + idCerveja + ", idFkCervajaria=" + idFkCervajaria + ", rotulo=" + rotulo + ", preco=" + preco + ", volume=" + volume + ", teor=" + teor + ", cor=" + cor + ", temperatura=" + temperatura + ", familiaEEstilo=" + familiaEEstilo + ", descricao=" + descricao + ", sabor=" + sabor + ", imagem1=" + imagem1 + ", imagem2=" + imagem2 + ", imagem3=" + imagem3 + '}';
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public float getPrecoSubTotal() {
        return precoSubTotal;
    }

    public void setPrecoSubTotal(float precoSubTotal) {
        this.precoSubTotal = precoSubTotal;
    }

    public float getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(float precoTotal) {
        this.precoTotal = precoTotal;
    }
    
    
}
