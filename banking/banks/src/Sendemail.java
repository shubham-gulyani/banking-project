import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sendgrid.*;
import java.io.*;
/**
 * Servlet implementation class Sendemail
 */
@WebServlet("/Sendemail")
public class Sendemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Sendemail() {        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw=response.getWriter();
		try
		{
			Properties props = new Properties();
			
			props.put("mail.smtp.host", "smtp.sendgrid.net");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

		SendGrid sendgrid = new SendGrid("m_rawat_miet", "gfc27wonder");

	    SendGrid.Email email = new SendGrid.Email();

	    email.addTo("m_rawat1976@yahoo.com");
	    email.setFrom("m_rawat_miet@sendgrid.net");
	    email.setSubject("Sending with SendGrid is Fun");
	    email.setHtml("sending message");

	    SendGrid.Response res = sendgrid.send(email);
	    pw.println(res.getMessage());
	    
		}catch(Exception e){
			pw.println(e);
		}
	}
}
