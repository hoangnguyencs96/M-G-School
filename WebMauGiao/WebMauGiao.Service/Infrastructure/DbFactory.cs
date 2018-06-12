using WebMauGiao.Service.Models;

namespace WebMauGiao.Service.Infrastructure
{
    public class DbFactory : IDbFactory
    {
        private MGDbContext dbContext;

        public void Dispose()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }

        public MGDbContext Init()
        {
            return dbContext ?? (dbContext = new MGDbContext());
        }
    }
}