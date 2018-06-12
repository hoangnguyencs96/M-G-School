using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Common;

namespace WebMauGiao.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        [HasCredential(RoleID ="XEM_DIEMDANH")]
        public ActionResult Index()
        {
            return View();
        }
        [HasCredential(RoleID ="XEM_BANGTHUCHI")]
        public ActionResult Index_snd()
        {
            return View();
        }
    }
}