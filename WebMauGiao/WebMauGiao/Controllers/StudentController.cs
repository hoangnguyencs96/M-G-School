using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Service.Service;
using WebMauGiao.Service.Models;

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
            ViewBag.ListClass = new F_CLASS().GetAll().ToList();
            return View();
        }
        public ActionResult ClassArranger()
        {
            return View();
        }

        #region RollCall_Function


        public JsonResult GetStudentByClass(int classid)
        {
            var data = new F_STUDENT().GetAll().Where(x => x.ClassID == classid).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAbsence(int studentid, int month, int year)
        {
            var data = new F_ABSENCE().GetAbsenceByClass(studentid, month, year).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult UpdateAbsence(long absenceid, long studentid, DateTime date, string reasons)
        {
            ABSENCE item = new ABSENCE();
            var f = new F_ABSENCE();
            item = f.GetSingleById(absenceid);
            item.StudentID = studentid;
            item.Date = date;
            item.Reasons = reasons;
            f.Update(item);
            f.Save();

            return Json(new { status = true });
        }
        public JsonResult DeleteAbsence(long absenceid)
        {
            var f = new F_ABSENCE();
            var item = f.GetSingleById(absenceid);
            f.Delete(item);
            f.Save();
            return Json(new { status = true });
        }
        public JsonResult AddAbsence(long studentid, DateTime date, string reasons)
        {
            ABSENCE item = new ABSENCE();
            item.StudentID = studentid;
            item.Date = date;
            item.Reasons = reasons;
            var f = new F_ABSENCE();
            f.Add(item);
            f.Save();
            var res = item.AbsenceID;
            return Json(new { value = res });
        }

        #endregion
    }
}