using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMauGiao.Common
{
    [Serializable]
    public class UserLogin
    {
        public long UserID { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
        public long VaiTro { get; set; }
    }
}