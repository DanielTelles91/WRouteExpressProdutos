package com.routeexpress.wrouteexpressprodutos.loginsessao;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import com.routeexpress.wrouteexpressprodutos.clientedao.ClienteDAOLogin;
import static com.routeexpress.wrouteexpressprodutos.ferramentas.SHA1.gerarHashSenhaPBKDF2;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

   

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        Cliente cliente = new Cliente();
        ClienteDAOLogin clienteDAOLogin = new ClienteDAOLogin();
        // get request parameters for userID and password

        cliente.setEmail(request.getParameter("email"));
        cliente.setSenha(request.getParameter("key"));
        cliente.setCpf(request.getParameter("recovery-cpf"));
        String cpff = "";
        //Condicao para que seja enviado um email ao usuario caso seu cpf esteja correto
        if (cliente.getEmail() == null && !cliente.getCpf().equals("")) {
        }
        //Condicao para que o usuario possa fazer sua autentificacao no sistema
        if (cliente.getEmail() != null) {
            //Atributo senha que indica se o usuario passou um login existente ou nao na base de dados 
            String senha = clienteDAOLogin.consultaAExistenciaDoLoginDeUsuarioDuranteAAutentificacao(cliente);
            //Caso a senha seja nula esse login de usuario nao consta na base de dados 
            if (senha == null) {
                //Usuario nao encontrado
                //Senao se a senha for diferente de nulo
            } else {
                try {
                    String senhaLogin = String.copyValueOf(gerarHashSenhaPBKDF2(cliente.getSenha())); //usuario.getSenha()
                    System.out.println("Teste2:" + senhaLogin);
                    if (senhaLogin.equals(senha)) {
                        //Se identica atribua a senha retornada durante a consulta de
                        //existencia de um login no banco ao usuario para que se prossiga a
                        //autentificacao verificando se login e senha pertecem ao mesmo registro
                        cliente.setSenha(senha);
                        //Se as senhas forem iguais pergunte se login e senha pertecem ao mesmo usuario
                        //Caso a situacao seja verdadeira carregue um usuario como todos seus dados presentes no banco
                        Cliente usuarioRetorno = clienteDAOLogin.autentificaUsuarioDoSistema(cliente);

                        if (usuarioRetorno != null) {
                            HttpSession session = request.getSession();
                            String user = usuarioRetorno.getfirstNome();
                            cpff = usuarioRetorno.getCpf();
                            String email = usuarioRetorno.getEmail();
                            session.setAttribute("usuario", usuarioRetorno);
                            session.setAttribute("user", user);
                            session.setAttribute("cpff", cpff);
                            session.setAttribute("email", email);
                            //setting session to expiry in 30 mins
                            session.setMaxInactiveInterval(15 * 60000);
                            Cookie userName = new Cookie("user", user);
                            userName.setMaxAge(30 * 60);
                            response.addCookie(userName);
                            response.sendRedirect("ServletListarProdutos?acao=listar");

                        }
                        //Senao for igual apresente a mensagem de que a senha esta incorreta
                    } else {
                        //Senha Invalida
                    }
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (InvalidKeySpecException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/loginusuario.html");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Either user name or password is wrong.</font>");
            rd.include(request, response);
        }

    }

}
