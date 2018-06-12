using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebMauGiao.Service.Infrastructure;
using WebMauGiao.Service.Models;

namespace WebMauGiao.Service.Service
{
    public class F_USER : RepositoryBase<USER>
    {
        MGDbContext db = null;
        public F_USER()
        {
            db = new MGDbContext();
        }
        public long Login(string username, string password)
        {
            var dbEntry = db.USERs.SingleOrDefault(p => p.UserName == username);
            if(dbEntry != null)
            {
                if (dbEntry.PassWord == password) return (long)dbEntry.UserID;
                return -1;
            }
            return 0;
        }
    }
}
