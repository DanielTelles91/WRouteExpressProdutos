/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.routeexpress.wrouteexpressprodutos.controle;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import com.routeexpress.wrouteexpressprodutos.clientedao.ClienteDAO;
import com.routeexpress.wrouteexpressprodutos.endereco.Endereco;
import com.routeexpress.wrouteexpressprodutos.enderecoDAO.EnderecoDAO;
import com.routeexpress.wrouteexpressprodutos.ferramentas.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DANIEL Telles
 */
public class ServletCliente extends HttpServlet {

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

        if (acao.equals("detalhar")) { // detalha um produto especifico
            ClienteDAO cd = new ClienteDAO();
            EnderecoDAO ed = new EnderecoDAO();
            //  String cpf = request.getParameter("cpf");
            if (cpff == null) { // caso seja selecionado a opção detalhes cliente sem estar logado, o mesmo será redirecioando para fazer login
                request.getRequestDispatcher("loginusuario.html").forward(request, response);
            }
            ArrayList<Endereco> enderecos = ed.consultarEnderecoEdit(cpff);
            System.out.println("editarcliente cpf:" + cpff);
            request.setAttribute("clientes", cd.consultarClienteEdit(cpff));
            request.setAttribute("enderecos", enderecos);
            request.getRequestDispatcher("detailsCliente.jsp").forward(request, response);
        }

        if (acao.equals("editar")) { // exibi a tela de edição com todos os campos preenchidos
            ClienteDAO cd = new ClienteDAO();
            EnderecoDAO ed = new EnderecoDAO();

            ArrayList<Endereco> enderecos = ed.consultarEnderecoEdit(cpff);
            System.out.println("editarcliente cpf:" + cpff);
            request.setAttribute("clientes", cd.consultarClienteEdit(cpff));
            request.setAttribute("enderecos", enderecos);
            request.getRequestDispatcher("editarCliente.jsp").forward(request, response);
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
        String acao2 = request.getParameter("acao");

        if (acao2.equals("editar")) { // salva os dados editados

            Cliente cl = new Cliente();
            ClienteDAO cd = new ClienteDAO();
            cl.setfirstNome(request.getParameter("enome"));//
            cl.setlastNome(request.getParameter("esobrenome"));//
            cl.setEmail(request.getParameter("eemail"));//
            cl.setTelefone(request.getParameter("etelefone"));//
            cl.setCpf(request.getParameter("ecpf"));//
            cl.setSexo(request.getParameter("esexo"));//
            cd.alterarCliente(cl.getCpf(), cl);

            Endereco ed = new Endereco();
            EnderecoDAO edd = new EnderecoDAO();
            ed.setCep(request.getParameter("ecep"));//
            ed.setTipoLogradouro(request.getParameter("etipologradouro"));//
            ed.setLogradouro(request.getParameter("elogradouro"));//
            ed.setLogradouroNumero(request.getParameter("enumerologradouro"));//
            ed.setBairro(request.getParameter("ebairro"));//
            ed.setCidade(request.getParameter("ecidade"));//
            ed.setEstado(request.getParameter("eestado"));//
            edd.alterarEndereco(cl.getCpf(), ed);

            response.sendRedirect("ServletCliente?acao=detalhar");
            // RequestDispatcher rd = request.getRequestDispatcher("ServletListarProdutos?acao=listar");
            //  rd.forward(request, response);

        }

        if (acao2.equals("cadastro")) { // salva os dados editados

            ClienteDAO cd = new ClienteDAO();
            Cliente cl = new Cliente();
            EnderecoDAO ed = new EnderecoDAO();
            Endereco endereco = new Endereco();
            SendEmail sd = new SendEmail();
            cl.setfirstNome(request.getParameter("fnome"));//
            cl.setlastNome(request.getParameter("lnome"));//
            cl.setEmail(request.getParameter("email"));//
            cl.setTelefone(request.getParameter("telefone"));//
            cl.setCpf(request.getParameter("cpf"));//
            cl.setSenha(request.getParameter("senha"));//
            cl.setSexo(request.getParameter("sexo"));//
            Date dataDeNascimento = cd.stringParaDate(request.getParameter("dataNasc"));//
            cl.setDataNascimento(dataDeNascimento);

            endereco.setCep(request.getParameter("cep"));
            endereco.setCidade(request.getParameter("cidade"));
            endereco.setEstado(request.getParameter("estado"));
            endereco.setTipoLogradouro(request.getParameter("tipo_logradouro"));
            endereco.setLogradouro(request.getParameter("logradouro"));
            endereco.setLogradouroNumero(request.getParameter("numero"));
            endereco.setBairro(request.getParameter("bairro"));

            try {
                boolean statusCadastro = cd.cadastrarCliente(cl); // cadastro os dados do cliente
                ed.cadastrarEndereco(endereco, cl.getCpf()); // cadastra o endereço do cliente
                if (statusCadastro == true) {
                    sd.enviarEmailParaConfimarOCadastro(cl);
                }

            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            response.sendRedirect("ServletListarProdutos?acao=listar");
        }

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
