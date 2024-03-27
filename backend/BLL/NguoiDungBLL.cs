using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Model;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net.Sockets;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NguoiDungBLL : INguoiDungBLL
    {
        private INguoiDungDAL _res;
        private string Secret;
        public NguoiDungBLL(INguoiDungDAL res, IConfiguration configuration)
        {
            _res = res;
            Secret = configuration["AppSettings:Secret"];
        }
        public NguoiDungModel Login(string TaiKhoan, string MatKhau)
        {
            var nguoidung = _res.Login(TaiKhoan, MatKhau);

            if (nguoidung == null)
                return null;

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, nguoidung.Ten.ToString()),
                    new Claim(ClaimTypes.Email, nguoidung.Email.ToString()),
                    new Claim(ClaimTypes.StreetAddress, nguoidung.DiaChi.ToString()),
                    new Claim(ClaimTypes.MobilePhone, nguoidung.SDT.ToString()),
                    new Claim(ClaimTypes.Role, nguoidung.IDQuyen.ToString())
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            nguoidung.Token = tokenHandler.WriteToken(token);

            return nguoidung;
        }
        public NguoiDungModel Check(string TaiKhoan, string Email)
        {
            return _res.Check(TaiKhoan, Email);
        }
        public List<NguoiDungModel> GetAll(int pageIndex, int pageSize, out int total, string Ten, int? IDQuyen)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten, IDQuyen);
        }
        public NguoiDungModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(NguoiDungModel model)
        {
            return _res.Create(model);
        }
        public bool Update(NguoiDungModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
        public bool ConfirmEmail(string token)
        {
            return _res.ConfirmEmail(token);
        }
    }
}
