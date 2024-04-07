using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IEmailBLL
    {
        void SendConfirmationEmail(string toEmail, string confirmationLink, string token, string Ten);
        void SendOrderEmail(string toEmail, string confirmationLink, string Ten, string HoTen, string DiaChi, string SDT, int? ID, List<ChiTietDonHangModel> model);
    }

}
