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

        public void SendConfirmationEmail(string toEmail, string confirmationLink, string token)
        {
            _emailDAL.SendConfirmationEmail(toEmail, confirmationLink, token);
        }
    }
}
