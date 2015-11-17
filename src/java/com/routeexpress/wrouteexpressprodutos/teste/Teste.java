package com.routeexpress.wrouteexpressprodutos.teste;

import com.routeexpress.wrouteexpressprodutos.dao.ListaDeDesejoDAO;
import com.routeexpress.wrouteexpressprodutos.produto.ListaDeDesejo;

public class Teste {

    public static void main(String[] args) {
        ListaDeDesejoDAO listaDeDesejoDAO = new ListaDeDesejoDAO();
        ListaDeDesejo listaDeDesejo = new ListaDeDesejo();
        listaDeDesejo.setIdCliente(1);
        listaDeDesejo.setIdCerveja(5);
        
        System.out.println(listaDeDesejoDAO.listarItensDeDesejoDoCliente(listaDeDesejo).size());
    }

}
