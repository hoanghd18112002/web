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

        public void SendConfirmationEmail(string toEmail, string confirmationLink, string token, string Ten)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress(_mailSettings.SenderName, _mailSettings.SenderEmail));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = "Xác nhận email đăng ký " + Ten;

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

        public void SendOrderEmail(string toEmail, string confirmationLink, string Ten, int ID)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress(_mailSettings.SenderName, _mailSettings.SenderEmail));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = "Thông tin đơn hàng";

            var bodyBuilder = new BodyBuilder();
            bodyBuilder.HtmlBody = $"Cảm ơn bạn đã tin tưởng đặt hàng {Ten},<br/><br/>Mã đơn hàng của bạn là: {ID}<br/><br/>Bạn có thể tra cứu đơn hàng của bạn <a href='{confirmationLink}?id={ID}'>Tại đây</a>";
            message.Body = bodyBuilder.ToMessageBody();

            using (var client = new SmtpClient())
            {
                client.Connect(_mailSettings.Server, _mailSettings.Port, false);
                client.Authenticate(_mailSettings.SenderEmail, _mailSettings.Password);
                client.Send(message);
                client.Disconnect(true);
            }
        }

        public void SendOrderEmail(string toEmail, string confirmationLink, string Ten, string HoTen, string DiaChi, string SDT, int? ID, List<ChiTietDonHangModel> model)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress(_mailSettings.SenderName, _mailSettings.SenderEmail));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = "Thông tin đơn hàng đặt tại " + Ten;

            var bodyBuilder = new BodyBuilder();
            string htmlContent = @"
                <h2>Cảm ơn bạn đã đặt hàng tại " + Ten + @"</h2>
                <p>Xin chào " + HoTen + @",</p>
                <p>Dưới đây là chi tiết đơn hàng của bạn:</p>
                <table border='1'>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                    </tr>";
                    foreach (var item in model)
                    {
                        htmlContent += @"
                    <tr>
                        <td>" + item.TenSanPham + @"</td>
                        <td>" + item.SoLuong + @"</td>
                        <td>" + item.Gia + @" đ</td>
                    </tr>";
                    }
                    htmlContent += @"
                </table>
                <p>Địa chỉ giao hàng: " + DiaChi + @"</p>
                <p>Số điện thoại liên hệ: " + SDT + @"</p>
                <p>Bạn có thể tra cứu đơn hàng của bạn <a href='" + confirmationLink + "?id=" + ID + "'>Tại đây</a></p><p> Xin chân thành cảm ơn!</ p > ";

            bodyBuilder.HtmlBody = htmlContent;
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
