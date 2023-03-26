using MailKit.Security;
using MimeKit.Text;
using MimeKit;
using System;
using MailKit.Net.Smtp;

namespace QuizHoot.Services
{
    public class EmailService
    {
        public void SendEmail(string To, string Subject, string Body)
        {
            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("QuizApp", "hungnthe153039@fpt.edu.vn"));
            email.To.Add(MailboxAddress.Parse(To));
            email.Subject = Subject;
            email.Body = new TextPart(TextFormat.Html) { Text = Body };

            using var smtp = new SmtpClient();
            try
            {
                smtp.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                smtp.Authenticate("hungnthe153039@fpt.edu.vn", "gtewhnkkpwdhaiqw");
                smtp.Send(email);
            }
            catch (Exception) { }
            finally { smtp.Disconnect(true); }
        }

    }
}
