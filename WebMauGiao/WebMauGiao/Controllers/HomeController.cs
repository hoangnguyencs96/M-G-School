using WebMauGiao.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Service.Service;

namespace WebMauGiao.Controllers
{
    public class HomeController : SecurityController
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Error()
        {
            return View();
        }
        [HasAuthentication(_role ="ADMIN")]
        public ActionResult ViewLog()
        {
            return View(new F_LOG().GetAll().ToList());
        }
    }
}