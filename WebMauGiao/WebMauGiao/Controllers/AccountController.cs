using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Filters;
using WebMauGiao.Service.Service;
using WebMauGiao.Service.Models;

namespace WebMauGiao.Controllers
{
    [HasAuthentication(_role = "ADMIN")]
    public class AccountController : SecurityController
    {        // GET: Account
        
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            ViewBag.NhanVien = new F_EMPLOYEE().GetAll().ToList();
            return View();
        }

        public JsonResult AddUser(string username, string password, long employeeid, int usertype)
        {
            USER usr = new USER();
            usr.UserName = username;
            usr.PassWord = GetMD5(password);
            usr.EmployeeID = employeeid;
            usr.UserType = usertype;
            usr.Status = true;
            var res = new F_USER().AddUser(usr);
            return Json(new
            {
                status = res
            });
        }
        private String GetMD5(string txt)
        {
            String str = "";
            Byte[] buffer = System.Text.Encoding.UTF8.GetBytes(txt);
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            buffer = md5.ComputeHash(buffer);
            foreach (Byte b in buffer)
            {
                str += b.ToString("X2");
            }
            return str;
        }
    }
}