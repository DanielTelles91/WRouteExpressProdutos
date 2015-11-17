package com.routeexpress.wrouteexpressprodutos.controle;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import com.routeexpress.wrouteexpressprodutos.clientedao.ClienteDAO;
import com.routeexpress.wrouteexpressprodutos.dao.ListaDeDesejoDAO;
import com.routeexpress.wrouteexpressprodutos.dao.ProdutoDAO;
import com.routeexpress.wrouteexpressprodutos.produto.ListaDeDesejo;
import com.routeexpress.wrouteexpressprodutos.produto.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletListaDeDesejos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String acao = request.getParameter("acao");
        
        if (acao.equals("mostralista")) {
            ListaDeDesejoDAO listaDeDesejoDAO = new ListaDeDesejoDAO();
            ListaDeDesejo listaDeDesejo = new ListaDeDesejo();
            listaDeDesejo.setIdCliente(Integer.valueOf(request.getParameter("idcliente")));
            Produto produto;
            List<Produto> lista = new ArrayList<>();
            for(ListaDeDesejo item : listaDeDesejoDAO.listarItensDeDesejoDoCliente(listaDeDesejo)){
            produto = new Produto();         
            produto.setIdCerveja(item.getIdCerveja());
                ProdutoDAO produtoDAO = new ProdutoDAO();
                Produto produtoRetorno = produtoDAO.consultarProduto(produto);
                
                if(produtoRetorno != null){
                    
                    lista.add(produtoRetorno);
                    
                }
            }           
            request.setAttribute("Lista", lista);
            request.getRequestDispatcher("listadedesejos.jsp").forward(request, response);
        }
        if(acao.equals("remover")){
            ListaDeDesejo listaDeDesejo = new ListaDeDesejo();
            String cpfCliente = request.getParameter("cpfcliente");
            int cerveja = Integer.valueOf(request.getParameter("idcerveja"));
            ClienteDAO clienteDAO = new ClienteDAO();
            Cliente cliente = clienteDAO.consultarClienteEdit(cpfCliente);
            listaDeDesejo.setIdCliente(cliente.getId_Cliente());
            listaDeDesejo.setIdCerveja(cerveja);
            ListaDeDesejoDAO listaDeDesejoDAO = new ListaDeDesejoDAO();
            listaDeDesejoDAO.removerItemDaListaDeDesejo(listaDeDesejo);
            response.sendRedirect("ServletListaDeDesejos?acao=mostralista&idcliente=" + String.valueOf(cliente.getId_Cliente()));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String cpfCliente = request.getParameter("cpfCliente");
        int cerveja = Integer.valueOf(request.getParameter("idcerveja"));
        if (cpfCliente.equals("")) {
            response.sendRedirect("loginusuario.html");
        } else {
            ClienteDAO clienteDAO = new ClienteDAO();
            Cliente cliente = clienteDAO.consultarClienteEdit(cpfCliente);
            ListaDeDesejo listaDeDesejo = new ListaDeDesejo();
            listaDeDesejo.setIdCliente(cliente.getId_Cliente());
            listaDeDesejo.setIdCerveja(cerveja);
            ListaDeDesejoDAO listaDeDesejoDAO = new ListaDeDesejoDAO();
            ListaDeDesejo itemRetorno = listaDeDesejoDAO.consultaExistenciaDeUmItemNaListaDeDesejo(listaDeDesejo);
            if (itemRetorno == null) {
                listaDeDesejoDAO.cadastrarItemNaListaDeDesejo(listaDeDesejo);
                response.sendRedirect("ServletListaDeDesejos?acao=mostralista&idcliente=" + String.valueOf(cliente.getId_Cliente()));
            } else {
                response.sendRedirect("ServletListaDeDesejos?acao=mostralista&idcliente=" + String.valueOf(cliente.getId_Cliente()));
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
