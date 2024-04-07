using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class EmailBLL : IEmailBLL
    {
        private readonly IEmailDAL _emailDAL;

        public EmailBLL(IEmailDAL emailDAL)
        {
            _emailDAL = emailDAL;
        }

        public void SendConfirmationEmail(string toEmail, string confirmationLink, string token, string Ten)
        {
            _emailDAL.SendConfirmationEmail(toEmail, confirmationLink, token, Ten);
        }

        public void SendOrderEmail(string toEmail, string confirmationLink, string Ten, string HoTen, string DiaChi, string SDT, int? ID, List<ChiTietDonHangModel> model)
        {
            _emailDAL.SendOrderEmail(toEmail, confirmationLink, Ten, HoTen, DiaChi, SDT, ID, model);
        }
    }
}
