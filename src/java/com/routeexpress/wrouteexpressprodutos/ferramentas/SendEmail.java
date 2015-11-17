package com.routeexpress.wrouteexpressprodutos.ferramentas;

import com.routeexpress.wrouteexpressprodutos.cliente.Cliente;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public void sendHtmlEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setContent(message, "text/html");

        // sends the e-mail
        Transport.send(msg);

    }

    /**
     * Test the send html e-mail method
     *
     */
    public void enviarEmailParaConfimarOCadastro(Cliente cliente) {
        // SMTP server information
        String host = "smtp.gmail.com";
        String port = "587";

        // Endereco de Email pertecente a equipe de BackOffice do e-commerce
        String mailFrom = "routeexpressholder@gmail.com";
        // Senha do Email pertecente a equipe de BackOffice do e-commerce
        String password = "reh0lder";

        // outgoing message information
        String mailTo = cliente.getEmail();
        String subject = "Route Express - Confirmaçao de Cadastro";

        // message contains HTML markups
        String message = "<h1>Olá, '" + cliente.getfirstNome() + "'</h1>"
                + "<p>Obrigado por se cadastrar na Route Express!</p>"
                + "<p>Segue abaixo algumas informações importantes para o acesso ao site, anote em um lugar segure!</p>"
                + "<p>Email: " + cliente.getEmail() + "</p>"
                + "<p>Senha: " + cliente.getSenha() + "</p>"
                + "<h3>Obrigado, Grupo Route Express</h3>";

        SendEmail mailer = new SendEmail();

        try {
            mailer.sendHtmlEmail(host, port, mailFrom, password, mailTo,
                    subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }
    }

    /**
     * Test the send html e-mail method
     *
     */
    public void enviarEmailParaOUsuarioRedefinirSuaSenha(String emailUsuario) {
        // SMTP server information
        String host = "smtp.gmail.com";
        String port = "587";
        // Endereco de Email pertecente a equipe de BackOffice do e-commerce
        String mailFrom = "routeexpressholder@gmail.com";
        // Senha do Email pertecente a equipe de BackOffice do e-commerce
        String password = "reh0lder";

        // outgoing message information
        String mailTo = emailUsuario;
        String subject = "Route Express - Redefinicao de senha";

        // message contains HTML markups
        String message = "<h1>Clique no link para redefinir sua senha;</h1>";

        SendEmail mailer = new SendEmail();

        try {
            mailer.sendHtmlEmail(host, port, mailFrom, password, mailTo,
                    subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }
    }
}
