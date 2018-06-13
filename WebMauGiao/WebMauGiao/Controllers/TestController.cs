using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Filters;

namespace WebMauGiao.Controllers
{
    public class TestController : SecurityController
    {
        // GET: Test
        [HasAuthentication(_role = "XEM_DIEMDANH")]
        public ActionResult Index()
        {
            return View();
        }
        [HasAuthentication(_role = "XEM_BANGTHUCHI")]
        public ActionResult Index_snd()
        {
            return View();
        }
    }
}