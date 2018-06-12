using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebMauGiao.Service.Infrastructure;
using WebMauGiao.Service.Models;

namespace WebMauGiao.Service.Service
{
    public class F_EMPLOYEE : RepositoryBase<EMPLOYEE>
    {
        MGDbContext db = null;
        public F_EMPLOYEE()
        {
            db = new MGDbContext();
        }
        public List<string> GetListCredential(long RoleID)
        {
            if (RoleID == 0) return db.PERMISSONs.Select(p => p.PermissionName).ToList();
            return (from a in db.ROLEs
                    join b in db.ROLE_PERMISSION on a.RoleID equals b.RoleID
                    join c in db.PERMISSONs on b.PermissionID equals c.PermissionID
                    where a.RoleID == RoleID
                    select c.PermissionName).ToList();
        }
    }
}
