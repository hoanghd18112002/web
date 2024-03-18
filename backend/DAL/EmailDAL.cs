using DAL.Interfaces;
using MimeKit;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Options;
using System;
using Model;

namespace DAL
{
    public class EmailDAL : IEmailDAL
    {
        private readonly MailSettings _mailSettings;

        public EmailDAL(IOptions<MailSettings> mailSettings)
        {
            _mailSettings = mailSettings.Value;
        }

        public void SendConfirmationEmail(string toEmail, string confirmationLink, string token)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress(_mailSettings.SenderName, _mailSettings.SenderEmail));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = "Xác nhận email đăng ký Galio";

            var bodyBuilder = new BodyBuilder();
            bodyBuilder.HtmlBody = $"Cảm ơn bạn đã đăng ký,<br/><br/>Vui lòng nhấp vào liên kết sau để xác nhận email của bạn: <a href='{confirmationLink}?token={token}'>Xác nhận</a>";
            message.Body = bodyBuilder.ToMessageBody();

            using (var client = new SmtpClient())
            {
                client.Connect(_mailSettings.Server, _mailSettings.Port, false);
                client.Authenticate(_mailSettings.SenderEmail, _mailSettings.Password);
                client.Send(message);
                client.Disconnect(true);
            }
        }
    }
}
