package FC.servlet;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSenderServlet {

   final String fromEmail = "lakshanh23773@gmail.com";
    final String password = "isja elrg pdro ldlf";

    public String sendEmail(String toEmail, String subject, String messageText) {
        // SMTP configuration
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // Port for TLS
        props.put("mail.smtp.auth", "true"); // Enable Authentication
        props.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // Force TLSv1.2

        // Authenticate and send email
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        session.setDebug(true); // Enable debugging for detailed logs

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject(subject);
            message.setText(messageText);

            // Send the email
            Transport.send(message);
            return "Please check your email inbox.";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "Error while sending email: " + e.getMessage();
        }
    }

    public static void main(String[] args) {
        EmailSenderServlet emailSender = new EmailSenderServlet();
        String result = emailSender.sendEmail(
            "recipient@example.com", // Replace with recipient's email
            "Test Subject",
            "This is a test email sent using JavaMail."
        );
        System.out.println(result);
    }
}