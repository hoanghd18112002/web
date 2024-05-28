using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IEmailDAL
    {
        void SendConfirmationEmail(string toEmail, string confirmationLink, string token, string Ten);
        void SendOrderEmail(string toEmail, string confirmationLink, long? Ship, string Ten, string HoTen, string DiaChi, string SDT, int? ID, List<ChiTietDonHangModel> model);
    }
}
