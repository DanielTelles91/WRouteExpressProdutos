/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.controle;

import com.routeexpress.wrouteexpressprodutos.dao.EstoqueDAO;
import com.routeexpress.wrouteexpressprodutos.enderecoDAO.EnderecoDAO;
import com.routeexpress.wrouteexpressprodutos.produto.Estoque;
import com.routeexpress.wrouteexpressprodutos.produto.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DANIEL
 */
public class ServletFecharCompra extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        HttpSession session = request.getSession();
        String acao = request.getParameter("acao");
        String cpff = (String) session.getAttribute("cpff"); // pega o cpf do cliente que está logado na sessão
        System.out.println("Teste cpf:" + cpff);

        if (acao.equals("finalizar")) {
            if (cpff == null) { // caso seja selecionado a opção detalhes cliente sem estar logado, o mesmo será redirecioando para fazer login
                request.getRequestDispatcher("loginusuario.html").forward(request, response);
            } else {
                List<Produto> carrinho = (List<Produto>) session.getAttribute("carrinho");
                if (carrinho.size() == 0) {
                    response.sendRedirect("carrinhoProdutos.jsp");
                } else {
                    EstoqueDAO estoqueDAO = new EstoqueDAO();
                    //Objeto usado para mencionar o valor total da compra
                    Produto produto = new Produto();
                    //Nova lista de produtos formada conforme a disponibilidade de quantidade do item em estoque
                    List<Produto> fecharCompra = new ArrayList<>();
                    //Objeto estoque responsavel por fazer mencao do estoque do item corrente 
                    Estoque estoque;
            //Valor Total da compra
                    //Percorrendo o carrinho
                    float totalAPagar = 0f;
                    for (Produto itens : carrinho) {
                        //Um novo objeto de estoque e criado
                        estoque = new Estoque();
                        //Atributo idCerveja de estoque recebe o valor de identificacao de cerveja do item corrente
                        estoque.setIdCerveja(itens.getIdCerveja());
                        //Consulta a existencia de estoque
                        estoque = estoqueDAO.consultaExistenciaDeEstoque(estoque);
                //Se a quantidade do item for maior do que tem em estoque e a quantidade em estoque for 
                        //maior que zero
                        if (itens.getQuantidade() > estoque.getQuantidade() && estoque.getQuantidade() > 0) {
                            //O item passa a ter a sua quantidade menos o que tem em estoque
                            itens.setQuantidade(estoque.getQuantidade());
                            float subTotal = 0f;
                            subTotal = itens.getQuantidade() * Float.valueOf(itens.getPreco());
                            itens.setPrecoSubTotal(subTotal);
                            //Estoque tem a sua quantidade zerada
                            estoque.setQuantidade(0);
                            //E o estoque e alterado
                            estoqueDAO.alterarEstoque(estoque);
                            //E um novo item a adicionado a lista que fechara a compra
                            fecharCompra.add(itens);
                            continue;
                        }
                        //Se a quantidade do item vindo do carrinho for menor ou igual a quantidade do estoque
                        if (itens.getQuantidade() <= estoque.getQuantidade()) {
                            //O estoque tem a quantidade alterada para a sua quantidade menos a quantidade do item
                            estoque.setQuantidade(estoque.getQuantidade() - itens.getQuantidade());
                            //O estoque e alterado
                            estoqueDAO.alterarEstoque(estoque);
                            //E um novo item a adicionado a lista que fechara a compra
                            fecharCompra.add(itens);
                            continue;
                        }
                    }
                    for (Produto itens : fecharCompra) {
                        totalAPagar += itens.getQuantidade() * Float.valueOf(itens.getPreco());
                    }
                    produto.setPrecoTotal(totalAPagar);
                    EnderecoDAO enderecoDAO = new EnderecoDAO();
                    session.setAttribute("totalAPagar", produto);
                    session.setAttribute("fecharCompra", fecharCompra);
                    session.setAttribute("endereco", enderecoDAO.consultarEnderecoEdit(cpff).get(0));
                    response.sendRedirect("fecharcompra.jsp");
                }
            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
