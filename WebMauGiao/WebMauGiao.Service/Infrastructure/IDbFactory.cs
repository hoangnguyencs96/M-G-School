using WebMauGiao.Service.Models;
using System;

namespace WebMauGiao.Service.Infrastructure
{
    public interface IDbFactory : IDisposable
    {
        MGDbContext Init();
    }
}