/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.controle;

import com.routeexpress.wrouteexpressprodutos.dao.ProdutoDAO;
import com.routeexpress.wrouteexpressprodutos.produto.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DANIEL Telles, Henrique Fogaça
 */
public class ServletCarrinho extends HttpServlet {

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
// Quando pressionado o botão "Ver Carrinho" é carregado 
        HttpSession sessao = request.getSession();
        String ip = request.getRemoteAddr();
        sessao.setAttribute("userip", ip);
        Produto produto = new Produto();
        ProdutoDAO pdao = new ProdutoDAO();
        List<Produto> carrinho = (List<Produto>) sessao.getAttribute("carrinho");
        if (carrinho == null) { // se for a primeira vez, cria um novo carrinho
            carrinho = new ArrayList<Produto>();
            sessao.setAttribute("carrinho", carrinho);
        }

        float total1 = 0; // Responsável pela conta do total do pedido
        for (Produto carrinho12 : carrinho) {
            total1 += carrinho12.getPrecoSubTotal();
            produto.setPrecoTotal(total1);

        }

        request.setAttribute("total1", total1);

        RequestDispatcher dispatcher = request.getRequestDispatcher("carrinhoProdutos.jsp");
        dispatcher.forward(request, response);
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

        HttpSession sessao = request.getSession();
        String ip = request.getRemoteAddr();
        sessao.setAttribute("userip", ip);
        Produto produto = new Produto();
        ProdutoDAO pdao = new ProdutoDAO();

        produto.setIdCerveja(Integer.parseInt(request.getParameter("id"))); // Pega o ID do produto selecionado na página detalhes ou carrinho(alterar)

        produto.setCervejaria(pdao.consultarProduto(produto).getCervejaria()); // seta os atributos manualmente
                                                                      // Os setados manualmente fica na ArrayLista
        produto.setRotulo(pdao.consultarProduto(produto).getRotulo());
        produto.setPreco(pdao.consultarProduto(produto).getPreco());
        produto.setImagem1(pdao.consultarProduto(produto).getImagem1());
        produto.setCor(pdao.consultarProduto(produto).getCor());
        produto.setIdCerveja(pdao.consultarProduto(produto).getIdCerveja());

        List<Produto> carrinho = (List<Produto>) sessao.getAttribute("carrinho");
        if (carrinho == null) { // se for a primeira vez, cria um novo carrinho
            carrinho = new ArrayList<Produto>();
            sessao.setAttribute("carrinho", carrinho);
        }

        String acao = request.getParameter("acao");

        if (acao.equals("adicionar")) { // reponsável por add o primeiro produto no carrinho
            int count = 0;
            for (Produto carrinho1 : carrinho) {
                if (carrinho1.getIdCerveja() == (produto.getIdCerveja())) { // caso encontre produto igual não duplica o produto.
                    System.out.println("Igual, nao adicionar!");               //, apenas acrescenta a quantidade do mesmo produto.
                    produto.setQuantidade(carrinho1.getQuantidade() + 1);
                    carrinho1.setQuantidade(produto.getQuantidade());

                    float price = Float.parseFloat(carrinho1.getPreco());
                    float total = 0;

                    total = price * produto.getQuantidade();
                    carrinho1.setPrecoSubTotal(total);
                    count++;
                }
            }
            if (count == 0) {// Caso o count fique igual a zero, significa que não existe produto igual no carrinho, podendo add o produto.
                produto.setQuantidade(count + 1);
                produto.setPrecoSubTotal(Float.parseFloat(produto.getPreco()));
                carrinho.add(produto);
            }

            float total1 = 0;
            for (Produto carrinho12 : carrinho) {
                total1 += carrinho12.getPrecoSubTotal();
                produto.setPrecoTotal(total1);

            }

            request.setAttribute("total1", total1);
            RequestDispatcher dispatcher = request.getRequestDispatcher("carrinhoProdutos.jsp");
            dispatcher.forward(request, response);
        }

        if (acao.equals("alterar")) {
            for (Produto carrinho1 : carrinho) {
                if (carrinho1.getIdCerveja() == (produto.getIdCerveja())) {
                    System.out.println("ID Cerveja Alterar Quantidade: " + produto.getIdCerveja());
                    int quant = Integer.parseInt(request.getParameter("quant"));//
                    produto.setQuantidade(quant);
                    System.out.println("Quantidade setada: " + produto.getQuantidade());

                    float price = Float.parseFloat(carrinho1.getPreco());
                    float total = 0;

                    total = price * produto.getQuantidade();

                    carrinho1.setQuantidade(produto.getQuantidade());
                    System.out.println("TOTALLL" + total);
                    carrinho1.setPrecoSubTotal(total);

                    float total1 = 0;
                    for (Produto carrinho12 : carrinho) {
                        total1 += carrinho12.getPrecoSubTotal();
                        produto.setPrecoTotal(total1);
                    }
                    request.setAttribute("total1", total1);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("carrinhoProdutos.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }

        if (acao.equals("apagar")) { // apaga uma cerveja especifica pelo id
            for (Produto carrinho1 : carrinho) {
                if (carrinho1.getIdCerveja() == (produto.getIdCerveja())) {
                    System.out.println("ID Cerveja apagar: " + produto.getIdCerveja());
                    carrinho.remove(carrinho1);
                    float total1 = 0;
                    for (Produto carrinho12 : carrinho) {
                        total1 += carrinho12.getPrecoSubTotal();
                        produto.setPrecoTotal(total1);
                    }
                    request.setAttribute("total1", total1);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("carrinhoProdutos.jsp");
                    dispatcher.forward(request, response);

                }
            }
        }

        if (acao.equals("ver")) { // carrega o carrinho

            float total1 = 0;
            for (Produto carrinho12 : carrinho) {
                total1 += carrinho12.getPrecoSubTotal();
                produto.setPrecoTotal(total1);
            }
            request.setAttribute("total1", total1);
            RequestDispatcher dispatcher = request.getRequestDispatcher("carrinhoProdutos.jsp");
            dispatcher.forward(request, response);

        }

    }
}
