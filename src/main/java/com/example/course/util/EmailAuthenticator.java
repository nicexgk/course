package com.example.course.util;

import java.net.Authenticator;
import java.util.Properties;

public class EmailAuthenticator extends Authenticator {
    private String username = "";
    private String password = "";


}

// class MailKit {
//    public static void sendMail(String mailTo, String title, String code) {
//        String from = Static.MAIL_FROM;
//        Properties props = System.getProperties();
//        props.setProperty("mail.smtp.host", "smtp.126.com");
//        props.setProperty("mail.smtp.auth", "true");
//        Session session = Session.getInstance(props);
//        MimeMessage message = new MimeMessage(session);
//        try {
//            message.setFrom(new InternetAddress(from));
//            message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(mailTo));
//            message.setSubject(title);
//            message.setContent("<h1>此邮件为官方激活邮件！请点击下面链接完成激活操作！" + code + "</h1>", "text/html;charset=UTF-8");
//            Transport transport = session.getTransport("smtp");
//            transport.connect(Static.MAIL_HOST, Static.MAIL_USER, Static.MAIL_PASSWORD);
//            transport.sendMessage(message, message.getAllRecipients());
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//    }
//}