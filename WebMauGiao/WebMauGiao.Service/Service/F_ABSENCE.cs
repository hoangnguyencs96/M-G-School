using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebMauGiao.Service.Infrastructure;
using WebMauGiao.Service.Models;

namespace WebMauGiao.Service.Service
{
    public class F_ABSENCE : RepositoryBase<ABSENCE>
    {
        MGDbContext db = null;
        public F_ABSENCE()
        {
            db = new MGDbContext();
        }
        public List<ABSENCE> GetAbsenceByClass(int studentid, int month, int year)
        {
            DateTime? _start = new DateTime();
            string s_start = month < 10 ? "01/0" + month.ToString() + "/" + year.ToString() : "01/" + month.ToString() + "/" + year.ToString();
            CultureInfo ci = CultureInfo.InvariantCulture;
            _start = DateTime.ParseExact(s_start, "dd/MM/yyyy", ci);

            DateTime? _end = new DateTime();
            string day_of_month = DateTime.DaysInMonth(year, month).ToString();
            string s_end = month < 10 ? day_of_month + "/0" + month.ToString() + "/" + year.ToString() : day_of_month + "/" + month.ToString() + "/" + year.ToString();
            _end = DateTime.ParseExact(s_end, "dd/MM/yyyy", ci);
           
            return db.ABSENCEs.Where(x => x.Date >= _start && x.Date <= _end && x.StudentID == studentid).OrderBy(x=>x.Date).ToList();
        }
    }
}
