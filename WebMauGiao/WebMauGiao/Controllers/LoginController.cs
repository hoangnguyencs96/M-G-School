using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Common;
using WebMauGiao.Filters;
using WebMauGiao.Service.Models;
using WebMauGiao.Service.Service;


namespace WebMauGiao.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(string username, string password)
        {
            ViewBag.Notif = null;
            if (ModelState.IsValid)
            {
                F_USER fnc = new F_USER();
                var userid = fnc.Login(username, GetMD5(password));
                if(userid == 0)
                {
                    ViewBag.Notif = "Đăng nhập thất bại";
                    return View("Index");
                }
                if(userid == -1)
                {
                    ViewBag.Notif = "Mật khẩu không đúng";
                    return View("Index");
                }
                else
                {
                    F_EMPLOYEE f = new F_EMPLOYEE();                   
                    USER usr = fnc.GetSingleById(userid);
                    
                    var user_session = new UserLogin();
                    if (usr.UserType == 0) user_session.VaiTro = 0;
                    else
                    {
                        EMPLOYEE emp = f.GetSingleById((long)usr.EmployeeID);
                        user_session.VaiTro = (long)emp.RoleID;
                    }
                    user_session.UserID = usr.UserID;
                    var ListCredential = f.GetListCredential(user_session.VaiTro);

                    Session.Add(CommonConstants.USER_SESSION, user_session);
                    Session.Add(CommonConstants.SESSION_CREDENTIAL, ListCredential);
                    var _authModule = new AuthenticationModule();
                    Session.Add("Authorization", _authModule.GenerateTokenForUser(user_session.UserID.ToString(), "dsd"));
                    return RedirectToAction("Index", "Home");
                }                
            }
            return View("Index");
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return View("Index");
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
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session != null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "Home", action = "Index" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}