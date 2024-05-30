using DAL.Interfaces;
using MimeKit;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Options;
using System;
using Model;
using System.Globalization;

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
            message.From.Add(new MailboxAddress(Ten, _mailSettings.SenderEmail));
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

        public void SendOrderEmail(string toEmail, string confirmationLink, long? Ship, string Ten, string HoTen, string DiaChi, string SDT, int? ID, List<ChiTietDonHangModel> model)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress(Ten, _mailSettings.SenderEmail));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = "Thông tin đơn hàng đặt tại " + Ten;

            var bodyBuilder = new BodyBuilder();
            string htmlContent = $@"
                <h2 style='text-align: center;'>Cảm ơn bạn đã đặt hàng tại {Ten}</h2>
                <p>Xin chào {HoTen},</p>
                <p>Dưới đây là chi tiết đơn hàng của bạn:</p>
                <table align='center' border='1' cellpadding='0' cellspacing='0' style='width: 80%; table-layout: fixed; border-collapse: collapse; margin: 0 auto;'>
                    <thead>
                        <tr>
                            <th style='padding: 10px; border: 1px solid #ddd;'>Sản phẩm</th>
                            <th style='padding: 10px; border: 1px solid #ddd;'>Số lượng</th>
                            <th style='padding: 10px; border: 1px solid #ddd;'>Giá</th>
                            <th style='padding: 10px; border: 1px solid #ddd;'>Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody>";

                    decimal totalOrderAmount = 0;

                    foreach (var item in model)
                    {
                        var itemTotal = item.SoLuong * item.Gia;
                        totalOrderAmount += itemTotal;

                        htmlContent += $@"
                        <tr>
                            <td style='padding: 10px; border: 1px solid #ddd; text-align:center;'>{item.TenSanPham}</td>
                            <td style='padding: 10px; border: 1px solid #ddd; text-align:center;'>{item.SoLuong}</td>
                            <td style='padding: 10px; border: 1px solid #ddd; text-align:center;'>{item.Gia.ToString("N0", new CultureInfo("vi-VN"))} VNĐ</td>
                            <td style='padding: 10px; border: 1px solid #ddd; text-align:center;'>{itemTotal.ToString("N0", new CultureInfo("vi-VN"))} VNĐ</td>
                        </tr>";
                    }

                    htmlContent += $@"
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan='3' style='padding: 10px; border: 1px solid #ddd; text-align: center;'><strong>Phí giao hàng:</strong></td>
                            <td style='padding: 10px; border: 1px solid #ddd; text-align: center;'><strong>{Ship?.ToString("N0", new CultureInfo("vi-VN"))} VNĐ</strong></td>
                        </tr>
                        <tr>
                            <td colspan='3' style='padding: 10px; border: 1px solid #ddd; text-align: center;'><strong>Tổng hoá đơn:</strong></td>
                            <td style='padding: 10px; border: 1px solid #ddd; text-align: center;'><strong>{(totalOrderAmount + Ship)?.ToString("N0", new CultureInfo("vi-VN"))} VNĐ</strong></td>
                        </tr>
                    </tfoot>
                </table>
                <p>Địa chỉ giao hàng: {DiaChi}</p>
                <p>Số điện thoại liên hệ: {SDT}</p>
                <p>Bạn có thể tra cứu đơn hàng của bạn <a href='{confirmationLink}?id={ID}'>tại đây</a>.</p><p> Xin chân thành cảm ơn!</p> ";

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
