using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMauGiao.Controllers
{
    public class StudentController : SecurityController
    {
        // GET: Student
        public ActionResult ListStudent()
        {
            return View();
        }
        public ActionResult RollCall()
        {
            return View();
        }
        public ActionResult ClassArranger()
        {
            return View();
        }
    }
}