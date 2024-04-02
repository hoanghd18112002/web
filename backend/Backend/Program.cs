using DAL.Helper.Interfaces;
using DAL.Helper;
using DAL.Interfaces;
using BLL.Interfaces;
using BLL;
using DAL;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using OfficeOpenXml;
using MailKit;
using Model;

var builder = WebApplication.CreateBuilder(args);

// Cấu hình xác thực người dùng
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

// configure strongly typed settings objects
var appSettingsSection = builder.Configuration.GetSection("AppSettings");
builder.Services.Configure<AppSettings>(appSettingsSection);
// configure jwt authentication
var appSettings = appSettingsSection.Get<AppSettings>();
var key = Encoding.ASCII.GetBytes(appSettings.Secret);
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});

// Add services to the container.
builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();

builder.Services.AddTransient<IChiTietDonHangDAL, ChiTietDonHangDAL>();
builder.Services.AddTransient<IChiTietDonHangBLL, ChiTietDonHangBLL>();

builder.Services.AddTransient<IChiTietHoaDonNhapDAL, ChiTietHoaDonNhapDAL>();
builder.Services.AddTransient<IChiTietHoaDonNhapBLL, ChiTietHoaDonNhapBLL>();

builder.Services.AddTransient<IDieuKhoanDAL, DieuKhoanDAL>();
builder.Services.AddTransient<IDieuKhoanBLL, DieuKhoanBLL>();

builder.Services.AddTransient<IDonHangDAL, DonHangDAL>();
builder.Services.AddTransient<IDonHangBLL, DonHangBLL>();

builder.Services.AddTransient<IGiamGiaDAL, GiamGiaDAL>();
builder.Services.AddTransient<IGiamGiaBLL, GiamGiaBLL>();

builder.Services.AddTransient<IGiaSanPhamDAL, GiaSanPhamDAL>();
builder.Services.AddTransient<IGiaSanPhamBLL, GiaSanPhamBLL>();

builder.Services.AddTransient<IGioiThieuDAL, GioiThieuDAL>();
builder.Services.AddTransient<IGioiThieuBLL, GioiThieuBLL>();

builder.Services.AddTransient<IHoaDonNhapDAL, HoaDonNhapDAL>();
builder.Services.AddTransient<IHoaDonNhapBLL, HoaDonNhapBLL>();

builder.Services.AddTransient<ILienHeDAL, LienHeDAL>();
builder.Services.AddTransient<ILienHeBLL, LienHeBLL>();

builder.Services.AddTransient<ILoaiSanPhamDAL, LoaiSanPhamDAL>();
builder.Services.AddTransient<ILoaiSanPhamBLL, LoaiSanPhamBLL>();

builder.Services.AddTransient<IMenuDAL, MenuDAL>();
builder.Services.AddTransient<IMenuBLL, MenuBLL>();

builder.Services.AddTransient<INguoiDungDAL, NguoiDungDAL>();
builder.Services.AddTransient<INguoiDungBLL, NguoiDungBLL>();

builder.Services.AddTransient<INhaCungCapDAL, NhaCungCapDAL>();
builder.Services.AddTransient<INhaCungCapBLL, NhaCungCapBLL>();

builder.Services.AddTransient<INhaSanXuatDAL, NhaSanXuatDAL>();
builder.Services.AddTransient<INhaSanXuatBLL, NhaSanXuatBLL>();

builder.Services.AddTransient<IPhuongThucThanhToanDAL, PhuongThucThanhToanDAL>();
builder.Services.AddTransient<IPhuongThucThanhToanBLL, PhuongThucThanhToanBLL>();

builder.Services.AddTransient<IQuyenDAL, QuyenDAL>();
builder.Services.AddTransient<IQuyenBLL, QuyenBLL>();

builder.Services.AddTransient<ISanPhamDAL, SanPhamDAL>();
builder.Services.AddTransient<ISanPhamBLL, SanPhamBLL>();

builder.Services.AddTransient<ISlideDAL, SlideDAL>();
builder.Services.AddTransient<ISlideBLL, SlideBLL>();

builder.Services.AddTransient<IThongKeDAL, ThongKeDAL>();
builder.Services.AddTransient<IThongKeBLL, ThongKeBLL>();

builder.Services.AddTransient<IThongSoDAL, ThongSoDAL>();
builder.Services.AddTransient<IThongSoBLL, ThongSoBLL>();

builder.Services.AddTransient<ITinTucDAL, TinTucDAL>();
builder.Services.AddTransient<ITinTucBLL, TinTucBLL>();

//Cấu hình execl
ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

//Cấu hình mail
builder.Services.Configure<MailSettings>(builder.Configuration.GetSection("MailSettings"));
builder.Services.AddTransient<IEmailDAL, EmailDAL>();
builder.Services.AddTransient<IEmailBLL, EmailBLL>();

//Cấu hình VnPay
builder.Services.AddTransient<IVnPayDAL, VnPayDAL>();
builder.Services.AddTransient<IVnPayBLL, VnPayBLL>();
builder.Services.AddHttpContextAccessor();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Routing
app.UseRouting();
app.UseCors(x => x
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());
app.UseAuthentication();
app.UseAuthorization();

app.UseAuthorization();

app.MapControllers();

app.Run();