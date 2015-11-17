package com.routeexpress.wrouteexpressprodutos.produto;


public class ListaDeDesejo {
    private Integer idItem;
    private Integer idCliente;
    private Integer idCerveja;
    
    public ListaDeDesejo(){
        this.idItem = 0;
        this.idCliente = 0;
        this.idCerveja = 0;
    }

    public Integer getIdItem() {
        return idItem;
    }

    public void setIdItem(Integer idItem) {
        this.idItem = idItem;
    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public Integer getIdCerveja() {
        return idCerveja;
    }

    public void setIdCerveja(Integer idCerveja) {
        this.idCerveja = idCerveja;
    }
    
    
}
