﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IEmailBLL
    {
        void SendConfirmationEmail(string toEmail, string confirmationLink, string token, string Ten);
        void SendOrderEmail(string toEmail, string confirmationLink, string Ten, int ID);
    }

}
