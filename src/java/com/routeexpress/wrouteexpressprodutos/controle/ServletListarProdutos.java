package com.routeexpress.wrouteexpressprodutos.controle;

import com.routeexpress.wrouteexpressprodutos.dao.ProdutoDAO;
import com.routeexpress.wrouteexpressprodutos.produto.Estoque;
import com.routeexpress.wrouteexpressprodutos.produto.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DANIEL Telles, Henrique Fogaça
 */
public class ServletListarProdutos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet respon se
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        

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

        //Acao parametro vindo da requesicao responsavel por chamar as acoes logo abaixo
        String acao = request.getParameter("acao");
        //Instancia de Data Acess Object de produto

        ProdutoDAO produtoDAO = new ProdutoDAO();

        //Se a acao for igual a listar
        if (acao.equals("listar")) {

            //consultarProdutos(0, "") zero(0) utiliza do comando sql que recupera
            //uma lista de produto e o valor nulo representa que nao ha nenhuma
            //clausula where no comando
            List<Produto> cervejas = produtoDAO.consultarProdutos(0, "");
            //A seguir e criado uma lista de todas as cervejarias presentes na lista de produtos
            List<String> cervejarias = new ArrayList<>();
            //A seguir e criado uma lista de todos os paises presentes na lista de produtos
            List<String> paises = new ArrayList<>();
            //A seguir e criado uma lista de todos os volumes presentes na lista de produtos
            List<String> volume = new ArrayList<>();
            for (int i = 0; i < cervejas.size(); i++) {
                //Preenchimento da lista de cervejarias com a condicao e que seja
                //preenchida com todas cervejarias presente na lista de produtos
                cervejarias.add(cervejas.get(i).getCervejaria());
                //Preenchimento da lista de pais com a condicao e que seja
                //preenchida com todos os paises presente na lista de produtos
                paises.add(cervejas.get(i).getPais());
                //Preenchimento da lista de volume com a condicao e que seja
                //preenchida com todos os volumes presente na lista de produtos
                volume.add(cervejas.get(i).getVolume());
            }
            //A segui a lista de cervejarias e atribuida a uma lista do tipo Set
            //onde nao e permitido a duplicata de valores
            Set<String> listaCervejarias = new HashSet<>(cervejarias);
            //A segui a lista de paises e atribuida a uma lista do tipo Set
            //onde nao e permitido a duplicata de valores
            Set<String> listaPaises = new HashSet<>(paises);
            //A segui a lista de volumes e atribuida a uma lista do tipo Set
            //onde nao e permitido a duplicata de valores
            Set<String> listaVolume = new HashSet<>(volume);
            //A lista de todos os produtos e mandada para listarprodutos.jsp
            request.setAttribute("cervejas", cervejas);
            //Assim como a lista de todas as cervejarias responsavel por criar links
            //para que o usuario possa acessar a pagina cujo o valor e correspondente
            //a um valor presente na lista
            request.setAttribute("cervejarias", listaCervejarias);
            //Assim como a lista de todos os paises responsavel por criar links
            //para que o usuario possa acessar a pagina cujo o valor e correspondente
            //a um valor presente na lista
            request.setAttribute("paises", listaPaises);
            //Assim como a lista de todos os volumes responsavel por criar links
            //para que o usuario possa acessar a pagina cujo o valor e correspondente
            //a um valor presente na lista
            request.setAttribute("volume", listaVolume);
            request.getRequestDispatcher("listarprodutos.jsp").forward(request, response);
        }
        if (acao.equals("detalhar")) {
            Produto produto = new Produto();
            Estoque estoque = new Estoque();
            //Recebe do parametro da requesicao um atributo de identificacao do produto
            //para que o mesmo possa ser recuperado de forma unica e exibida na pagina de
            //descricao do produto
            produto.setIdCerveja(Integer.parseInt(request.getParameter("id")));
            estoque.setIdCerveja(Integer.parseInt(request.getParameter("id")));
            //Uma instancia de produto e iniciada e preenchida com seus devidos valores
            //para que esse produto possa ser enviado com pamaretro da requesicao
            request.setAttribute("cerveja", produtoDAO.consultarProduto(produto));
            request.setAttribute("disponibilidade", produtoDAO.consultaExistenciaDeEstoque(estoque));
            request.getRequestDispatcher("detalheproduto.jsp").forward(request, response);
        }
        if (acao.equals("cervejaria")) {
            //consultarProdutos(1, request.getParameter("cervejaria")) um(1) utiliza do comando sql que recupera
            //uma lista de produto a partir da cervejaria dele e o valor request.getParameter("cervejaria")
            //e usado na clausula where do comando para recupera uma lista de produtos a parti de determinada cervejaria
            List<Produto> cervejas = produtoDAO.consultarProdutos(1, request.getParameter("cervejaria"));
            request.setAttribute("cervejas", cervejas);
            request.getRequestDispatcher("sublistaprodutos.jsp").forward(request, response);
        }
        if (acao.equals("pais")) {
            //consultarProdutos(2, request.getParameter("pais")) dois(2) utiliza do comando sql que recupera
            //uma lista de produto a partir do pais dele e o valor request.getParameter("pais")
            //e usado na clausula where do comando para recupera uma lista de produtos a parti de determinado pais
            List<Produto> cervejas = produtoDAO.consultarProdutos(2, request.getParameter("pais"));
            request.setAttribute("cervejas", cervejas);
            request.getRequestDispatcher("sublistaprodutos.jsp").forward(request, response);
        }
        //Quando a acao da requesicao e igual a 'preco'
        if (acao.equals("preco")) {
            //Uma lista de produtos e recuperada
            List<Produto> cervejas = produtoDAO.consultarProdutos(0, "");
            //Uma nova lista de produtos e declarada
            List<Produto> cervejasOrdenadaPorPreco = null;
            if (1 == Integer.valueOf(request.getParameter("preco"))) {
                //Nova lista de produtos e inicializada
                cervejasOrdenadaPorPreco = new ArrayList<>();
                //A lista que contem todas as cervejas e percorrida
                for (Produto produto : cervejas) {
                    //Se o preco do produto for menor que 15 esse produto 
                    //e adicionado a nova lista de produtos classificado por preco
                    if (Double.valueOf(produto.getPreco()) < 15) {
                        //Produto adicionado
                        cervejasOrdenadaPorPreco.add(produto);
                    }
                }
            }
            if (2 == Integer.valueOf(request.getParameter("preco"))) {
                cervejasOrdenadaPorPreco = new ArrayList<>();
                for (Produto produto : cervejas) {
                    //Se o preco do produto for maior igual a 15 e menor que 30 esse produto 
                    //e adicionado a nova lista de produtos classificado por preco
                    if (Double.valueOf(produto.getPreco()) >= 15 && Double.valueOf(produto.getPreco()) < 30) {
                        //Produto adicionado
                        cervejasOrdenadaPorPreco.add(produto);
                    }
                }
            }
            if (3 == Integer.valueOf(request.getParameter("preco"))) {
                cervejasOrdenadaPorPreco = new ArrayList<>();
                for (Produto produto : cervejas) {
                    //Se o preco do produto for maior igual a 30 e menor que 50 esse produto 
                    //e adicionado a nova lista de produtos classificado por preco
                    if (Double.valueOf(produto.getPreco()) >= 30 && Double.valueOf(produto.getPreco()) < 50) {
                        //Produto adicionado
                        cervejasOrdenadaPorPreco.add(produto);
                    }
                }
            }
            if (4 == Integer.valueOf(request.getParameter("preco"))) {
                cervejasOrdenadaPorPreco = new ArrayList<>();
                for (Produto produto : cervejas) {
                    //Se o preco do produto for maior igual a 50 e menor que 100 esse produto 
                    //e adicionado a nova lista de produtos classificado por preco
                    if (Double.valueOf(produto.getPreco()) >= 50 && Double.valueOf(produto.getPreco()) < 100) {
                        //Produto adicionado
                        cervejasOrdenadaPorPreco.add(produto);
                    }
                }
            }
            if (5 == Integer.valueOf(request.getParameter("preco"))) {
                cervejasOrdenadaPorPreco = new ArrayList<>();
                for (Produto produto : cervejas) {
                    //Se o preco do produto for maior que 100 esse produto 
                    //e adicionado a nova lista de produtos classificado por preco
                    if (Double.valueOf(produto.getPreco()) >= 100) {
                        //Produto adicionado
                        cervejasOrdenadaPorPreco.add(produto);
                    }
                }
            }
            if (6 == Integer.valueOf(request.getParameter("preco"))) {
                cervejasOrdenadaPorPreco = new ArrayList<>();
                for (Produto produto : cervejas) {
                    //Se o preco do produto for maior que 100 esse produto 
                    //e adicionado a nova lista de produtos classificado por preco
                    if (Double.valueOf(produto.getPreco()) >= Double.valueOf(request.getParameter("precominimo")) && Double.valueOf(produto.getPreco()) <= Double.valueOf(request.getParameter("precomaximo"))) {
                        //Produto adicionado
                        cervejasOrdenadaPorPreco.add(produto);
                    }
                }
            }
            request.setAttribute("cervejas", cervejasOrdenadaPorPreco);
            request.getRequestDispatcher("sublistaprodutos.jsp").forward(request, response);
        }
        if (acao.equals("volume")) {
            //consultarProdutos(4, request.getParameter("volume")) quatro(4) utiliza do comando sql que recupera
            //uma lista de produto a partir do volume dele e o valor request.getParameter("volume")
            //e usado na clausula where do comando para recupera uma lista de produtos a parti de determinado volume
            List<Produto> cervejas = produtoDAO.consultarProdutos(3, request.getParameter("volume"));
            request.setAttribute("cervejas", cervejas);
            request.getRequestDispatcher("sublistaprodutos.jsp").forward(request, response);
        }
        //Se acao for pesquisar
        if (acao.equals("pesquisar")) {
            //A palavra chave e recuperada atraves do parametro pesquisa vindo da requesicao
            //e seus caracteres sao passados para letra minuscula
            String palavraChave = request.getParameter("pesquisa").toLowerCase();
            //Uma lista com todas as cervejas e recuperada
            List<Produto> cervejas = produtoDAO.consultarProdutos(0, "");
            //E uma nova lista e criada para receber todos os itens correspondentes a pesquisa
            List<Produto> pesquisa = new ArrayList<>();
            //Lista Set e declarada como nula
            Set<Produto> resultadoPesquisa = null;
            //Todos os produtos da lista de cervejas sao percorridos
            for (Produto produto : cervejas) {
                //A cervejaria pertencente ao produto tem seus caracteres passados
                //para minusculo e se a palavra chave compor a cervejaria a mesma
                //e adicionada a lista de pesquisa
                if (produto.getCervejaria().toLowerCase().indexOf(palavraChave) >= 0) {
                    pesquisa.add(produto);
                }
                //A cerveja pertencente ao produto tem seus caracteres passados
                //para minusculo e se a palavra chave compor a cerveja a mesma
                //e adicionada a lista de pesquisa
                if (produto.getRotulo().toLowerCase().indexOf(palavraChave) >= 0) {
                    pesquisa.add(produto);
                }
            }
            //Se a lista de pesquisa nao estiver vazia
            if (!pesquisa.isEmpty()) {
                //A lista set que nao permite valores duplificados e inicializada
                //com seu construtor recebendo como parametro a lista de pesquisa
                resultadoPesquisa = new HashSet<>(pesquisa);
            }
            request.setAttribute("cervejas", resultadoPesquisa);
            request.getRequestDispatcher("sublistaprodutos.jsp").forward(request, response);
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
